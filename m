Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DE3C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 03:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 552358148A;
	Tue,  5 Apr 2022 03:17:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WbbGVsI5_0qV; Tue,  5 Apr 2022 03:17:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E23F81C21;
	Tue,  5 Apr 2022 03:17:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D60E1BF33D
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 03:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B97181C21
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 03:17:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uu4xQYWklyuN for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 03:17:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8584081C20
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 03:17:31 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id k25so13680553iok.8
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 20:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3/RIV+1IIfqnltcVwyPuRX9bD2Iq5P2f2JGycKQKvb0=;
 b=gl59I482zBluLszba6tVo8McumlE5wv7xCfAimNch9k0SgUJv7xIf6cBsteGwbPint
 x5b6NUXcP2beHgEAkvyLqwrsFGU9VVoxJM7U/yaQmadBrNNainVDjBvU+EjzMs4TX98T
 KpvmgHL0MFOg5YnTCohdQVT4CShhLaQ047rdItIY0dsvjDi1n2oid2K0iufXLqE2MQNv
 uosXC4sQtVpo6xc+IOlrRzoXyS+3Sj/aNrRWN42orLgGB0ihKKf+6PK5vJO4uY+3BSWG
 wPdWQTysvDdSZYuVUYWs+iEs+iTthUpJNA4uq60GgK3g7x2ZDcDLlV6fsvd7WEHnppu9
 MIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3/RIV+1IIfqnltcVwyPuRX9bD2Iq5P2f2JGycKQKvb0=;
 b=zjd0l0toDq9mna+Xj0EmmB+o3in5UissTS9Vn29Zv0nLADy2JbGY3hdDWfxYC0E/q5
 QyVyL7nDk+A0LWS1S6lotrO3ukm5VhU9Fewqrxn4TX8RmDPLwEeXnaTNxG7e/afZg/9y
 rUCaNSvd09S4ZOQT45hGvTX9NzH66eSublVHkTEM+9GwV4frhDVoy0PxobrU7OUFQx4I
 Op14aX2m9qciNkiWKYc58eHB8UgR0SlzCXwUKg9AcADvZKb4uPz5ZU04vcakPiw6WIKE
 uBBh6msyFUKjMCZfT1XR95wOV/nKjDeqxh7IIaMxgQpCi8grDRalQGCu6evKqbjJD22D
 4fDA==
X-Gm-Message-State: AOAM531rGEUioDBfpmKiKxGuX63eQRjS8vScxXSJw7vrYDwYjl/YgzZY
 resDm+9QOKF6kAvjAioth8iASItinKd3qQ==
X-Google-Smtp-Source: ABdhPJz3iU2haV9Goj5lj2VLNbG0crAlxFxyNyS3O7J6U/HRQPIjYKguqfJqIGbnibTDBzgDfVDjJg==
X-Received: by 2002:a05:6602:122a:b0:649:5df1:36f0 with SMTP id
 z10-20020a056602122a00b006495df136f0mr720156iot.214.1649128650431; 
 Mon, 04 Apr 2022 20:17:30 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 j13-20020a056e02014d00b002c98acb8d32sm6723356ilr.45.2022.04.04.20.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 20:17:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Apr 2022 21:16:41 -0600
Message-Id: <20220405031641.685678-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/1] utils/genrandconfig: add randconfig
 based --no-toolchains-csv option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently we only test a limited set of toolchains that are mostly
prebuilt, add a flag to allow using randconfig for randomizing
additional toolchain settings instead of randpackageconfig.

To avoid invalid configs we need to add additional config validation
filtering and fixups.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - properly check exit codes
Changes v1 -> v2:
  - refactor fixup_config control flow
---
 utils/genrandconfig | 54 +++++++++++++++++++++++++++++++--------------
 1 file changed, 37 insertions(+), 17 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 3483d55c14..c2919e5798 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -315,6 +315,10 @@ def fixup_config(sysinfo, configfile):
         configlines.remove('BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE=""\n')
         configlines.append('BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="%s"\n' % bootscr)
 
+    if 'BR2_ROOTFS_SKELETON_CUSTOM=y\n' in configlines and \
+       'BR2_ROOTFS_SKELETON_CUSTOM_PATH=""\n' in configlines:
+        configlines.remove('BR2_ROOTFS_SKELETON_CUSTOM=y\n')
+
     with open(configfile, "w+") as configf:
         configf.writelines(configlines)
 
@@ -331,11 +335,14 @@ def gen_config(args):
 
     sysinfo = SystemInfo()
 
-    # Select a random toolchain configuration
-    configs = get_toolchain_configs(args.toolchains_csv, args.buildrootdir)
+    if args.toolchains_csv:
+        # Select a random toolchain configuration
+        configs = get_toolchain_configs(args.toolchains_csv, args.buildrootdir)
 
-    i = randint(0, len(configs) - 1)
-    toolchainconfig = configs[i]
+        i = randint(0, len(configs) - 1)
+        toolchainconfig = configs[i]
+    else:
+        toolchainconfig = []
 
     configlines = list(toolchainconfig)
 
@@ -409,19 +416,24 @@ def gen_config(args):
         bounded_loop -= 1
         subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
                                "KCONFIG_PROBABILITY=%d" % randint(1, 20),
-                               "randpackageconfig"])
+                               "randpackageconfig" if args.toolchains_csv else "randconfig"])
 
-        if fixup_config(sysinfo, configfile):
-            break
+        if not fixup_config(sysinfo, configfile):
+            continue
 
-    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-                           "olddefconfig"])
+        if subprocess.call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
+                            "olddefconfig"]):
+            continue
 
-    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-                           "savedefconfig"])
+        if subprocess.call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
+                            "savedefconfig"]):
+            continue
 
-    return subprocess.call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-                            "dependencies"])
+        if subprocess.call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
+                            "dependencies"]):
+            continue
+        break
+    return 0
 
 
 if __name__ == '__main__':
@@ -433,10 +445,18 @@ if __name__ == '__main__':
     parser.add_argument("--buildrootdir", "-b",
                         help="Buildroot directory (relative to current directory)",
                         type=str, default='.')
-    parser.add_argument("--toolchains-csv",
-                        help="Path of the toolchain configuration file",
-                        type=str,
-                        default="support/config-fragments/autobuild/toolchain-configs.csv")
+
+    toolchains_csv = parser.add_mutually_exclusive_group(required=False)
+    toolchains_csv.add_argument("--toolchains-csv",
+                                dest="toolchains_csv",
+                                help="Path of the toolchain configuration file",
+                                type=str)
+    toolchains_csv.add_argument("--no-toolchains-csv",
+                                dest="toolchains_csv",
+                                help="Generate random toolchain configuration",
+                                action='store_false')
+    parser.set_defaults(toolchains_csv="support/config-fragments/autobuild/toolchain-configs.csv")
+
     args = parser.parse_args()
 
     # We need the absolute path to use with O=, because the relative
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

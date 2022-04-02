Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32F7C433F5
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 01:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C6A4841B6;
	Sat,  2 Apr 2022 01:06:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WNYbyhqu-J56; Sat,  2 Apr 2022 01:06:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 293E6840CC;
	Sat,  2 Apr 2022 01:06:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A5BB1BF301
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 01:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76F1F408CA
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 01:06:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KfBg1kmPqe8S for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 01:06:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7784408BB
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 01:06:11 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id h63so5062079iof.12
 for <buildroot@buildroot.org>; Fri, 01 Apr 2022 18:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=80mFpgpTuf3DOs64HT/v3KR8CrUxkBlFvUS/ShPAjlE=;
 b=aQRpHKdniBh8QuiPvqOLD6vyTnhhBNbkXxJPHhP0FK9q1b8UtRfhiUuC74XxLPMAGY
 +cDFJcfApDYavZcnu84UEz0kRVFSZTVFnLXi2JEJNRdAH+mCSVbpxVLO9+Pb9+c2mowf
 7WdqIhRUSNcLDj3W4FPi0hCu06xi3n4xWnl7StnXAqnWWU3MZ/ErlFNIQQ30cTI9w7Uv
 MyuqSg2iu+vcPwR5rB6lFUHa/7Mvn3f10nHFC+fUMZxf3bRYG1sWa2rDyQRj9HtjmTDd
 nnT/UzfbJeTo8K1GZKjqoIfTtWHlKZT31j02bBTLDCGxvKLjSHUGeIl5mB6ITNrxCAT3
 iDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=80mFpgpTuf3DOs64HT/v3KR8CrUxkBlFvUS/ShPAjlE=;
 b=P4/mEbhGzPh5Egd9kRMB4Q5dA6v9Et8Mf6AqotWVdnsscNKMRrPOQS60oZ+KsdXbk9
 0MZIKJmLk4EO78V1Y1ax4fJ/Ej0Dp4BjWsODJ3yw5sE+JLPuKCE/M1Sg3lOHaaZaeVYR
 iq9/fzJETM2plc+/jErEQg8eAuKTZVDXTrH4QIWFL5jsg+0+F83u15n/qk1Ag0znBF0z
 H9o3F0yX/nDCMU5BMPBuwRmXN/K5eqXrAwmkEfQGiGWvEtb2WVd6GhGa0028PkDJijTt
 QTc2sPMtmXF67VNAbG3pDTZwvEmCZBbmIPYrq0hpXjNRniSlEuvdncK71GdwwfrmkhKB
 XUPg==
X-Gm-Message-State: AOAM5328kKKia/QhoVHmBGxJaG5Y6SBb2kdfY1PHvQ9C0SAVn7/bk86g
 tRkt0da2wZCRmvHbRdUk4U7K7/d3q9gXag==
X-Google-Smtp-Source: ABdhPJzOLosfh6AaK8nZgjHltfOXoXphFaVSyFZO2mhW7UXF+dahQLU8ELa9YXPj5bLsEiDjuEK5pA==
X-Received: by 2002:a05:6602:2e84:b0:646:2f68:f7a5 with SMTP id
 m4-20020a0566022e8400b006462f68f7a5mr939841iow.34.1648861570670; 
 Fri, 01 Apr 2022 18:06:10 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 l14-20020a05660227ce00b00645ebb013c1sm2699872ios.45.2022.04.01.18.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 18:06:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Apr 2022 19:05:59 -0600
Message-Id: <20220402010559.410834-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: add randconfig based
 --no-toolchains-csv option
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
 utils/genrandconfig | 52 ++++++++++++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 17 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 3483d55c14..1e72e14461 100755
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
 
@@ -409,19 +416,22 @@ def gen_config(args):
         bounded_loop -= 1
         subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
                                "KCONFIG_PROBABILITY=%d" % randint(1, 20),
-                               "randpackageconfig"])
+                               "randpackageconfig" if args.toolchains_csv else "randconfig"])
 
         if fixup_config(sysinfo, configfile):
-            break
-
-    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-                           "olddefconfig"])
+            if subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
+                                      "olddefconfig"]):
+                continue
 
-    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-                           "savedefconfig"])
+            if subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
+                                      "savedefconfig"]):
+                continue
 
-    return subprocess.call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-                            "dependencies"])
+            if subprocess.call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
+                                "dependencies"]):
+                continue
+            break
+    return 0
 
 
 if __name__ == '__main__':
@@ -433,10 +443,18 @@ if __name__ == '__main__':
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

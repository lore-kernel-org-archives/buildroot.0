Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6B9C433F5
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 18:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1D7F404B4;
	Sat,  2 Apr 2022 18:43:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vs22u2XdGBfk; Sat,  2 Apr 2022 18:43:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADCF2401A4;
	Sat,  2 Apr 2022 18:43:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 277831BF2B5
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 18:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EE84401A4
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 18:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0jrm2CueDd_W for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 18:42:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 54013401A2
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 18:42:59 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id g21so6696227iom.13
 for <buildroot@buildroot.org>; Sat, 02 Apr 2022 11:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RMdVTtcdqTPBoOixJ3bXrKj9GeMOHZU3Khy/2vE9Ctc=;
 b=dgXkSuGEA/g5FR5ToywNFagwmyguv1goI7FC8Udm1s96eXrwFIX0+77CTIKmubu5cR
 Z7FXMQzS7VHLQBl0zqbUTrCq0pqrDpCZTAllaplUrwRQq08zu+bPceBtnVLyv8oYinTS
 aMJe2nMo2YXr1fY53WjloupU12FCS2513Mp3T9s1L7z7tcDPucBQY9Z3kJzA5uixcWx6
 rY+P1XW3AG7PMTx4L6zIuMN5qje0spfrXjSgU1wX8NICFqTiHjx/p6uX9bYrKBhaQEHJ
 ye5Cc0SA26NN8fZ5VVLABhKp0sM+hctAoA5lw6PANgZDpKagqODuw/gvUP2kb1QVwVki
 eXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RMdVTtcdqTPBoOixJ3bXrKj9GeMOHZU3Khy/2vE9Ctc=;
 b=AG4h39cxdIe7ZN+I8Z9Vh41RLbOMqMvtLQ6lyDXLGEP1g576X/omKsR6iaCHLnlw4o
 Wn+5BzEkYorTqot4BEJrt+9xgTx0BQML1UphG04z2n6xMR4mxx1XPVg0O4Op/mNqlfc2
 ON6QSg3lAgHD3yRb1H+eVHs1Nu1bZDafR7trWO2Ym6WUG4Y/p+YgPgcm5GnyE2kSC1xB
 bWcHg2WpRCQrw36Z+uEsyk7M5kR/RKkg75nG7JLTVgSa0123ti2DTC9aDHiHlegeWwRm
 399HueNFJZXRyXzNBKX66y9gq95Wz44HErGTLfhDbp0v9ZkOGYjd6kTQHVSiHaL6y+yq
 ZdTA==
X-Gm-Message-State: AOAM531ROSHWBXUoLTTs93X+VhE/K+tOqctis5b04lfY2Uh0lF7fB+f2
 XgivF4LavPacPjUqUDQ5+BvOJqat3VhjUA==
X-Google-Smtp-Source: ABdhPJwoe0gWYcSzOYORT3izQPEO6ugSGEhh7DWK0kzpR6ehJHT5MpuEbPAPI73ek3O5gIDyuTIC5Q==
X-Received: by 2002:a05:6638:14c6:b0:323:bb70:7053 with SMTP id
 l6-20020a05663814c600b00323bb707053mr3831069jak.141.1648924978170; 
 Sat, 02 Apr 2022 11:42:58 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 y11-20020a92d80b000000b002c880174e40sm3102126ilm.57.2022.04.02.11.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Apr 2022 11:42:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Apr 2022 12:42:51 -0600
Message-Id: <20220402184251.532287-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] utils/genrandconfig: add randconfig
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
Changes v1 -> v2:
  - refactor fixup_config control flow
---
 utils/genrandconfig | 54 +++++++++++++++++++++++++++++++--------------
 1 file changed, 37 insertions(+), 17 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 3483d55c14..d6b5e0be23 100755
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
+        if subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
+                                  "olddefconfig"]):
+            continue
 
-    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-                           "savedefconfig"])
+        if subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
+                                  "savedefconfig"]):
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

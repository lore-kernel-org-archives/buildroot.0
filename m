Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09FEC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 496FE822E6;
	Mon, 20 Feb 2023 20:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 496FE822E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EOwPyCrPrPow; Mon, 20 Feb 2023 20:51:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79419822E2;
	Mon, 20 Feb 2023 20:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79419822E2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3BC001BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14822400AF
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14822400AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NQjTghhaM9Ja for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:50:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 442634010E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 442634010E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BBF98648A; Mon, 20 Feb 2023 20:50:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 21:50:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13b05a9b00bb1eeacefafe7b2a3537988a53dcea
X-Git-Newrev: ff7c37e57419aeb2fb63ebc21bad9696aaaba2b4
X-Patchwork-Hint: ignore
Message-Id: <20230220205040.2BBF98648A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libjxl: security bump to version
 0.8.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ff7c37e57419aeb2fb63ebc21bad9696aaaba2b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Security: Fix OOB read in exif.h

https://github.com/libjxl/libjxl/releases/tag/v0.8.1
https://github.com/libjxl/libjxl/releases/tag/v0.8.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-segmentation-fault-when-JPEG-is-disabled.patch | 44 ++++++++++++++++++++++
 package/libjxl/libjxl.hash                         |  2 +-
 package/libjxl/libjxl.mk                           |  2 +-
 3 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/package/libjxl/0001-djxl-fix-segmentation-fault-when-JPEG-is-disabled.patch b/package/libjxl/0001-djxl-fix-segmentation-fault-when-JPEG-is-disabled.patch
new file mode 100644
index 0000000000..3d709c956b
--- /dev/null
+++ b/package/libjxl/0001-djxl-fix-segmentation-fault-when-JPEG-is-disabled.patch
@@ -0,0 +1,44 @@
+From 504f35c8204248ae6f97278e8b7c6cc5853a1b94 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Fri, 10 Feb 2023 21:31:30 +0100
+Subject: [PATCH] djxl: fix segmentation fault when JPEG is disabled
+
+When libjxl is compiled without JPEG support, by configuring for example
+with:
+
+    cmake -DCMAKE_DISABLE_FIND_PACKAGE_JPEG=TRUE ...
+
+djxl crashes with a segmentation fault at:
+https://github.com/libjxl/libjxl/blob/v0.8.1/tools/djxl_main.cc#L367
+
+The crash can be reproduced with the sequence:
+
+    gm convert IMAGE:LOGO ref.ppm
+    cjxl ref.ppm enc.jxl
+    djxl enc.jxl dec.ppm
+
+The crash happen because opt_jpeg_quality_id does not get
+initialized at:
+https://github.com/libjxl/libjxl/blob/v0.8.1/tools/djxl_main.cc#L107
+
+This commit fixes the crash by adding a test on opt_jpeg_quality_id.
+
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+[Retrieved from:
+https://github.com/libjxl/libjxl/pull/2178/commits/504f35c8204248ae6f97278e8b7c6cc5853a1b94]
+---
+ tools/djxl_main.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/djxl_main.cc b/tools/djxl_main.cc
+index b755301fcb..42b889e7ce 100644
+--- a/tools/djxl_main.cc
++++ b/tools/djxl_main.cc
+@@ -370,6 +370,7 @@ int main(int argc, const char* argv[]) {
+     args.color_space = force_colorspace;
+   }
+   if (codec == jxl::extras::Codec::kPNM && extension != ".pfm" &&
++      args.opt_jpeg_quality_id != -1 &&
+       !cmdline.GetOption(args.opt_jpeg_quality_id)->matched()) {
+     args.bits_per_sample = 0;
+   }
diff --git a/package/libjxl/libjxl.hash b/package/libjxl/libjxl.hash
index e71d32e61d..6b4c9d8d0a 100644
--- a/package/libjxl/libjxl.hash
+++ b/package/libjxl/libjxl.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  3114bba1fabb36f6f4adc2632717209aa6f84077bc4e93b420e0d63fa0455c5e  libjxl-0.7.0.tar.gz
+sha256  60f43921ad3209c9e180563025eda0c0f9b1afac51a2927b9ff59fff3950dc56  libjxl-0.8.1.tar.gz
 sha256  8405932022a556380c2d8c272eff154a923feb197233f348ce5f7334fb0a5ede  LICENSE
 sha256  91915f8ae056a68a3c5bdf05d9f6f78bb6903e27a8ca3a8434c9e4ac87300575  PATENTS
diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
index b4dfbecf82..f603327bf6 100644
--- a/package/libjxl/libjxl.mk
+++ b/package/libjxl/libjxl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBJXL_VERSION = 0.7.0
+LIBJXL_VERSION = 0.8.1
 LIBJXL_SITE = $(call github,libjxl,libjxl,v$(LIBJXL_VERSION))
 LIBJXL_LICENSE = BSD-3-Clause
 LIBJXL_LICENSE_FILES = LICENSE PATENTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

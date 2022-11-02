Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631D0C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 21:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5D2340A90;
	Wed,  2 Nov 2022 21:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5D2340A90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MUyxqWcsOAeH; Wed,  2 Nov 2022 21:05:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA338408F0;
	Wed,  2 Nov 2022 21:05:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA338408F0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 093191BF2FA
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 21:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D878181DF0
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 21:05:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D878181DF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XE6X0PC0AeRA for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 21:05:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D40FC81CE7
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 21:05:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D40FC81CE7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0E7387A80; Wed,  2 Nov 2022 21:05:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Nov 2022 22:04:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 28bcaf1e746849f156d8778689a8702d95e6a6d9
X-Git-Newrev: c0394cc454460ebc99202faa4c10365998e72925
X-Patchwork-Hint: ignore
Message-Id: <20221102210503.C0E7387A80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mmc-utils: bump to version
 dfc3b6ecda84d21418fb4408b39c5c71db4c6458
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
Content-Type: multipart/mixed; boundary="===============2691151536987246730=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2691151536987246730==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c0394cc454460ebc99202faa4c10365998e72925
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop first patch, upstreamed:
https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git/commit/?id=520f54eb94845e597837ae908a03b91ae8c8758f

Depends on kernel headers >= 4.4 for struct mmc_ioc_multi_cmd

Fixes: http://autobuild.buildroot.net/results/01f78081a50743d1faa50a090c00b7e90a17fa39

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-mmc_cmds.c-fix-build-with-gcc-4.9.patch   | 37 ----------------------
 package/mmc-utils/Config.in                        |  6 ++--
 package/mmc-utils/mmc-utils.hash                   |  4 +--
 package/mmc-utils/mmc-utils.mk                     |  2 +-
 4 files changed, 6 insertions(+), 43 deletions(-)

diff --git a/package/mmc-utils/0001-mmc_cmds.c-fix-build-with-gcc-4.9.patch b/package/mmc-utils/0001-mmc_cmds.c-fix-build-with-gcc-4.9.patch
deleted file mode 100644
index 7725f9ca5e..0000000000
--- a/package/mmc-utils/0001-mmc_cmds.c-fix-build-with-gcc-4.9.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 6208cc78f6efd1fafc4f5bc6a487247a383df80f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 28 Sep 2019 20:44:52 +0200
-Subject: [PATCH] mmc_cmds.c: fix build with gcc 4.9
-
-Fix following error with gcc 4.9:
-
-mmc_cmds.c:1918:9: error: missing braces around initializer [-Werror=missing-braces]
-  struct rpmb_frame frame_status = {0};
-
-Fixes:
- - http://autobuild.buildroot.org/results/bf3b6f9f6ef39b99842b3c92495b7bf359c68158
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: sent to linux-mmc@vger.kernel.org]
----
- mmc_cmds.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/mmc_cmds.c b/mmc_cmds.c
-index fb37189..6b09f26 100644
---- a/mmc_cmds.c
-+++ b/mmc_cmds.c
-@@ -1915,7 +1915,9 @@ static int do_rpmb_op(int fd,
- 	u_int16_t rpmb_type;
- 	struct mmc_ioc_multi_cmd *mioc;
- 	struct mmc_ioc_cmd *ioc;
--	struct rpmb_frame frame_status = {0};
-+	struct rpmb_frame frame_status;
-+
-+	memset(&frame_status, 0, sizeof(frame_status));
- 
- 	if (!frame_in || !frame_out || !out_cnt)
- 		return -EINVAL;
--- 
-2.23.0
-
diff --git a/package/mmc-utils/Config.in b/package/mmc-utils/Config.in
index 953afec588..d65988c749 100644
--- a/package/mmc-utils/Config.in
+++ b/package/mmc-utils/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_MMC_UTILS
 	bool "mmc-utils"
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
 	help
 	  MMC utils
 
@@ -17,5 +17,5 @@ config BR2_PACKAGE_MMC_UTILS_ENABLE_DANGEROUS_COMMANDS
 
 endif
 
-comment "mmc-utils needs a toolchain w/ headers >= 3.0"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+comment "mmc-utils needs a toolchain w/ headers >= 4.4"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
index e8b2826612..1256f63487 100644
--- a/package/mmc-utils/mmc-utils.hash
+++ b/package/mmc-utils/mmc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ffc8f77233d1bd39ce4ec68835ad94aa6762624e4e96fb60102e87ba82db083e  mmc-utils-d40ec535b9d4e4c974e8c2fbfb422cd0348cc5e8-br1.tar.gz
-sha256  c3165393bcd710624e2909327a6fbeb736c47bdbe66de1c1a364ac7324d3e4d6  mmc.h
+sha256  f6ed1cb2f02d49df4244f8872b47b22780dd634fa19d857298ce1b793752776f  mmc-utils-dfc3b6ecda84d21418fb4408b39c5c71db4c6458-br1.tar.gz
+sha256  f57e3c6169116aa9ff06eec95734ca000e4d0196467bb221e80e50530c768081  mmc.h
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index 14e2bee587..435e6ae7f1 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MMC_UTILS_VERSION = d40ec535b9d4e4c974e8c2fbfb422cd0348cc5e8
+MMC_UTILS_VERSION = dfc3b6ecda84d21418fb4408b39c5c71db4c6458
 MMC_UTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
 MMC_UTILS_SITE_METHOD = git
 MMC_UTILS_LICENSE = GPL-2.0

--===============2691151536987246730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2691151536987246730==--

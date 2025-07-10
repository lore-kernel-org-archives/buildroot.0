Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F6FC8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDF5083C0F;
	Fri, 11 Jul 2025 10:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhiHemq3hB-B; Fri, 11 Jul 2025 10:22:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D9C983F73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D9C983F73;
	Fri, 11 Jul 2025 10:22:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E3B9199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAFDC40C4E
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VbpS_meUgC2X for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:21:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D680C40EB3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D680C40EB3
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4B8486353; Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 11:40:06 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 89af23d713bb226037852c3dc28be5e042bd7368
X-Git-Newrev: 3495230a9f54701f44abde7612b7dd96328ebcc6
X-Patchwork-Hint: ignore
Message-Id: <20250711102104.D4B8486353@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/libheif: security
 bump version to 1.20.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3495230a9f54701f44abde7612b7dd96328ebcc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Release notes: https://github.com/strukturag/libheif/releases

Version 1.19.6 fixes CVE-2025-43966 & CVE-2025-43967:
https://github.com/strukturag/libheif/releases/tag/v1.19.6

Updated license hash due to upstream commit:
https://github.com/strukturag/libheif/commit/377a957bd84018f4d27588c989fa5c66935c16ed

Note:

The patch for CVE-2025-43966 fixes libheif/image-items/iden.cc which was
added in version 1.19.0.
https://github.com/advisories/GHSA-7g9v-7vc7-pmrw

The patch for CVE-2025-43967 does not apply cleanly to 1.18.2 even after
renaming "/image-items/" to "/codecs/". Therefore, this patch is not
backported.
https://github.com/advisories/GHSA-c48q-x6xw-g5h8

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add justification from Bernd why the security fix is not
  backported]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit accb006d9b62079b56bc1f1388b558a60dde277a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libheif/libheif.hash | 4 ++--
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 26b21e1897..6c129873cb 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c4002a622bec9f519f29d84bfdc6024e33fd67953a5fb4dc2c2f11f67d5e45bf  libheif-1.18.2.tar.gz
-sha256  b2eb4f6588b005bebac44cfb2dfd23f6a16c5ca9b8a619a315158b0215a917a3  COPYING
+sha256  55cc76b77c533151fc78ba58ef5ad18562e84da403ed749c3ae017abaf1e2090  libheif-1.20.1.tar.gz
+sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 4783ada19e..f6e14888eb 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.18.2
+LIBHEIF_VERSION = 1.20.1
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

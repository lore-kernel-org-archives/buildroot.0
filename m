Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C1F8C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:45:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABFF260F44
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABFF260F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E9924056B;
	Sat,  9 Oct 2021 20:45:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NNWvWy7CvgyC; Sat,  9 Oct 2021 20:45:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7C324041B;
	Sat,  9 Oct 2021 20:45:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 224791BF3C6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28F5E82F84
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XnhlZdnTKdOl for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:45:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AD2882FC9
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:45:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C767594C90; Sat,  9 Oct 2021 20:42:25 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 22:45:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f4735052684eb81cfb227fb7386ad9e67896461
X-Git-Newrev: 10c00b0e74fa93983bba9abdd008c3e9c0a3fc7a
X-Patchwork-Hint: ignore
Message-Id: <20211009204225.C767594C90@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libuev: bump version to v2.4.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=10c00b0e74fa93983bba9abdd008c3e9c0a3fc7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This update is critical for linking against GLIBC v2.34, due to the
changes related to 64-bit time_t on 32-bit systems.  See ChangeLog
for details:

  https://github.com/troglobit/libuev/releases/tag/v2.4.0

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libuev/libuev.hash | 4 ++--
 package/libuev/libuev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libuev/libuev.hash b/package/libuev/libuev.hash
index d52d210d10..e5c9660a02 100644
--- a/package/libuev/libuev.hash
+++ b/package/libuev/libuev.hash
@@ -1,4 +1,4 @@
-# From https://github.com/troglobit/libuev/releases/download/v2.3.2/libuev-2.3.2.tar.xz.sha256
-sha256  af31ffe1058a2ff6c56fee26ec8749688704d297189b6a898380a601efefbec9  libuev-2.3.2.tar.xz
+# From https://github.com/troglobit/libuev/releases/download/v2.4.0/libuev-2.4.0.tar.xz.sha256
+sha256  31f1aa4f492ba4f6a5dd6b19968ae6a732968dc05cae6575930560b6cee1f5ef  libuev-2.4.0.tar.xz
 # License files
 sha256  694a734d9c1b46ae203314ed1c744a1acebd4fe5fc964b761703772546f0d3ab  LICENSE
diff --git a/package/libuev/libuev.mk b/package/libuev/libuev.mk
index 8a6759a2d7..a32381dcc5 100644
--- a/package/libuev/libuev.mk
+++ b/package/libuev/libuev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUEV_VERSION = 2.3.2
+LIBUEV_VERSION = 2.4.0
 LIBUEV_SOURCE = libuev-$(LIBUEV_VERSION).tar.xz
 LIBUEV_SITE = https://github.com/troglobit/libuev/releases/download/v$(LIBUEV_VERSION)
 LIBUEV_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

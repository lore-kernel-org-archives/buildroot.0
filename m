Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4605BEE4981
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 16:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29B3660B8D;
	Tue, 30 Dec 2025 16:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kgc9EYCoM0s1; Tue, 30 Dec 2025 16:10:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C395D60B62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767111001;
	bh=lxd5t3jXrVsCT0MCFXPS3fRd6LmawGPK+LE+aL7bwt0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HAQ9QwfmMxf5D6oZJgJ7BdWeiuMqFDalqoJDMAzc+s2SzcrgHvfW3rk/z0GY3pxQi
	 rWwCh473HMGsiatbPBLAL9ahcEBmJI/yFHQpx+IJxIKtKh+uu7x/fcpHIf1iklssRR
	 Rgm33KUqNnwHLVvOodue3SHmAoKRxXHhjEbYHZTyHN04Wv9uAAmKMgPxgfc0UMpGNV
	 UQoKkgukfpV1XjyDEPOBqrJSJpgBEQpkz0uaFqooa3ibP60w6ATDbq7dN1X2/7LH5p
	 FE6pHqL3mjSKFUfeBqdv1eSAwfZxlHSRmyTckjkHgMDJPArTSvdBy7wEOmnUvc2x1l
	 5Vf1E71+gQIfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C395D60B62;
	Tue, 30 Dec 2025 16:10:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26D29177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 16:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C46A60B62
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 16:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e17xx2uT1uii for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 16:09:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B82460785
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B82460785
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 16:09:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0855E87C34; Tue, 30 Dec 2025 16:09:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 17:07:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3862abb010f0ab923a9d870411dc38cc5d5e5f22
X-Git-Newrev: d9d48682000c645f2f5d7293e9511b369e38dfcf
X-Patchwork-Hint: ignore
Message-Id: <20251230160959.0855E87C34@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcdio: bump version to 2.3.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d9d48682000c645f2f5d7293e9511b369e38dfcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/libcdio/libcdio/releases/tag/2.3.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libcdio/libcdio.hash | 4 ++--
 package/libcdio/libcdio.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcdio/libcdio.hash b/package/libcdio/libcdio.hash
index 52d923a3d0..4c15b53e38 100644
--- a/package/libcdio/libcdio.hash
+++ b/package/libcdio/libcdio.hash
@@ -1,5 +1,5 @@
-# Locally calculated after checking signature
-sha256  6f8fbdf4d189cf63f2a7a1549c516cd720c7b222c7aaadbc924a26e745a48539  libcdio-2.2.0.tar.bz2
+# From https://github.com/libcdio/libcdio/releases/tag/2.3.0
+sha256  53e83d284667535a767fd2d31edad1a6701591960459df373a10f1f21e80a7ed  libcdio-2.3.0.tar.bz2
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libcdio/libcdio.mk b/package/libcdio/libcdio.mk
index d4b277a15b..d5238e3aca 100644
--- a/package/libcdio/libcdio.mk
+++ b/package/libcdio/libcdio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCDIO_VERSION = 2.2.0
+LIBCDIO_VERSION = 2.3.0
 LIBCDIO_SOURCE = libcdio-$(LIBCDIO_VERSION).tar.bz2
 LIBCDIO_SITE = https://github.com/libcdio/libcdio/releases/download/$(LIBCDIO_VERSION)
 LIBCDIO_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59B8D5B161
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 20:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59E5960604;
	Sat, 13 Dec 2025 20:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pnG5g6kwJ3fc; Sat, 13 Dec 2025 20:59:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FA7C608B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765659540;
	bh=FwJRtrVS5UzCJDl37gxWMuUeo/7texk3st+4FpxCmRc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PKTYWvfNRoq3rgzNNVLjHAx2ZCRvFZTVD2VFxE51O0tqVqXxRlQ1dafcZzPCyYIjQ
	 2sarNnxNrB2GqHhheR3gJBYxnI+H/VSAf7nqg6e0vEfDjhNUS1Pn9BeSj1iHdjA8g7
	 dVRq0aKQiJLCs+0IbFh4fun0DaD0xTru/HpMLCdtl/Ush5iWGwslQLRwFKnzfexeIY
	 OmIF6LiTDgUJnHaMnNFS4O4fZgxhTEdG6qlC/GMNB81MrNar+S2NzWTfeUDGbvMxBB
	 MiB52r/SpX5ioZ2NLUdSfewQzRtiTFmu6Brn4EQoVfg96QskxYVoyvoe9poT4MFj9S
	 BpkMzVlcrjnBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FA7C608B5;
	Sat, 13 Dec 2025 20:59:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AFC152C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9710F8115A
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:58:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ia88MFP6qvd for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 20:58:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB02181152
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB02181152
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:58:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5D5F86DC9; Sat, 13 Dec 2025 20:58:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 21:48:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2170ed923d298d779867e55c8d4d1b85f740dda9
X-Git-Newrev: fdce0b7d4aadcd6e58f8396e8ff0842443135d7a
X-Patchwork-Hint: ignore
Message-Id: <20251213205856.A5D5F86DC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdrm: bump version to 2.4.131
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

commit: https://git.buildroot.net/buildroot/commit/?id=fdce0b7d4aadcd6e58f8396e8ff0842443135d7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2025-December/003646.html
https://lists.x.org/archives/xorg-announce/2025-December/003647.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index e2dbbf18ee..52bf0c6228 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2025-November/003642.html
-sha256  5978183f978d697e26a50ba066174964efb0ab97caa1ecaa1b861fbe5ddf77dc  libdrm-2.4.129.tar.xz
-sha512  3ee702cc4a578e9ab231caf8a84700e4dff6f3da70731610121ac2c3390f42e42ad144ea61c53582e3a8adfb1d6bf8254993c5c6eaf85a51421e26d51d341cd4  libdrm-2.4.129.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-December/003647.html
+sha256  45ba9983b51c896406a3d654de81d313b953b76e6391e2797073d543c5f617d5  libdrm-2.4.131.tar.xz
+sha512  d75894215600b648e25bbe13422901b650fb94bba8276d77971a49db7dc001819c9fc4b7e90ed82275f170a331687960ca5752cbb12064b2eec9c5c8eb60bf3c  libdrm-2.4.131.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index c499632f6c..240c09b8b1 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.129
+LIBDRM_VERSION = 2.4.131
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

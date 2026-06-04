Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE60CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5465460A6B;
	Fri,  5 Jun 2026 12:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x4TllknAEUgx; Fri,  5 Jun 2026 12:39:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 667E160A94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663151;
	bh=GA6gjA310KDab+pQHDFOMGiRZlPOGegcDsJVMFpWRag=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q0Xxv1rTZ7hNvUUM+L0KFQRt90sDygL3zj/Xs9iEOn8l+CKiNlmTFh9xbR23RFMqB
	 r+57VhkNtspMHivNU6YAlbgEoJztmoeqiwFdRAwQZv8F2qfVNCN9dWHHqounNP+SEa
	 lC4Z2vW2we+H3gNIUbpfFuOe/bAi4Oi2lcDnTRF39MX8n48YO01oK3EqA2kPgvbbW7
	 rs/SOe+tEgiFCBkbUNbsR5BbyOEamvk6mzggCMwmS08yUjBP3RD63UbLgVBiMBFqMb
	 62X4Cox+yLEexauQO3YqJEy8jTHCV76xAv/XG6LJiFCmVhwDeHh/T0eUmVKKLj35VS
	 0Z/lUsXkj3+XA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 667E160A94;
	Fri,  5 Jun 2026 12:39:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01963388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C598081EB9
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bkof_EEJwOJC for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EF0481EC1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EF0481EC1
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9989A87B36; Fri,  5 Jun 2026 12:37:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:36:28 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5384ec6bf50b3d80a64f816a0952da05f1dd6f80
X-Git-Newrev: 636e47f8ddb43a82e4172a3e62dc1a18c04ca75f
X-Patchwork-Hint: ignore
Message-Id: <20260605123714.9989A87B36@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sshfs: security
 bump version to 3.7.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/636e47f8ddb43a82e4172a3e62dc1a18c04ca75f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/libfuse/sshfs/blob/sshfs-3.7.6/ChangeLog.rst

Fixes CVE-2026-47187 & CVE-2026-48711.

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c6ebe16f34df84561466f435a5f4f4c40c9208bf)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sshfs/sshfs.hash | 5 +++--
 package/sshfs/sshfs.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/sshfs/sshfs.hash b/package/sshfs/sshfs.hash
index 9372e471c2..57698aeace 100644
--- a/package/sshfs/sshfs.hash
+++ b/package/sshfs/sshfs.hash
@@ -1,3 +1,4 @@
-# Locally calculated after checking pgp signature
-sha256  5218ce7bdd2ce0a34137a0d7798e0f6d09f0e6d21b1e98ee730a18b0699c2e99  sshfs-3.7.3.tar.xz
+# From https://github.com/libfuse/sshfs/releases/tag/sshfs-3.7.6
+sha256  6a1bcb31450a077e9cb1b7ff158c71de34db697c3c0da6cb362502131e495893  sshfs-3.7.6.tar.xz
+# Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index 61f11af55f..8557b98353 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSHFS_VERSION = 3.7.3
+SSHFS_VERSION = 3.7.6
 SSHFS_SOURCE = sshfs-$(SSHFS_VERSION).tar.xz
 SSHFS_SITE = https://github.com/libfuse/sshfs/releases/download/sshfs-$(SSHFS_VERSION)
 SSHFS_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0155CCD6E5D
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 17:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9D7584C0E;
	Sun, 31 May 2026 17:10:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p4APXWjqv4GK; Sun, 31 May 2026 17:10:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEEAF85027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780247446;
	bh=mkZmPT+Im35J5bM79kdbUautWXA1qDPztwMoQVd8Wo0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jbwaxtCF7wRU835omDpAAlXVfwTGXtML8GDCJh+1ObU4s6Yr1FGJ5kj0wsz/dtzXW
	 nKiwOWqaClfOyBs02y4mTleFTCpfLWttQlUSvqduFPbPNZVEJ+OrlMpqHy7hzKUX6O
	 7aenkZutl/V18bcJQgfeFLO8US7uAgsiClBxfUWxbYK/H5pne6V10zFktIqM3R6oNe
	 3xkuYZ7AbiEuCjHToODbKI8NiMpcNMIWwGPEKzOozH7qE3m5y4YUxrAJ0F0h93+YOK
	 RkaBWzs7VMObbPecyBMuseKr7z+mgx1woTP2cKoDJzJB6HgXDcXOMx9KXV4kX76mO4
	 1oh761lU2gMqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEEAF85027;
	Sun, 31 May 2026 17:10:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E26F4F4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7589429B7
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxiTHk_GgGBt for <buildroot@buildroot.org>;
 Sun, 31 May 2026 17:10:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE573429B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE573429B4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:10:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 561CD876F0; Sun, 31 May 2026 17:10:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 19:09:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec687c3b5cfc8bf9b2625f44710151c7b10bd746
X-Git-Newrev: c6ebe16f34df84561466f435a5f4f4c40c9208bf
X-Patchwork-Hint: ignore
Message-Id: <20260531171029.561CD876F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sshfs: security bump version to
 3.7.6
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c6ebe16f34df84561466f435a5f4f4c40c9208bf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libfuse/sshfs/blob/sshfs-3.7.6/ChangeLog.rst

Fixes CVE-2026-47187 & CVE-2026-48711.

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

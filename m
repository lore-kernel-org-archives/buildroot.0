Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBDACD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A70460F13;
	Fri,  5 Jun 2026 12:41:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CLGjTSomQeaf; Fri,  5 Jun 2026 12:40:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 198AC60F14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663259;
	bh=NS3OWya6kQz10kD2oPbb9S/2W9+W+Xbew6IerpOOFek=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rQHfev7dyDbtDFqHP6ojVpj4RAUKWDE0N/ZncoDZ284HkV5xdhq2hX99XCrn+rR64
	 xrXBh8UoMn0uoce/8AxtgfkWfrTf/M/MydejOZ5Miklq+WUFFj/Ub6vmrlA3bWfAGE
	 ZxPL67qQj4kqhMPxXkDm05Qa7OBkPmgAP6x2ZpUzpc1rtyeyF6R4JzeALi6IPpJSLb
	 OI/XIjYiLuWhjOmLKUmfKjs49BC2GPYUYgIadPsdjXA51pHg+WapZW+fSXkvEkhUJM
	 nq0re59mqShz6BKbn7oiKtKKlnfX3aWd5/ybP2Xxiq7uKoqL1BB/3yL8EM12MDB5k8
	 sIEGk0b8/P24A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 198AC60F14;
	Fri,  5 Jun 2026 12:40:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E9C1F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEEC882038
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zjq7IGFwzQk0 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 059AD8203D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 059AD8203D
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F11C87B39; Fri,  5 Jun 2026 12:38:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:29:33 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 3bc93580603b0980bf8220590dae46d4c97eb23b
X-Git-Newrev: 21e66bceace780a63f3f360aa07f5c7d86cb8d34
X-Patchwork-Hint: ignore
Message-Id: <20260605123840.2F11C87B39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/sshfs: security
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/21e66bceace780a63f3f360aa07f5c7d86cb8d34
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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

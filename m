Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BAAC44506
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75AE940417;
	Fri, 10 Jul 2026 13:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iDr4uuI7Db2E; Fri, 10 Jul 2026 13:45:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DD0240BC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691119;
	bh=BxJbvdaZqeC4K3ShzF/JSuP5dAqwTY/TYwA63LNnjU8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NxwnCmKRAPwciAHyrgVOU0HxQncohfM2eYbOBfucoakAcBdiNsK+MOsF4XqUBZGxV
	 iLxMYc8sV/u4ofWsfuEvsUfm7nEdAjQr5DurXuYrL2eQiPYlqjkID74A3oEVRhkgJ5
	 QE4bsx44lMBxkudiwbhw0mhUqCv8+hKySso0bNWV7b84DLkSlF6mjQ6q9bUbVjlnib
	 AyM7kbji4DnaMXcsLEhzx0QrrqfZkAFATtELQWCGJ/B6+kQ00qrXgqMpTxMpCZ2dfl
	 RPnzFmzzX9r6uaUMsek2VyjUbAN8zmDt0Xlj+5rcn5IRYojea3tm8Qmy4F0PI5+N5U
	 gN1GXWMk+acZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DD0240BC5;
	Fri, 10 Jul 2026 13:45:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 526402FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 507B1810BB
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAmR59v4SQrO for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:44:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8498C810CE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8498C810CE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD59C8867A; Fri, 10 Jul 2026 13:44:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 14:55:19 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 0f22ac88aca3e0d3792256519dd946d5b819dd40
X-Git-Newrev: c7f0268cd1ea17eee4d9b72a68abb4cb069e4ded
X-Patchwork-Hint: ignore
Message-Id: <20260710134419.AD59C8867A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/openvpn: security
 bump version to 2.7.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c7f0268cd1ea17eee4d9b72a68abb4cb069e4ded
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://github.com/OpenVPN/openvpn/blob/v2.7.5/Changes.rst

Fixes CVE-2026-11771, CVE-2026-12932, CVE-2026-12996, CVE-2026-13117,
CVE-2026-13122, CVE-2026-13379 & CVE-2026-13698.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 56940f0620025509d141da6dfca01a714a18392d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 438212a4bb..651f430534 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  18db05f3d5eee3663db1914590044e5f96ff5cd47b6e7846c6a350806c23dbce  openvpn-2.7.4.tar.gz
+sha256  c6864b3c7d4e059c7d6ce22d1b5fa646c8b379a06af872eeb9792b6083a44ac4  openvpn-2.7.5.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 68f0d30e4c..d5fd308e63 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.7.4
+OPENVPN_VERSION = 2.7.5
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

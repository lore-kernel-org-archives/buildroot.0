Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB886C5DF6A
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 496A940CA4;
	Fri, 14 Aug 2026 13:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0xJgdv0DNVZj; Fri, 14 Aug 2026 13:19:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0D4C40C8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713594;
	bh=NfQSoLU1oogZ/l0KpqXezaTAUGBT9bxEnDzDs+cBNrQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S2n8XTP8Ih/1v+vEEMx4dTWr5qd2KOpjto0QX+z9v1XktBqPHG3eHLFR1+igCeUWG
	 vX8JeAEcuUPaigMjG7UqHr4ViintqEHhDaRUx/+EEAfFWGN/KRUfGpGFfLR/ouF0BK
	 VMjSjOpKS7XiTC4Fb3AVcYW4TTP03jVJeBYCiY7mbNEweylLk3fml8sydyRyrfVTRb
	 u/TpDeHxwoX/h3oSRCi2LqiuEZMc6Abt1M02df778T5SVLX92ArI1gJiyAa4LC0Uom
	 yrui0BzVpxN/A+A/EfphskwuKgS7FnqyR7smTy55jkqpwxv7LYkpsqt8FJJBsp/Ve2
	 b8pocPs0RI5jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0D4C40C8A;
	Fri, 14 Aug 2026 13:19:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CFBC033B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1A2B40C52
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYnxF1j8GGfr for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1BAE40C36
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1BAE40C36
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 022EA8D66A; Fri, 14 Aug 2026 13:18:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Aug 2026 14:42:01 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 37ca7f68b1401d0117781786e89625663eb23f2c
X-Git-Newrev: 01761504ea9de3d1c24063d52ef68e28bb3665b7
X-Patchwork-Hint: ignore
Message-Id: <20260814131856.022EA8D66A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/openvpn: security
 bump to v2.6.22
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/01761504ea9de3d1c24063d52ef68e28bb3665b7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

See the release notes:
https://github.com/OpenVPN/openvpn/blob/v2.6.22/Changes.rst

This fixes CVE-2026-63649

(alternative to commit dab2b762346b17cf0671599604dfbd0847ba1122)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/openvpn/openvpn.hash | 5 +++--
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 2c90b87974..5300dfe981 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,4 @@
-# Locally calculated after checking signature
-sha256  24cb6185e544a47323d6798b03d39f2367d96f227bee9cd1543e8ed528319b17  openvpn-2.6.21.tar.gz
+# Locally calculated after checking signature from
+# https://build.openvpn.net/downloads/releases/openvpn-2.6.22.tar.gz.asc
+sha256  f46df740f05f86020137a41cfc8814352391cf861ed57f57b4e815cb97c1d2cf  openvpn-2.6.22.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 9ece4df3d8..2b24c1524d 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.6.21
+OPENVPN_VERSION = 2.6.22
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

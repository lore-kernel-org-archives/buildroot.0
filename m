Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6D0E87855
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 18:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73A9940A68;
	Tue,  3 Feb 2026 18:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YfPzEvoidzxJ; Tue,  3 Feb 2026 18:49:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CF234096E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770144545;
	bh=eqbQW/6v7rwjr6NI1ei5l1JP3bVxSZSza+641T2niy0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=QXsVkKH4el1P0TeUHkwi+t5igX2oH+dKAPCIxqioBFBvSvVlRcCtOqerZDanlcMh0
	 3kJimdrQHKMHXRGjrLpdnercwY+SIxvjXh55Y7V/aBnCpoazioCXAw2/SjVOZO1/aY
	 OFUFcn1/IYKpJzdOeiQh55cc/iX7cPHm2DCtRs9hV1jm2D1UieWoHbntQzA8TvcsuW
	 s826e71RYfasWHwoVwEPP59QcUBJQGiEvppR8Ul31v7YmejDSTYesTJ0Uhc3wPSwzo
	 YeOvAqWyOAcP17JtoiZe+brZGEUCtHCicTAy0I7mNq2VCGVk0pI75oPRMGCdNgkj3s
	 MCqjxgpyvFuug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CF234096E;
	Tue,  3 Feb 2026 18:49:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C296DF5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B779C40917
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:49:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oLNVWAzse3wk for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 18:49:02 +0000 (UTC)
X-Greylist: delayed 400 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 03 Feb 2026 18:49:01 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 253DA4096E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 253DA4096E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=163.172.57.108;
 helo=mail.villagedupre.fr; envelope-from=pyk@foss.peewhy.fr;
 receiver=<UNKNOWN> 
Received: from mail.villagedupre.fr (villagedupre.fr [163.172.57.108])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 253DA4096E
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:49:00 +0000 (UTC)
Received: from sejong (82-64-130-240.subs.proxad.net [82.64.130.240])
 by villagedupre.fr (OpenSMTPD) with ESMTPSA id a201a7e8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 3 Feb 2026 18:42:18 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
 Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
Date: Tue,  3 Feb 2026 19:41:50 +0100
Message-ID: <20260203184150.3631973-1-pyk@foss.peewhy.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=foss.peewhy.fr
Subject: [Buildroot] [PATCH] package/git: bump to 2.53.0
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
From: Pierre-Yves Kerbrat via buildroot <buildroot@buildroot.org>
Reply-To: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog
https://gitlab.com/git-scm/git/-/blob/HEAD/Documentation/RelNotes/2.53.0.adoc

Signed-off-by: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 3dcd1d443723..c22ee800cb83 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  3cd8fee86f69a949cb610fee8cd9264e6873d07fa58411f6060b3d62729ed7c5  git-2.52.0.tar.xz
+sha256  5818bd7d80b061bbbdfec8a433d609dc8818a05991f731ffc4a561e2ca18c653  git-2.53.0.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index bd1c1eeb6176..d3625ddf08ad 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.52.0
+GIT_VERSION = 2.53.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

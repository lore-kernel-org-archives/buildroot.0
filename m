Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14407CD343A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E12CE41CC4;
	Mon,  4 May 2026 14:49:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t9i7qPANSd15; Mon,  4 May 2026 14:49:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0788F41CC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906140;
	bh=hjP7ECwD2kOby+G4Ged3UaEcrpIxnjzGrdaJrHnRbwk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T2oe7izND2il16qz4Ii2EJrz3nt1uDz3h7DKjgIUTnZoM8cOgIJ6ekKxboWzFk7+D
	 CXVK2mWPM3KohAxOFa4zvKNpD1hVh90ufx5JrzZE7zUnB5nedBIpaZqaToGn+6E9Dw
	 SpvJ1Za/1kROrPHerHFPqOzAfqkZCExJustS6i0UUJ+L9EwEyCHy92HiNWD/FJ20T7
	 6hRl3qnTQeX+uwD3BRi5MBPOoFf3Va1AfTkGmIXdWSKghvAWdzbINhHZ+J2a9BdYJg
	 w7BW1eQqoexl9TtKY+XDv+lzYiYTvmWkwRSKlx/jySrtp9LMimtleh6tubhGLz11i/
	 wORj2Adh/HmRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0788F41CC6;
	Mon,  4 May 2026 14:49:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D1C3930A
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C248C615C7
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b4RNOsh_xE_D for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE90961531
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE90961531
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B308C8435A; Mon,  4 May 2026 14:48:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 14:09:16 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: d36db25ccc5febe7aeb8de79d82406000011575a
X-Git-Newrev: 295e92b1cb730b9ab85d4d5aa03902d0e7050c1c
X-Patchwork-Hint: ignore
Message-Id: <20260504144845.B308C8435A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/ca-certificates:
 bump to 20260223
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/295e92b1cb730b9ab85d4d5aa03902d0e7050c1c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Changelog including list of added/removed CAs:
https://salsa.debian.org/debian/ca-certificates/-/blob/b266ecf6afc2d6fda61391bbeda455572e7f5207/debian/changelog

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d7ebed6df01e2d3395843ba39297359ae5498fd1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ca-certificates/ca-certificates.hash | 2 +-
 package/ca-certificates/ca-certificates.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
index 2112badfcc..d234705082 100644
--- a/package/ca-certificates/ca-certificates.hash
+++ b/package/ca-certificates/ca-certificates.hash
@@ -1,4 +1,4 @@
 # hashes from: $(CA_CERTIFICATES_SITE)/ca-certificates_$(CA_CERTIFICATES_VERSION).dsc :
-sha256  33b44ef78653ecd3f0f2f13e5bba6be466be2e7da72182f737912b81798ba5d2  ca-certificates_20250419.tar.xz
+sha256  2fa2b00d4360f0d14ec51640ae8aea9e563956b95ea786e3c3c01c4eead42b56  ca-certificates_20260223.tar.xz
 # Locally computed
 sha256  e85e1bcad3a915dc7e6f41412bc5bdeba275cadd817896ea0451f2140a93967c  debian/copyright
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index b1903f6166..1f3f192d4a 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CA_CERTIFICATES_VERSION = 20250419
+CA_CERTIFICATES_VERSION = 20260223
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
-CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20250419T084132Z/pool/main/c/ca-certificates
+CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20260223T202245Z/pool/main/c/ca-certificates
 CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3
 CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

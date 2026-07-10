Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEC5C44501
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 16:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3FC3408BD;
	Fri, 10 Jul 2026 16:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VK_ThjJaHcQP; Fri, 10 Jul 2026 16:28:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A20DB408C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783700913;
	bh=gbsRQwMDyNnnckahFBU6GMMjs9i4T8a0Qi+G+GSMWxM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cLU3lg51QgAB4UOhdsejqTL8GYQkyfbGLc6DA97Vr1sqQXtGEG8sO/xl5conx0xUc
	 OH60pQl7GN+ApVZhoC7w4NOsWlr9LDxO89steRnDMrJt9FDnJrQjsgA2ocbC/Z5cAd
	 YWmQihalzlr+IdoNWxmw5HN0i0hiY7MXvxzZThUb3kx6oVWK9jCBuY769zxB29gNmy
	 RBfXVjJfwiZGroYQ9khCr+ydYWxI2Se2Jl665scgHKRfPl8QhIylYlW7TmtQAKBGcK
	 2pUsF15jeiSrWXQLT+NI9u8tF7eMtfiL69o5L5sz9DPGozzvXZ2H26z2RPXCHVI2a2
	 Yg119FgHxVqUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A20DB408C1;
	Fri, 10 Jul 2026 16:28:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DE39E2FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3C63408BD
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:28:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KWOcCOCtzfE1 for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 16:28:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAC59408C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAC59408C1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:28:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D23FF8837C; Fri, 10 Jul 2026 16:27:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 18:27:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3460675872a8c5a60ee45946794686ec544af042
X-Git-Newrev: ce9ed75bbcc12dd8dc4dee2bdbaffe2f8bf240f8
X-Patchwork-Hint: ignore
Message-Id: <20260710162757.D23FF8837C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dropbear: security bump version to
 2026.92
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ce9ed75bbcc12dd8dc4dee2bdbaffe2f8bf240f8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://matt.ucc.asn.au/dropbear/CHANGES

- Security: server: Don't allow -B (accept blank password) with
  -t (two factor auth). If run with -t and -B a user configured with a
  blank password would be allowed to log in without pubkey auth.
  https://github.com/mkj/dropbear/commit/23ec78285639edf068d86bb96f91cba755039740
  Reported by nvidia

- Security: server: Fix parsing of long authorized_keys lines.
  The remainder of a long line would be handled as the start of a new line.
  In the case where external programs add semi-trusted public keys to
  authorized_keys, a crafted key might bypass restrictions such as "command=".
  https://github.com/mkj/dropbear/commit/8d8e1930b866eb44135ae393a793cbeb03b6b9d6
  Reported by nvidia

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dropbear/dropbear.hash | 2 +-
 package/dropbear/dropbear.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index 31ac153b89..9df81ea4b5 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,5 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256  defa924475abf6bc1e74abc00173e46bfdc804bd47caafa14f5a4ef0cc76da34  dropbear-2026.91.tar.bz2
+sha256  91dcb5234de8dea68dd82c55411c9fc986b457ab58372a780ee8a870419c2f7e  dropbear-2026.92.tar.bz2
 
 # License file, locally computed
 sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index a7de8432af..e7e6703057 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2026.91
+DROPBEAR_VERSION = 2026.92
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

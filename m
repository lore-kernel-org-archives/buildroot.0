Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92C8FEE4ED
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 12:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C749C80A68;
	Sat, 28 Feb 2026 12:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZQ3tAIjbIBz3; Sat, 28 Feb 2026 12:11:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5704880986
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772280700;
	bh=qDGg/+dZI31CPX4h5+tyMsPI3V2fiR5dqY08DxhZPLw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S97uu+XxioC8ezUMOIV5qlU4i6LeVI5/OlYceFR4aCnZUCojGCIX7x6dL3oIm3C35
	 QL92EF+i6oUSRq3xFcUf+Otv6Iesz38N7pyCpM030B6AXyGX/nhA/7iKaBjB/F9mg7
	 tWDujjfxQGhAKC3a5gBB0PAWDHjxCythpNNC6dyFH75sNcqmdkdaGh2YOBQ9JZJFpI
	 YBMg41aAtMDPVEP7l47YC1FFFoFntFv8XNicvwcb7YrvDDFsd/v43IefReNmc+pMG8
	 uWymRlg/hHdviUpmSyR5CYggmEmrCsfvn5Ro6OcG/YTBeQs6iywr/Lekizzo5/+NEf
	 xR0ircUbb8blA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5704880986;
	Sat, 28 Feb 2026 12:11:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6773A18D
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 12:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58FEE418A8
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 12:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Th6zhOZ9Qgsm for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 12:11:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A38F7418A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A38F7418A6
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 12:11:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99FAD85AFF; Sat, 28 Feb 2026 12:11:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Feb 2026 13:05:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ef4f0eca1b179f5c623b67babe87a6cd1ff10b34
X-Git-Newrev: 658662b2465c56603d168194270516b20200ab04
X-Patchwork-Hint: ignore
Message-Id: <20260228121137.99FAD85AFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nano: bump to version
 8.7.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/658662b2465c56603d168194270516b20200ab04
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Changelog:
https://www.nano-editor.org/dist/v8/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index c8bdb0913f..5d369a514f 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v8/nano-8.7.tar.xz.asc
+# https://www.nano-editor.org/dist/v8/nano-8.7.1.tar.xz.asc
 # using key 168E6F4297BFD7A79AFD4496514BBE2EB8E1961F
-sha256  afd287aa672c48b8e1a93fdb6c6588453d527510d966822b687f2835f0d986e9  nano-8.7.tar.xz
+sha256  76f0dcb248f2e2f1251d4ecd20fd30fb400a360a3a37c6c340e0a52c2d1cdedf  nano-8.7.1.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index ee82225a72..0e2b0af574 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 8
-NANO_VERSION = $(NANO_VERSION_MAJOR).7
+NANO_VERSION = $(NANO_VERSION_MAJOR).7.1
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCB6D4335D
	for <buildroot@archiver.kernel.org>; Thu,  7 Nov 2024 13:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9475F4035F;
	Thu,  7 Nov 2024 13:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqyIrW11oEYv; Thu,  7 Nov 2024 13:44:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F2EA403C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F2EA403C3;
	Thu,  7 Nov 2024 13:44:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A6DB3B
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 13:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A2AD4035F
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 13:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tl1ARuEjZPlX for <buildroot@buildroot.org>;
 Thu,  7 Nov 2024 13:44:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.5;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 04360403C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04360403C3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04360403C3
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 13:44:03 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [223.102.84.14])
 by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id
 _____wDXLikdxCxnbgaOFw--.1287S2; 
 Thu, 07 Nov 2024 21:43:59 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Cc: TIAN Yuanhao <tianyuanhao3@163.com>
Date: Thu,  7 Nov 2024 05:43:41 -0800
Message-ID: <20241107134342.4306-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-CM-TRANSID: _____wDXLikdxCxnbgaOFw--.1287S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7trWkWw1fGrWrXFW7CF4fAFb_yoW8Ww1fp3
 90yF1Y9r1Igr1rJrZrt3yIkF15uFnYqFyDAFW7Ga10y3ZxXan3JwnFkF4UJF4UGr47Jw10
 q34DAF42qrWay3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUga9xUUUUU=
X-Originating-IP: [223.102.84.14]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbBYw2QjWcscCFXpwACsb
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=1mjPZ
 3VRLGhaIrpXg0tp9KpoLBHenrlA9m9gEDKpXyY=; b=KjoayKjArLbFsSNoo/GKy
 fyg8qWNTBlX79WhI+knhS732aWBNE8DdSKvyE8wPuRlpVwAC4/QcULcuSrXAHMv0
 ZHcgukF7nC7LFRXDxyC4BTMX3eb/MbdUNW47frrFaTF+SdWGtDrg0cdwdSqwPMgC
 nBjOP1DAi+B6MLPc6bjI/I=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=KjoayKjA
Subject: [Buildroot] [PATCH v2 1/2] package/gnutls: bump to version 3.8.8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 35e842546e..6712d1f6ef 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.7.tar.xz.sig
-sha256  fe302f2b6ad5a564bcb3678eb61616413ed5277aaf8e7bf7cdb9a95a18d9f477  gnutls-3.8.7.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.8.tar.xz.sig
+sha256  ac4f020e583880b51380ed226e59033244bc536cad2623f2e26f5afa2939d8fb  gnutls-3.8.8.tar.xz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  doc/COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index a5012b1b21..67b3c16b94 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -6,7 +6,7 @@
 
 # When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
 GNUTLS_VERSION_MAJOR = 3.8
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).7
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).8
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
-- 
2.46.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888A9CCFA05
	for <buildroot@archiver.kernel.org>; Thu,  6 Nov 2025 22:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 207536087C;
	Thu,  6 Nov 2025 22:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puKIM4tE0s3Z; Thu,  6 Nov 2025 22:16:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E69FA60861
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E69FA60861;
	Thu,  6 Nov 2025 22:16:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B0ADA93E
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 22:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2B63843D0
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 22:16:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hs4G2xTDI8Dt for <buildroot@buildroot.org>;
 Thu,  6 Nov 2025 22:16:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.100;
 helo=smtpdh16-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BCFA7843DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCFA7843DA
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCFA7843DA
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 22:16:49 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id H8HevQNob3pJ0H8HfvdTdL; Thu, 06 Nov 2025 23:16:47 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Date: Thu,  6 Nov 2025 23:16:46 +0100
Message-ID: <20251106221646.977086-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBWkrh1E7DDu4haYo0+rGv/OsHsMtJjYbAaIrjM6VY3NarguE5cuAJRh8lTZ42IzCML+LL688JwmA3fTP30yFWSvretTDUcFYezHXJejIyv6OOABUDq6
 pfgzP/kq5aD1raBd+Dcjoj0gPgsp3iXVSo2Y6WlZFI+Nb2oafQ7sYD51Stu6uZpGM7/5orpSvQeAWJT+zlBtivC2ZULTyOy4TOyrMRH/9cqAOQ+p0hosMBRC
 /gLreQjZg0o0xUU/VJaADNyhFi4yh77Os4Qc3oigH0UFJ20Nvo1nefchJY7/cIH6dxddTHqBKCWSi/T3QUP393V8tPHItHPwpcxvhtkkFxk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1762467407; bh=su4r2tbp6E91mCBqUcj+rSw3t20LZMdWXxeCI+h6G+Q=;
 h=From:To:Subject:Date:MIME-Version;
 b=jj3Nu3udueueaEbxQH2ZnPA4Sr6K2jyy7r1S95fOEXn7QI4kN5H8Gr+clU4MkjdSc
 w79xkUik/rREoBqpAyXeRnDjLpvfr5BLx4EJJU6ENA/GR/xufK2kEF2Py3QV6DPbax
 xz53KMz18vQGNtcWX8NJUuEitb2e81zm0pY/C+a7PTc166eBssnE46IfZs/0si7g/m
 gmyeg+bWFeoaenbHqZlHOMhTdP8Unjt8hbQMJjpPozMqAziHw5mswbuxxnuCqiFm1x
 ZpazoeCIL8wRQ+aH9YC2AuKkNANmDR1XXphfMQSffc36UJaeDNjKx10CzuaxG7rZ3t
 4h0rgSY8UOlng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=jj3Nu3ud
Subject: [Buildroot] [PATCH] package/udisks: security bump to version 2.11.0
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

Release notes:
https://github.com/storaged-project/udisks/releases/tag/udisks-2.11.0

Let's also add support for ATA SMART according to libblockdev package.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/udisks/udisks.hash | 2 +-
 package/udisks/udisks.mk   | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/udisks/udisks.hash b/package/udisks/udisks.hash
index 8803bedb21..a62e6b5ed6 100644
--- a/package/udisks/udisks.hash
+++ b/package/udisks/udisks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6401c715d287ec84fe605e0cb90579e8da6c395bce5f42e419f205dd297e261f  udisks-2.10.2.tar.bz2
+sha256  0bf30151fe8d9d2fb59b57f6630739dfbbd16417dee69ec57d43b37335bd649a  udisks-2.11.0.tar.bz2
 sha256  98046e932dc6c739001e79d7079a3bd958fc55475dcd917d27f884c0c93525cc  COPYING
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index 515797f39a..c9b66872e9 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UDISKS_VERSION = 2.10.2
+UDISKS_VERSION = 2.11.0
 UDISKS_SOURCE = udisks-$(UDISKS_VERSION).tar.bz2
 UDISKS_SITE = https://github.com/storaged-project/udisks/releases/download/udisks-$(UDISKS_VERSION)
 UDISKS_LICENSE = GPL-2.0+
@@ -45,4 +45,10 @@ else
 UDISKS_CONF_OPTS += --disable-fhs-media
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_SMART),y)
+UDISKS_CONF_OPTS += --enable-smart
+else
+UDISKS_CONF_OPTS += --disable-smart
+endif
+
 $(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD01C001DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 21:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 417C060B0C;
	Sat,  5 Aug 2023 21:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 417C060B0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1hdmFGCGLCC1; Sat,  5 Aug 2023 21:37:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DF5B60AEE;
	Sat,  5 Aug 2023 21:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DF5B60AEE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3CE9E1BF28F
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 21:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A13C40240
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 21:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A13C40240
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3QeYih8CWihh for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 21:36:35 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51A27415A7
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 21:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51A27415A7
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 60307A4C03A4
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 23:36:33 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48082)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSOwr-00015u-0P
 for buildroot@buildroot.org; Sat, 05 Aug 2023 23:36:33 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  5 Aug 2023 23:36:32 +0200
Message-Id: <20230805213632.3588301-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691271393;
 bh=fQr5hEFdup4DTkiA7zDz3tyULkVAcKxa0C9mWc1Fixo=;
 h=From:To:Subject:Date:From;
 b=K7MSbkIh27DHh+KpcoCkgt8o0KMxaP9LnuyhJwrFIL6HQZdvem6rvGeEmbsx4SKiV
 ELRg3bdgk0LIOOCY55+Zq5QLrO4N5nxWhSPRrLxdUITiHiFUBMNiQ+dTp8iTiPrHrR
 4TDiJYK22AhQTK/QhRakBHrX0ZxVz6JdQxrsbW9SeQtFdp4OSHGnq6AIiEtc4SPvFT
 mOw7LIwOGRPmYDOkp/+4Q4bTXTGkNAR87r15rWHoYjh/ILnJWXMPkP6YeBn4KlklKu
 DSbS7EH6YXXlV9B3wVA3eDvtTZpHZQb4uptyff6JXdbFTJ1HcCmcLKV6SnJBncVah9
 8zniCr6PoCavg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=K7MSbkIh
Subject: [Buildroot] [PATCH 1/1] package/gnutls: bump version to 3.8.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 2f6dba9d3c..a6ba6b22c6 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.0.tar.xz.sig
-sha256  0ea0d11a1660a1e63f960f157b197abe6d0c8cb3255be24e1fb3815930b9bdc5  gnutls-3.8.0.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.1.tar.xz.sig
+sha256  ba8b9e15ae20aba88f44661978f5b5863494316fe7e722ede9d069fe6294829c  gnutls-3.8.1.tar.xz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  doc/COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index d6b8b229bd..d9b9831fd6 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -6,7 +6,7 @@
 
 # When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
 GNUTLS_VERSION_MAJOR = 3.8
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).0
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).1
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

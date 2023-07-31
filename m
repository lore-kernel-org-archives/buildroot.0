Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF49C001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 18:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9E9A418B1;
	Mon, 31 Jul 2023 18:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9E9A418B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PqeuGIVIXbRr; Mon, 31 Jul 2023 18:30:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91D14418B3;
	Mon, 31 Jul 2023 18:30:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91D14418B3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4AC611BF2B8
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 18:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6811641466
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 18:30:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6811641466
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NCJ17REP0Fv8 for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 18:30:34 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DEC5D41030
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 18:30:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEC5D41030
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AF94AA4C0DE5;
 Mon, 31 Jul 2023 20:30:29 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58466)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qQXf3-0008Bo-0S;
 Mon, 31 Jul 2023 20:30:29 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 31 Jul 2023 20:30:29 +0200
Message-Id: <20230731183029.2395283-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731183029.2395283-1-bernd@kuhls.net>
References: <20230731183029.2395283-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690828229;
 bh=XO0zFb4QRa/2n/5kUiihWdtagmplc0Q/Vk7hpE8VW0U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bR5BMgJ9l0duzcLW9ybilnpOBmwL+geTAlsbibgG/JX4JoqBHqVUrgYMEyVSL+bR5
 faTuX8VytBCF9JRde4ibPGLD1g2uluqHwcflMtd2jvSb3IPW/RFdM3hKqjVZB2VkaH
 oniUMU3Tf833BqfmFgXA22xIjfC9C+Z7MBdwfE8r9JMm9QSFyFmQZ9NXs24HLnxdI/
 /vP65/P75VOBJdaSN8dtob0y3qg3VFVhY4OYpDwFXQ6cVVfKJgY9I89dRt3g7N47rg
 R72cw5ro8scUmWxuotLj2A/8pGRiZ5IBxKN7ZLkPbb4KnGSAFksoh/2RktXVhC5lDi
 KJjw7KLzk/WYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=bR5BMgJ9
Subject: [Buildroot] [PATCH 2/2] package/binutils: add support for version
 2.41
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://sourceware.org/pipermail/binutils/2023-July/128719.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/binutils/Config.in.host | 5 +++++
 package/binutils/binutils.hash  | 1 +
 package/libiberty/libiberty.mk  | 2 +-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index e62fea1406..6d2b436d6b 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -25,6 +25,10 @@ config BR2_BINUTILS_VERSION_2_40_X
 	bool "binutils 2.40"
 	select BR2_PACKAGE_BINUTILS_HAS_LIBSFRAME
 
+config BR2_BINUTILS_VERSION_2_41_X
+	bool "binutils 2.41"
+	select BR2_PACKAGE_BINUTILS_HAS_LIBSFRAME
+
 config BR2_BINUTILS_VERSION_ARC
 	bool "binutils arc (2.34.50)"
 	depends on BR2_arc
@@ -37,6 +41,7 @@ config BR2_BINUTILS_VERSION
 	default "2.38"		if BR2_BINUTILS_VERSION_2_38_X
 	default "2.39"		if BR2_BINUTILS_VERSION_2_39_X
 	default "2.40"		if BR2_BINUTILS_VERSION_2_40_X
+	default "2.41"		if BR2_BINUTILS_VERSION_2_41_X
 
 config BR2_BINUTILS_GPROFNG
 	bool "gprofng support"
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 1a24c2f4bd..10243403c7 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -2,6 +2,7 @@
 sha512  8bf0b0d193c9c010e0518ee2b2e5a830898af206510992483b427477ed178396cd210235e85fd7bd99a96fc6d5eedbeccbd48317a10f752b7336ada8b2bb826d  binutils-2.38.tar.xz
 sha512  68e038f339a8c21faa19a57bbc447a51c817f47c2e06d740847c6e9cc3396c025d35d5369fa8c3f8b70414757c89f0e577939ddc0d70f283182504920f53b0a3  binutils-2.39.tar.xz
 sha512  a37e042523bc46494d99d5637c3f3d8f9956d9477b748b3b1f6d7dfbb8d968ed52c932e88a4e946c6f77b8f48f1e1b360ca54c3d298f17193f3b4963472f6925  binutils-2.40.tar.xz
+sha512  5df45d0bd6ddabdce4f35878c041e46a92deef01e7dea5facc97fd65cc06b59abc6fba0eb454b68e571c7e14038dc823fe7f2263843e6e627b7444eaf0fe9374  binutils-2.41.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  76a8227a19218435319c660e4983ea17985194b7f496f163e97543e7f6fd3e9249241fdc05a16ba512fba96a1d846c1f7b080983404d821d6215f10e7f11e238  binutils-gdb-arc-2020.09-release.tar.gz
diff --git a/package/libiberty/libiberty.mk b/package/libiberty/libiberty.mk
index e7a02c963a..ac6afc44ca 100644
--- a/package/libiberty/libiberty.mk
+++ b/package/libiberty/libiberty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIBERTY_VERSION = 2.40
+LIBIBERTY_VERSION = 2.41
 LIBIBERTY_SOURCE = binutils-$(LIBIBERTY_VERSION).tar.xz
 LIBIBERTY_SITE = $(BR2_GNU_MIRROR)/binutils
 HOST_LIBIBERTY_DL_SUBDIR = binutils
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

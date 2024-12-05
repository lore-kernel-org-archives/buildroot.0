Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA80CE7716C
	for <buildroot@archiver.kernel.org>; Thu,  5 Dec 2024 14:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46DDC414BB;
	Thu,  5 Dec 2024 14:37:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_ggRR-QYFw1; Thu,  5 Dec 2024 14:37:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA77E415A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA77E415A1;
	Thu,  5 Dec 2024 14:37:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B88AE1DD9
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 14:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A609A40C0D
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 14:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5B9o2h_bqSD6 for <buildroot@buildroot.org>;
 Thu,  5 Dec 2024 14:37:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E31A041C4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E31A041C4B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E31A041C4B
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 14:37:16 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.30.37]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTAFb-1tE0s73uF5-00HlMz; Thu, 05
 Dec 2024 15:37:09 +0100
To: buildroot@buildroot.org
Cc: Grzegorz Blach <grzegorz@blach.pl>, Marcin Bis <marcin@bis.org.pl>,
 Fiona Klute <fiona.klute@gmx.de>,
 "Fabrice Fontaine" <fontaine.fabrice@gmail.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Date: Thu,  5 Dec 2024 15:36:49 +0100
Message-ID: <20241205143650.3262372-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241205143650.3262372-1-fiona.klute@gmx.de>
References: <20241205143650.3262372-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:OtQ+getBg2ac2nUcj4w+J5Fe9P7QA7wH036IUnfk6ChnoQmcbnX
 yB2gNOx8S4b/UHdchES0tuZ9hbbVQSBholz1JaasD8qEWAeJp0um+8osnluuibd0Kz4t9d+
 uxRLJ0MkvTPDIYXzLUa10UElhkCVSuoTl9TuG5yXm4RO2wiAoaASLYLozUozfk5FaPjaVmI
 56spseTstTc4iEHrHAa5A==
UI-OutboundReport: notjunk:1;M01:P0:mu21GbtIiik=;ghyZj1Wq7vBHG3vCOMmzhLIzWQr
 HTgXrK1X5+8Z1OaB0j02tCbkVfwzagpV/NRJtFlRwSxNli8xi44Lm8bBnN0X9v9NnSPyFAxTW
 dlV/DfFV2whvQomYPLDwxmh4h0Uqdox5SrEWj18GJdDjEzCMm0N8b3yN+ZWCCca/2+ufPldCu
 nQU/5hXGY+9J+98fyhsfNH+oh1+Q3p4l+VuVYN6n4uyECI1OMgLn9QcitSnDUGJemyD4osbBJ
 OdSHjoxaZyaeLTAfpXfFTVFcqwjZ58VF3PSZPQI8dBvBub4F/DQ4wDwzIfbreYqIR1vmxartu
 W6FHHyCWkeJmOXCyOFQ5XwUN+64lmZAsW18K7mQwPrzj0rnVGYPvGhCj8pG5K+VupqXRo5F9z
 qJGahuyHcAyv5pCAiVA7FrsqXUgY3/DEFHp0SqhC+xseh83MjupkQSIhYV3ZMo3yIZ6+TVTCZ
 BUWWgvteX70zQEnR5lNQxjRHSjHaQtjf1hPSIjBESjMJfmqmu9gF1de6vY2zLR/irhvEWspZt
 56tjlJ+a0uTJmQTHK8KfBal1hhoASkE5MCfVOjfzbncKvFqnEDbDYDM78NHUc4WoYTDUd9SYk
 Fz9FRE9PRuxqXJra4LsKGTKiFxCh/i95p6rNMdhxB7xJLC3sdwNDYy2u6+uZriuylauOLS/6j
 MkkEqvmsZl8PS5XUvRDM1zeu6jc9dQktCHP7VJzV0VfJ3rt30PBV5WVHpWGM94RD59rkqeBXQ
 pDbEtD9YJC5M1mLQOgEE3AfuHGzL5j5rO9iyemNMLxA5WdSujGPTl4jwNeC5HCI6HjGAZE/sW
 knYb/UJlzKnA0Dia8h042vAMUGWSyNrY4PBeQAm21+1pEnyPZ6omZ+Br12H4er4qWV0sNmYnO
 pCPvekcUJkDOKf/Oke1wzWlE4UBXTOXP3T8ui4VyAqJ+/TAZXQDIsSczdolT88rPZ1NMTyciF
 WmCrT2mqg2uArOnWxtwPXcLnxwvdBXok6UUhI2iU+7qeHSJ7ygiq/w2ZisQqGDGCMdR89WVjR
 bFWCrIIGScu0ni6b2H3cx5qyJJSaiJqGqvTreOdVgW05V8cXU4iO1/ARq1CYXL1c7n7yxCGeU
 xN48YSjG5zqKdDN+vXoP89MAvY8//J
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1733409429; x=1734014229; i=fiona.klute@gmx.de;
 bh=zlSSNTmg7LBKYVP/nIe1bpWwN2Od/cLF6DYUt1YmhBM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=l4AeZaoXbfev0xt0mGfpVO2RjUkvXnn4IH4du3XNXDfi+aZm6/IpkPZofEGrdL/T
 of3y2zAHIHBwNGJNr/BOOn45O6ObziW3MlpFRjg94lLUdCySqgxPYFXDYZkzOUnnM
 ACButEnl9bik+ZYSrSOgwXGd9gIb//cC22M/n51WgAociUuEQaTyl46Ne6EISh9P0
 YaBoikzwtg/XmZd9ghFNkzNbj9KHjYuBFqTKTvjhnxUGwKyMTLCTxcY/9k/o6i2t/
 8XM9OWBDypnW8roccNA10g8PwPSqr8mtDVx56qI5VJIyz4dvy1KhG6ogjpAuTtei2
 A+XP3IrHFpDpEbItgA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=l4AeZaoX
Subject: [Buildroot] [PATCH 3/4] package/bluez5_utils: install datafiles
 with correct permissions
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

The datafiles include the dbus policy, without which bluetoothd fails
to start (unless it is provided by other means):

# /usr/libexec/bluetooth/bluetoothd -n
bluetoothd[1011]: Bluetooth daemon 5.78
D-Bus setup failed: Connection ":1.7" is not allowed to own the service "org.bluez" due to security policies in the configuration file
bluetoothd[1011]: src/main.c:main() Unable to get on D-Bus

The installation issue 1a8676aa6e4b0e372a1a744eac6e53c90c03bf0e was
meant to fix is the result of upstream incorrectly installing
/etc/bluetooth with 0555 (strictly read-only) permissions.

Fixes: 1a8676aa6e4b0e372a1a744eac6e53c90c03bf0e

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 ...eave-config-files-writable-for-owner.patch | 35 +++++++++++++++++++
 package/bluez5_utils/bluez5_utils.mk          |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 package/bluez5_utils/0002-Leave-config-files-writable-for-owner.patch

diff --git a/package/bluez5_utils/0002-Leave-config-files-writable-for-owner.patch b/package/bluez5_utils/0002-Leave-config-files-writable-for-owner.patch
new file mode 100644
index 0000000000..30dec0c47e
--- /dev/null
+++ b/package/bluez5_utils/0002-Leave-config-files-writable-for-owner.patch
@@ -0,0 +1,35 @@
+From e94cb1a53bab1a3888d3576d0d5d23c2001acee4 Mon Sep 17 00:00:00 2001
+From: Fiona Klute <fiona.klute@gmx.de>
+Date: Thu, 5 Dec 2024 13:39:39 +0100
+Subject: [PATCH] Leave config files writable for owner
+
+This is needed both so the owner can adjust config as needed, and for
+distribution builds to be able to move/delete files as part of the
+build without adjusting permissions themselves. Limiting writes from
+the running service needs to be done in the systemd unit (already the
+case) or init script.
+
+See also: https://lore.kernel.org/linux-bluetooth/4d1206df-598b-4a68-8655-74981b62ecca@gmx.de/T/
+
+Upstream: https://lore.kernel.org/linux-bluetooth/20241205133233.1738092-1-fiona.klute@gmx.de/T/
+Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 297d0774c..29018a91c 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -32,7 +32,7 @@ confdir = $(sysconfdir)/bluetooth
+ statedir = $(localstatedir)/lib/bluetooth
+ 
+ bluetoothd-fix-permissions:
+-	install -dm555 $(DESTDIR)$(confdir)
++	install -dm755 $(DESTDIR)$(confdir)
+ 	install -dm700 $(DESTDIR)$(statedir)
+ 
+ if DATAFILES
+-- 
+2.45.2
+
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 7725fb94bf..e3b47e1e80 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -13,6 +13,9 @@ BLUEZ5_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 BLUEZ5_UTILS_CPE_ID_VENDOR = bluez
 BLUEZ5_UTILS_CPE_ID_PRODUCT = bluez
+# required because 0002-Leave-config-files-writable-for-owner.patch
+# modifies Makefile.am
+BLUEZ5_UTILS_AUTORECONF = YES
 
 BLUEZ5_UTILS_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_BLUEZ5_UTILS_HEADERS),bluez5_utils-headers) \
@@ -22,7 +25,6 @@ BLUEZ5_UTILS_DEPENDENCIES = \
 BLUEZ5_UTILS_CONF_OPTS = \
 	--enable-library \
 	--disable-cups \
-	--disable-datafiles \
 	--disable-manpages \
 	--disable-asan \
 	--disable-lsan \
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45439C001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 18:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C10AD42156;
	Mon, 31 Jul 2023 18:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C10AD42156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NXyzzVRj8nOy; Mon, 31 Jul 2023 18:31:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 434FF42174;
	Mon, 31 Jul 2023 18:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 434FF42174
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 192151BF2B8
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 18:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52139418B3
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 18:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52139418B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h-rzLucK2GsQ for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 18:30:46 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5CF64214B
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 18:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5CF64214B
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ADF04A4C0AA7;
 Mon, 31 Jul 2023 20:30:29 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58466)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qQXf3-0008Bo-0D;
 Mon, 31 Jul 2023 20:30:29 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 31 Jul 2023 20:30:28 +0200
Message-Id: <20230731183029.2395283-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690828229;
 bh=7Ax5/9LcVCaYaHa7beA8EvmDzrfJx83GQ6RDx7/P73o=;
 h=From:To:Cc:Subject:Date:From;
 b=j1Q8h+EpHXBD0IUyi7+MUtwBl8EU7C1rX0S11RoeREQi7NoRicMesGfeHmLy9/KCa
 +T/X9RnjvT2mQ+jQQFHKEzczUefJvy4uWXxaZ0sin/jtI+Z8wwa2EOfFdKyc4C3wl6
 F7eTiGTVo9tokf5hyTjAubjvmDyZv7csb2S2BoMWNhXpgrIo0ZXIMq6m49dz0D1gAB
 Ev9pAUpOc6y9sIzqLhS/3/2VU4ee8LXZsCuG9psk/Az7+LnC3E9UCiqEnZ2D7TJ4ST
 NuxXB/oteG0yS3Vq8UkpAWlny8KEtPCzQa4hP4LMq9Uxgyh2s/29GUt1eBwGPnBSu3
 cct9BM4t6dJeQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=j1Q8h+Ep
Subject: [Buildroot] [PATCH 1/2] package/binutils: install libsframe to
 staging
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

binutils 2.40 added libsframe:
https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=19e559f1c91bfaedbd2f91d85ee161f3f03fda3c

Quoting release notes:
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob_plain;f=binutils/NEWS;hb=refs/heads/binutils-2_40-branch
* readelf and objdump now have a newly added option --sframe which dumps
  the SFrame section.

Install libsframe to staging when available to avoid build errors, for
example with lightning:
libsframe.so.0, needed by output/per-package/lightning/host/arm-
  buildroot-linux-gnueabi/sysroot/usr/lib/libopcodes.so, not found

Fixes:
http://autobuild.buildroot.net/results/1d1/1d1480dc0c3fb0a88490e3fae85abb2aa76bdade/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/binutils/Config.in.host | 4 ++++
 package/binutils/binutils.mk    | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index de5ca866e5..e62fea1406 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -5,6 +5,9 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 	default y
 	depends on !BR2_microblaze
 
+config BR2_PACKAGE_BINUTILS_HAS_LIBSFRAME
+	bool
+
 choice
 	prompt "Binutils Version"
 	default BR2_BINUTILS_VERSION_2_39_X if !BR2_arc
@@ -20,6 +23,7 @@ config BR2_BINUTILS_VERSION_2_39_X
 
 config BR2_BINUTILS_VERSION_2_40_X
 	bool "binutils 2.40"
+	select BR2_PACKAGE_BINUTILS_HAS_LIBSFRAME
 
 config BR2_BINUTILS_VERSION_ARC
 	bool "binutils arc (2.34.50)"
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 0dd8526b26..48a036651c 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -105,12 +105,19 @@ endif
 # our TARGET_CONFIGURE_ARGS are taken into consideration for those
 BINUTILS_MAKE_ENV = $(TARGET_CONFIGURE_ARGS)
 
+ifeq ($(BR2_PACKAGE_BINUTILS_HAS_LIBSFRAME),y)
+define BINUTILS_INSTALL_STAGING_LIBSFRAME
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libsframe DESTDIR=$(STAGING_DIR) install
+endef
+endif
+
 # We just want libbfd, libiberty and libopcodes,
 # not the full-blown binutils in staging
 define BINUTILS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(STAGING_DIR) install
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(STAGING_DIR) install
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
+	$(BINUTILS_INSTALL_STAGING_LIBSFRAME)
 endef
 
 # If we don't want full binutils on target
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

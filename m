Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C6BEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 12:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3841D60BEA;
	Sun, 25 Jun 2023 12:49:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3841D60BEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EytYZx2nfmpV; Sun, 25 Jun 2023 12:49:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63DCA60BD3;
	Sun, 25 Jun 2023 12:49:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63DCA60BD3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C07A1BF870
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 12:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82AA781858
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 12:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82AA781858
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0L9VDrCqn75N for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 12:49:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9423E81852
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9423E81852
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 12:49:04 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id 233745FD08;
 Sun, 25 Jun 2023 15:49:02 +0300 (MSK)
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Sun, 25 Jun 2023 15:49:02 +0300 (MSK)
To: <buildroot@buildroot.org>
Date: Sun, 25 Jun 2023 15:48:48 +0300
Message-ID: <20230625124848.1423168-2-ovlevin@sberdevices.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230625124848.1423168-1-ovlevin@sberdevices.ru>
References: <20230625124848.1423168-1-ovlevin@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/06/25 08:59:00 #21574316
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sberdevices.ru; s=mail; t=1687697342;
 bh=rQ9gVUe3jR30hnlCFevF52sNPSIFBsIjdBpcVgqp9BY=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=nnl9p0eepfKmNytM6sVePA8n45B7si0V74ygJZsFZZ8eOI6QWaxV3QmsqJhcTn0rA
 1K6XHuuoqz8r4wQRkKw/ipw2sSrkWjMOCoMpAq6wRpW/wNlMpSnliIfCRiWQFzn92z
 b+w1xOAbhWQZhe/bpYrxal6KvzE6sqUoIwyBBS2szUu/Gg3XpZpoGbDvsmDC9lO+Lr
 IBvese6OAt2cvV2NGb0KpWEW3196+FdwUfXQ9lxh8mq8uMpUiU14pUlm2XhSE4mvws
 qHMIx1S7gjfjqT54twIhhpFoFDx06GObfGbAiVuF67A8yvKX5CEsnQ734YkUp2NmoT
 0JXDah6v0l4JQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=nnl9p0ee
Subject: [Buildroot] [PATCH 2/2] package/libcgroup: fix build with musl
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
From: Oleg Lyovin via buildroot <buildroot@buildroot.org>
Reply-To: Oleg Lyovin <ovlevin@sberdevices.ru>
Cc: olegartys@gmail.com, Oleg Lyovin <ovlevin@sberdevices.ru>,
 sdfw_system_team@sberdevices.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libcgroup depends on fts API which is missing in musl libc
and provided by musl-fts package.

This patch makes libcgroup dependent on musl-fts for 
non-glibc configurations.

Signed-off-by: Oleg Lyovin <ovlevin@sberdevices.ru>
---
 package/libcgroup/Config.in    | 7 ++++---
 package/libcgroup/libcgroup.mk | 5 +++++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/libcgroup/Config.in b/package/libcgroup/Config.in
index 03efa71e6b..75c9accacc 100644
--- a/package/libcgroup/Config.in
+++ b/package/libcgroup/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_LIBCGROUP
 	bool "libcgroup"
 	depends on BR2_INSTALL_LIBSTDCPP
 	# libcgroup uses <fts.h> which is not included by default in uClibc
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_MUSL_FTS if BR2_TOOLCHAIN_USES_MUSL
 	help
 	  libcgroup is a library that abstracts the control
 	  group file system in Linux.
@@ -18,5 +19,5 @@ config BR2_PACKAGE_LIBCGROUP_TOOLS
 
 endif
 
-comment "libcgroup needs a glibc toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
+comment "libcgroup needs a glibc/musl toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP || !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
index fb0b646c51..d67710ec1e 100644
--- a/package/libcgroup/libcgroup.mk
+++ b/package/libcgroup/libcgroup.mk
@@ -36,4 +36,9 @@ else
 LIBCGROUP_CONF_OPTS += --disable-pam
 endif
 
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
+LIBCGROUP_DEPENDENCIES += musl-fts
+LIBCGROUP_CONF_ENV += LDFLAGS=-lfts
+endif
+
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5554FC43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 21:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B858F41798;
	Tue, 14 Jun 2022 21:27:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RxPa4vpMN0nB; Tue, 14 Jun 2022 21:27:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AD4D41571;
	Tue, 14 Jun 2022 21:27:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 557731BF2C4
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 21:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42A60409C1
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 21:27:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pj4nWAKvO9fl for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 21:27:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0307140191
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 21:27:34 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id o16so12886799wra.4
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 14:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iZiGInQgaL7p1MER3g8h4J4fRQBJqnOO5CeVoyt19+g=;
 b=hiQFN3j8wrkB7tZIscnqEXAcWq6cPGjxwjCPobYAgn/YuQSHIsd6oRzZXcuOR0qQuD
 svr1yJxU2qL+YqmxVZSl+PtRme9V7oSu+pOQEeB0Nz7G4qhqgWVeURMC3u2zQbT+iRuM
 0SZeiOWzbUm5fYk0vjVMjjNNbnoA/yI3OP1oIqm+Kg5IlUNNMiqKum6Qy+DK2nq4jJcI
 zZYmUVVdy+A7tgHohXBTAPM/QkOaLwfGoTMr6xSoF9i8geE1wAQp20LtjentEV7j4K7D
 7f7u2Budytg/noNbfxshjxwmfNC5mAb8HSv1OOkL/4gEDYBNbGHPh0lLYLhSILcuSfZL
 as1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iZiGInQgaL7p1MER3g8h4J4fRQBJqnOO5CeVoyt19+g=;
 b=omFDNGyKKP/OAblXM7/R2Qm4L198pg/UOLt/W4cxgK/fSCaEL+PVZP/Kw4YptdMi9k
 I65RT5hZ0M/UcvIK+4yUR/YRkzLiPZjJE8kUz0riS+l4ABgOSFecCkE63EoJ9Frq0bi8
 m35tBzd9cGzYpHGYqN7tIXQk8fB0rn4MTrjIHWbjGWoM8zOxk7zKbf8UC9vQoaQdtJOC
 WZMmRJmBMqHdVMBtDYqfl1yPv+SkJEMCWgS8YQTqN1MDhafN0pZnbXd3P+9/UNUcrKea
 eJ2nrDSWgAHlmDuIjlAxW6YomcEZJ2QuV9fWQ3w2HWT9FJCkGTzVyepdR7t8SS00M6g1
 PHrw==
X-Gm-Message-State: AJIora9i8XrF8I8M1ZzKcwFiN6C7zgknQagiVKJJuOprTF3DBnCfkWYS
 QWSAnpWFRxePrwNNckOwEK1uv9Bnjbg=
X-Google-Smtp-Source: AGRyM1tI2xXsKN8qDt8TyVGngaMDgZxn8oDkmPjoNc/GWvn0Qr7sdENyy28mzgPySg97mwqob8XMjw==
X-Received: by 2002:adf:cc8f:0:b0:213:ba72:4ca with SMTP id
 p15-20020adfcc8f000000b00213ba7204camr6605920wrj.92.1655242051569; 
 Tue, 14 Jun 2022 14:27:31 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a5d56ca000000b0020c5253d8f7sm12956033wrw.67.2022.06.14.14.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 14:27:30 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 23:24:44 +0200
Message-Id: <20220614212446.3491084-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/netsniff-ng: libnl is optional,
 not mandatory
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libnl is optional, not mandatory, since version 0.6.2 and
https://github.com/netsniff-ng/netsniff-ng/commit/20a5e15443bfbbb7e6624a754832cdce19d462a0
https://github.com/netsniff-ng/netsniff-ng/commit/b073c8e5fd7f8c723680b659bd81afd231ef32f5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netsniff-ng/Config.in      |  1 -
 package/netsniff-ng/netsniff-ng.mk | 11 +++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
index 5d1407baac..6b043362ba 100644
--- a/package/netsniff-ng/Config.in
+++ b/package/netsniff-ng/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_NETSNIFF_NG
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
 	select BR2_PACKAGE_LIBURCU
diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
index 27bd707c84..3bc11b55b9 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -13,7 +13,8 @@ NETSNIFF_NG_LICENSE_FILES = README COPYING
 NETSNIFF_NG_CONF_ENV = \
 	NACL_INC_DIR=/dev/null \
 	NACL_LIB_DIR=/dev/null
-NETSNIFF_NG_DEPENDENCIES = host-pkgconf libnl libpcap libnetfilter_conntrack liburcu
+NETSNIFF_NG_DEPENDENCIES = host-pkgconf libpcap libnetfilter_conntrack liburcu
+NETSNIFF_NG_CONF_OPTS = --prefix=$(TARGET_DIR)/usr
 
 ifeq ($(BR2_PACKAGE_NETSNIFF_NG_MAUSEZAHN),y)
 NETSNIFF_NG_DEPENDENCIES += libcli libnet
@@ -28,6 +29,12 @@ ifeq ($(BR2_PACKAGE_GEOIP),y)
 NETSNIFF_NG_DEPENDENCIES += geoip
 endif
 
+ifeq ($(BR2_PACKAGE_LIBNL),y)
+NETSNIFF_NG_DEPENDENCIES += libnl
+else
+NETSNIFF_NG_CONF_OPTS += --disable-libnl
+endif
+
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 NETSNIFF_NG_DEPENDENCIES += ncurses
 endif
@@ -43,7 +50,7 @@ define NETSNIFF_NG_CONFIGURE_CMDS
 		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
 		./configure \
-		--prefix=$(TARGET_DIR)/usr \
+		$(NETSNIFF_NG_CONF_OPTS) \
 	)
 endef
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

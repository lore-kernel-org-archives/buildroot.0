Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F7ACC433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 15:30:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3409610CE
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 15:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3409610CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=theobroma-systems.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75EB560829;
	Mon, 20 Sep 2021 15:30:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h1A1Bdiwao4h; Mon, 20 Sep 2021 15:30:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D791C60817;
	Mon, 20 Sep 2021 15:30:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 02BF31BF400
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 15:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4201403F3
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 15:30:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ToJinHZGS1Uq for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 15:30:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.theobroma-systems.com (vegas.theobroma-systems.com
 [144.76.126.164])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF23E403BA
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 15:30:42 +0000 (UTC)
Received: from ip092042140082.rev.nessus.at ([92.42.140.82]:57024
 helo=meitner.lan) by mail.theobroma-systems.com with esmtpsa
 (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256) (Exim 4.80)
 (envelope-from <martin.elshuber@theobroma-systems.com>)
 id 1mSLFe-00027N-Ov; Mon, 20 Sep 2021 17:30:38 +0200
From: Martin Elshuber <martin.elshuber@theobroma-systems.com>
To: buildroot@buildroot.org
Date: Mon, 20 Sep 2021 17:28:31 +0200
Message-Id: <20210920152831.2489077-2-martin.elshuber@theobroma-systems.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913142652.942533-2-martin.elshuber@theobroma-systems.com>
References: <20210913142652.942533-2-martin.elshuber@theobroma-systems.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] package/strongswan: add md4 hash
 algorithm option
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Martin Elshuber <martin.elshuber@theobroma-systems.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Add the option to enable the md4 hash algorithm and default it to 'no'
since this is a new option.

Since md4 is required by EAP-MSCHAPv2 it is selected by
BR2_PACKAGE_STRONGSWAN_EAP_MSCHAPV2. See
https://wiki.strongswan.org/projects/strongswan/wiki/Autoconf for
further details.

---
Changes v1 -> v2:
- change git title

Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
---
 package/strongswan/Config.in     | 4 ++++
 package/strongswan/strongswan.mk | 1 +
 2 files changed, 5 insertions(+)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 8eae568b6a..21f84ebb71 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -73,6 +73,9 @@ config BR2_PACKAGE_STRONGSWAN_TNCCS_20
 config BR2_PACKAGE_STRONGSWAN_TNCCS_DYNAMIC
 	bool "Enable dynamic TNCCS protocol discovery module"
 
+config BR2_PACKAGE_STRONGSWAN_MD4
+	bool "Enable MD4 hash algorithm"
+
 config BR2_PACKAGE_STRONGSWAN_EAP
 	bool "Enable EAP protocols"
 
@@ -127,6 +130,7 @@ config BR2_PACKAGE_STRONGSWAN_EAP_GTC
 config BR2_PACKAGE_STRONGSWAN_EAP_MSCHAPV2
 	bool "Enable EAP-MSCHAPv2"
 	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
+	select BR2_PACKAGE_STRONGSWAN_MD4
 
 config BR2_PACKAGE_STRONGSWAN_EAP_PEAP
 	bool "Enable EAP-PEAP"
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 5fb4e6821a..c308d3a4f3 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -37,6 +37,7 @@ STRONGSWAN_CONF_OPTS += \
 	--enable-vici=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
 	--enable-swanctl=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
 	--enable-wolfssl=$(if $(BR2_PACKAGE_STRONGSWAN_WOLFSSL),yes,no) \
+	--enable-md4=$(if $(BR2_PACKAGE_STRONGSWAN_MD4),yes,no) \
 	--enable-eap-sim=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM),yes,no) \
 	--enable-eap-sim-file=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_SIM_FILE),yes,no) \
 	--enable-eap-aka=$(if $(BR2_PACKAGE_STRONGSWAN_EAP_AKA),yes,no) \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

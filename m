Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E72EC87FCF
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 21:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CA5E40B3B;
	Sat,  9 Aug 2025 21:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X-FRW2h2Mu6f; Sat,  9 Aug 2025 21:47:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D70540B0D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D70540B0D;
	Sat,  9 Aug 2025 21:47:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BFD61D3
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7265D4099B
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:47:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uhzbW23VkRCV for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 21:47:00 +0000 (UTC)
X-Greylist: delayed 304 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 09 Aug 2025 21:46:59 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 16CE240969
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16CE240969
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16CE240969
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:46:59 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from pc-1.fritz.box ([82.135.81.137]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3UV8-1ukJMJ1swc-00CFIA; Sat, 09
 Aug 2025 23:41:53 +0200
To: buildroot@buildroot.org
Cc: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  9 Aug 2025 23:41:50 +0200
Message-ID: <20250809214151.2423583-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:KpWafnTD3/QpbNVvA9lD7TAduz6XMcv+1zXPwSyi0ASGoitbJkb
 52pmUermFfdtz52B1VvIRuXwIwL4+sezS2iPNqjG1ljCMLDZsD3HG2SncDccJgwH23xTxvo
 mqi0jBRkKCv3XpVNDvtF/MkpLEISqbvG3U5jo1SIJAMcLWAfKV8EN1JAm1w8WDEc20vxA3J
 1TKqdppdGbPjVZ+pA8+CQ==
UI-OutboundReport: notjunk:1;M01:P0:foltT02aEDY=;s0Qj96Ara/nj/J0FVFF5GVJFeng
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1754776018; x=1755380818; i=ps.report@gmx.net;
 bh=pWi+EWCTJGCrv/ZgxfNhh8vXAVHe+X2+ba4VmZOuYik=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=RWRKq8lPsLyY23ohdC4llGOUlfj5Nyu41teDggeMHAXkAsL/gKoDaGsSeUF2LuX1
 yBWI1o3sOl1TbDEtxNGgL4kQE99MiMYQbgj9t8CPbr8oFOiT20Q26ZnhNkXhV1EB3
 s0CDlBPe9jQ9T1HXBAR3r08XdBC/8YwOTRLEa9xk3tjkgX3c2noE0Ri4aSo2yCsqz
 DAojbE0elp9FEOTmOgyikkB+p/xB9F2UxpFF4WWHrZV4cspuEffG0TVRGI3sUwTof
 Nt0WLCQlsTNj/+NCLJITaqh5J3g4MyYSun+awj84d7TAPja/483W8rvV93+Y7RlZD
 WCjGiMiiHqQitgzPIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=RWRKq8lP
Subject: [Buildroot] [PATCH v1 1/2] package/iwd: add optional iwmon support
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- add option for iwmon support
- enable linux kernel CONFIG_NLMON option needed for iwmon

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/iwd/Config.in |  9 +++++++++
 package/iwd/iwd.mk    | 10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/iwd/Config.in b/package/iwd/Config.in
index 59d4422305..4255e01e70 100644
--- a/package/iwd/Config.in
+++ b/package/iwd/Config.in
@@ -13,6 +13,15 @@ config BR2_PACKAGE_IWD
 
 	  https://iwd.wiki.kernel.org/
 
+if BR2_PACKAGE_IWD
+
+config BR2_PACKAGE_IWD_IWMON
+	bool "iwmon"
+	help
+	  iwmon - Internet wireless monitor utility
+
+endif
+
 comment "iwd needs a toolchain w/ threads, wchar, headers >= 4.12"
 	depends on BR2_USE_MMU # dbus
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # ell
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index de90b2d346..138bc307dd 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -41,6 +41,15 @@ else
 IWD_RESOLV_SERVICE = resolvconf
 endif
 
+ifeq ($(BR2_PACKAGE_IWD_IWMON),y)
+IWD_CONF_OPTS += --enable-monitor
+define IWD_LINUX_CONFIG_FIXUP_MONITOR
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NLMON)
+endef
+else
+IWD_CONF_OPTS += --disable-monitor
+endif
+
 define IWD_INSTALL_CONFIG_FILE
 	$(INSTALL) -D -m 644 package/iwd/main.conf $(TARGET_DIR)/etc/iwd/main.conf
 	$(SED) 's,__RESOLV_SERVICE__,$(IWD_RESOLV_SERVICE),' $(TARGET_DIR)/etc/iwd/main.conf
@@ -76,6 +85,7 @@ define IWD_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_PKCS7_MESSAGE_PARSER)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_PKCS8_PRIVATE_KEY_PARSER)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_X509_CERTIFICATE_PARSER)
+	$(IWD_LINUX_CONFIG_FIXUP_MONITOR)
 endef
 
 $(eval $(autotools-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

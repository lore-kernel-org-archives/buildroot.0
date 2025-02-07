Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048DCC02199
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 13:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A214C605FC;
	Fri,  7 Feb 2025 13:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRucG8wiFypy; Fri,  7 Feb 2025 13:31:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EE6860669
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EE6860669;
	Fri,  7 Feb 2025 13:31:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E0979C0
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 13:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAB0F40424
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 13:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id siF_TjjxUj6j for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 13:31:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5726A40407
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5726A40407
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5726A40407
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 13:31:34 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.179]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWAOQ-1tvLtR2M0o-00QBs6; Fri, 07
 Feb 2025 14:31:31 +0100
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Fri,  7 Feb 2025 14:31:28 +0100
Message-ID: <20250207133128.3646294-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:UwaYqyVU+sCgRNMjhkMr8rPY3YXmJLEg+aZfDj4b0Mn+ZyLuUcZ
 csA+P1RrDDqqTXUCFPkuw/NZRY9GB8L3H7hGJogc3NLHNnIiDnLUr2pFSvYrGxT/1lKbPdg
 ZbQc+bJgzflbCTiI2u+cvgooXybkxrn06DaY5wUmCVf25EwN18bb4fVXEonhzEUQw+jklTn
 Yq1i/20zkvahOz8GfcY7g==
UI-OutboundReport: notjunk:1;M01:P0:9Mkzhfmd9QI=;9KHO8EfeaWPMrS/KrOI84OH9z33
 4AGgZtvPCHPDXIm/n7fFKLAj8FXr7IIbKfnWXsnXga1tPdAlhiiDfw1PNdnRsttZckazTLIWZ
 k9ouHRsg7c4Zj5HfIA5w7+8doo2SxIjcMFHEycZC/0uZj3A3meKAboXhR0FIOY2Z5zyo9WYVr
 tK/2z2NnYCIwptKB6Tf6fgzffaN8WGWlLggpYLFvFOrbjYlcVGq4GtzllnWdNXWrlFC7x4Y7p
 G7v3+buMIYZWGuonX+WRi6hnPZeDZcF/k0pjwODuJ8rMxZn6wLrEaqxBG1b2CrxOy1g8aePS7
 +Lh9IToqD4/xkezelZgXVZmi29Is5/sOzaMjDNNFG9iOvKRP5tZUxYaUwL3DNrnd8Y14B1uXA
 ua/vTzII4tLnicjtyKTHuHcJvqKI/2ZF+bE2jsaGm0IcVxL2B1GZuIl4zo7M2ObM56m8g8cmM
 2trnrl6rYfj9kmoNHMHn5rXtoTgiN2IMTTsdxrX+oTVGMTG+oGSX0MaIv/OU3doXO/g7Gbrru
 MJbtDzgPym38X3KsHaghtBf7mGMIOVCxTjX7jwe3gNDuYUxHGFIzodHCINJhsFgC913VFuV4i
 niNWqZAo9uSSWkXUMSFVqXtZpaUlqOzk3S06TD3OmTDv2aXgVabnXdcSTmYyKk9V5+h3nbMZW
 +L8PbbPlyD4Um2NCHE+9zFHtlGqMHrdZFUwikIwSCJLI/Uol8Fo0n1YOmTdL9+eWg2ksUhRDr
 aMSXKCjcSn7TBv4evq8ApT53ZrRXK3S5eclNoQzdS91Zffg6HV+xvYc1ta7s7kVQ/0ovmgzP/
 DuHJcBP8JVyirTkW5nXN4pGfyfF7SUMKEkaBlR0b01zvGD33+GJj/M5bMiKxMoV1BoCbJfwIP
 K6NWyjKXIBOK0oZIqIOfZaJ/CoKHyCpvKMBxkAp2HTjW5Vsin/ZCR1Lh7YVjH1pf1sEC8LPwo
 HJoHQDz62eE3Wb9WzLF0PZXqUQL8rP6dAwhl0wLAk17H+v342b6VOwhVKxLHTKbaX3kAtuPrp
 6NO8GXSWyrhYBfJfzBSUucsSYWDA1fa1+Xdq8s5ki93vj12eGzO8wQL9Ishf1QUCK9hkzJn4D
 ctRyENck+O0p0oKqpctiSFktrpeTSerVpliXcydqFS/CzI67jBxwHvmCNPSR6fauqroc7BnhO
 /ru8quIFv5uGTHxt4VmZpexYtGE7+ATTdDBeE8IPJty26fK4zMGahFgBFQgXOEtl7ze0bRPKk
 VAprRndcAo0PcKuQwjfLBG5kfR7BZAtHU692PF0AtOyQErsulUNNQxZQ79AYBbETDkOUI3PRB
 ptLC4mbnzgQLPnjuEmjy33xrQS2QFwNbKhxXN0dpzXd+e8MlbEj+0Zkj096wg9TXOqpNsA4pP
 jxaAEyAvukp0rksSDh3yrXf6YuWO0z9/GvIkcvVKLL3fH9wfZIrgXsxs0ZRKSEjQUij9khp7S
 xus4iwQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738935091; x=1739539891; i=fiona.klute@gmx.de;
 bh=ANfBHSRxbAapN9I2VvbqVVmuGXRMi0HiTQXHKActBF0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=YmSYSiL5U4ycvQlt56blRCMqJ89dco0xHbxROOqRhu1JLtcxVwoBbnV52OxjlzI6
 rDt9XGUZPKlgu5F3xW3LDViIyWtRbEufQbX6/rNXBS3vt1OOUJs0xU1glCWXvj9i+
 2Uy3DpV4NmiK4ZdWNRXU+7GZC89rboarT0E8xdhWEph4O55dBpTa6ZeloPprbNkRZ
 RF3YzU0oAf/yW8ytYeyKPqBG/KLJzUIG4BC9+SmEtg0jz/PtqoJaG4LFrqJhNcO8B
 Hvzkcb+xPxlJs1mBij6o8wjHSlhhIcUMoNV9LC3rvmUKvoCovv22njuVSwJ9gwWkF
 yQk5kRdpl7I7ZKA+dg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=YmSYSiL5
Subject: [Buildroot] [PATCH 1/1] package/chrony: optional NetworkManager
 DHCP integration
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

If the new BR2_PACKAGE_CHRONY_NM_DHCP option is enabled, chrony will
automatically add NTP servers received over DHCP to its sources. This
is particularly useful for devices without a battery-backed RTC, if
the local DHCP (including DHCPv6) server announces nearby NTP servers.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/chrony/Config.in | 14 ++++++++++++++
 package/chrony/chrony.mk |  8 ++++++++
 2 files changed, 22 insertions(+)

diff --git a/package/chrony/Config.in b/package/chrony/Config.in
index 453e4f6c3f..7b3515e5af 100644
--- a/package/chrony/Config.in
+++ b/package/chrony/Config.in
@@ -17,4 +17,18 @@ config BR2_PACKAGE_CHRONY_DEBUG_LOGGING
 	  enabled at runtime. If disabled, code for debug logging will
 	  not be compiled in.
 
+config BR2_PACKAGE_CHRONY_NM_DHCP
+	bool "receive NTP sources from NetworkManager DHCP client"
+	depends on BR2_PACKAGE_NETWORK_MANAGER
+	help
+	  Install a NetworkManager dispatcher script that writes NTP
+	  servers received over DHCP to a per-interface sources file
+	  and reloads sources, and add a "sourcedir" directive to use
+	  those files to the default config.
+
+	  Note that if you enable this option and override the default
+	  chrony config (e.g. in an overlay) you need to make sure
+	  that the "sourcedir /var/run/chrony-dhcp" directive remains
+	  in effect.
+
 endif
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 642e1d8fd6..0685211b75 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -65,6 +65,13 @@ else
 CHRONY_CONF_OPTS += --without-nettle
 endif
 
+ifeq ($(BR2_PACKAGE_CHRONY_NM_DHCP),y)
+define CHRONY_INSTALL_NM_DHCP_CMDS
+	$(INSTALL) -D -m 755 $(@D)/examples/chrony.nm-dispatcher.dhcp $(TARGET_DIR)/etc/NetworkManager/dispatcher.d/chrony.dhcp
+	echo "sourcedir /var/run/chrony-dhcp" >>$(TARGET_DIR)/etc/chrony.conf
+endef
+endif
+
 define CHRONY_CONFIGURE_CMDS
 	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure $(CHRONY_CONF_OPTS)
 endef
@@ -76,6 +83,7 @@ endef
 define CHRONY_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
 	$(INSTALL) -D -m 644 $(@D)/examples/chrony.conf.example2 $(TARGET_DIR)/etc/chrony.conf
+	$(CHRONY_INSTALL_NM_DHCP_CMDS)
 endef
 
 define CHRONY_INSTALL_INIT_SYSV
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

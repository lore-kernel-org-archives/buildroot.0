Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C84C54ED1
	for <buildroot@archiver.kernel.org>; Tue, 27 May 2025 15:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 825FC60644;
	Tue, 27 May 2025 15:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PVoBAfp0ivrQ; Tue, 27 May 2025 15:23:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4B6F60A81
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4B6F60A81;
	Tue, 27 May 2025 15:23:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F265219D
 for <buildroot@buildroot.org>; Tue, 27 May 2025 15:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D819C80999
 for <buildroot@buildroot.org>; Tue, 27 May 2025 15:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tXjkEWPTA1Mi for <buildroot@buildroot.org>;
 Tue, 27 May 2025 15:23:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DD2DF808C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD2DF808C2
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD2DF808C2
 for <buildroot@buildroot.org>; Tue, 27 May 2025 15:23:50 +0000 (UTC)
Received: from charybdis.. (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id DB874E001C6;
 Tue, 27 May 2025 17:23:46 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Florian Larysch <fl@n621.de>
Date: Tue, 27 May 2025 17:23:38 +0200
Message-ID: <20250527152342.4288-1-fl@n621.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1748359426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=6mJtqWlS44c1TmVb88LynhAVB76FyyT83l77Yzl6Hsg=;
 b=fIRROJH63HdQgO3pB0dtoGWjPDKULfNmsGwQXoG53J99SWbXfCx17DpN7mBYu0NLDc/TqV
 lLOBsZ+78cRX9D+PQlAAknqJyQrHnqRRu9qN/POz8uQN+aaGsv3y6i1SeyzNsF8eATx5cM
 rdrsClBDLvIYtHqnRrQz/YfMLi1+jfE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=fIRROJH6
Subject: [Buildroot] [PATCH 1/1] package/network-manager: make cryptography
 library optional
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

The network-manager package currently pulls in either gnutls or libnss,
neither of which are very common and it might be the only reason why
they are present on a system.

However, most of NetworkManager works just fine without any cryptography
support, it only seems to be used in test cases and 802.1X support code.

Make the crypto backend configurable and optional to make it possible to
avoid this dependency while keeping the default behavior the same.

Signed-off-by: Florian Larysch <fl@n621.de>
---

The select vs depends on thing is a bit hacky because I've tried to set
it up in a way that keeps the existing behavior for backwards
compatibility. I'm not even sure if this is the best way to go about it
or if all the options should maybe just depend on the respective
libraries to make it less implicit.

 package/network-manager/Config.in          | 22 +++++++++++++++++++++-
 package/network-manager/network-manager.mk |  6 ++++--
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index b388c573fe..4557174b7d 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -10,7 +10,6 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2
 	select BR2_PACKAGE_DBUS
-	select BR2_PACKAGE_GNUTLS if !BR2_PACKAGE_LIBNSS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBNDP
 	select BR2_PACKAGE_UTIL_LINUX
@@ -58,6 +57,27 @@ config BR2_PACKAGE_NETWORK_MANAGER_OVS
 	select BR2_PACKAGE_JANSSON
 	help
 	  This option enables support for OpenVSwitch
+
+choice
+	prompt "Crypto backend"
+	default BR2_PACKAGE_NETWORK_MANAGER_CRYPTO_GNUTLS if !BR2_PACKAGE_LIBNSS
+	default BR2_PACKAGE_NETWORK_MANAGER_CRYPTO_LIBNSS if BR2_PACKAGE_LIBNSS
+	help
+	  Select which library (if any) is used to provide cryptographic
+	  operations for 802.1X, for example.
+
+config BR2_PACKAGE_NETWORK_MANAGER_CRYPTO_GNUTLS
+	bool "gnutls"
+	select BR2_PACKAGE_GNUTLS
+
+config BR2_PACKAGE_NETWORK_MANAGER_CRYPTO_LIBNSS
+	bool "libnss"
+	depends on BR2_PACKAGE_LIBNSS
+
+config BR2_PACKAGE_NETWORK_MANAGER_CRYPTO_NONE
+	bool "none"
+
+endchoice
 endif
 
 comment "NetworkManager needs udev /dev management and a glibc or musl toolchain w/ headers >= 5.4, dynamic library, wchar, threads, gcc >= 4.9"
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index ab3a437838..14119f8fa2 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -76,12 +76,14 @@ else
 NETWORK_MANAGER_CONF_OPTS += -Dconcheck=false
 endif
 
-ifeq ($(BR2_PACKAGE_LIBNSS),y)
+ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_CRYPTO_LIBNSS),y)
 NETWORK_MANAGER_DEPENDENCIES += libnss
 NETWORK_MANAGER_CONF_OPTS += -Dcrypto=nss
-else
+else ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_CRYPTO_GNUTLS),y)
 NETWORK_MANAGER_DEPENDENCIES += gnutls
 NETWORK_MANAGER_CONF_OPTS += -Dcrypto=gnutls
+else ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_CRYPTO_NONE),y)
+NETWORK_MANAGER_CONF_OPTS += -Dcrypto=null
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPSL),y)
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

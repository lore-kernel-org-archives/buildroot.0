Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAD4C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 13:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43F1F81FB0;
	Fri, 11 Jul 2025 13:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SEQBDIYTCq-l; Fri, 11 Jul 2025 13:24:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65AB181FAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65AB181FAE;
	Fri, 11 Jul 2025 13:24:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E8E2114
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 13:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF8CC81EF2
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 13:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rvV-8-sVDpOg for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 13:24:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=dalang@gmx.at; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7427A81FAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7427A81FAE
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7427A81FAE
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 13:24:21 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from thinkpad ([41.66.98.54]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McH5a-1vCrsN3KHs-00bOGm; Fri, 11
 Jul 2025 15:24:19 +0200
To: buildroot@buildroot.org
Cc: Julien Grossholtz <julien.grossholtz@openest.io>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Date: Fri, 11 Jul 2025 15:22:35 +0200
Message-ID: <20250711132237.76597-1-dalang@gmx.at>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:q1aTJPoO48vXZvC10RfbuI6FM4NfgWaC3PwPkiQKY886vO4Yl5Q
 9gkajkr418CgJb7vSQ+VMOtIyYuhaOD2AN4oc5DeYMrDFiCpqG2VuCt3RisSeMB3q1PAn1B
 8rWiZ99ywvPtd7Pn5/rOcNurZ3b/P9qvOZCeifmC6kfrpmHfGDJiC3mbKSozFJuuISOZSh1
 B23PROylyTrvsHnO8vtwA==
UI-OutboundReport: notjunk:1;M01:P0:T8IKsmLHg0A=;fI0HR7Zktsw834tcxAtR+94a+ME
 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
 P2sczqa7HXEZt6tbzImE6bWZjez2HwLmiMj
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.at; 
 s=s31663417; t=1752240260; x=1752845060; i=dalang@gmx.at;
 bh=/jDD+/oW3sq+9v6/tZwdvg07bkpbnF9/Y9yySweleiM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=hIHbGnDcDfe4jBzHxyQw0gQcLmYt6KW8tZq81v2FU9ZcPdN1JbSmFjnWXJtxZwaI
 lteONi4WuvffYu5/y+Xjr5HN7I2KCKGA7xoVKb816DmEiOiZtt8SgVpbd60YdlGby
 7lVQMyZYTeYXL5YHIACgjpzFUXkqChHJvtBtYUwJz7sc/dCZ2oRiCbEZMhj1anvGT
 MtfcMeN2EdA5vhQXFpJW4yWKQ4v38RRNiakaXQEkMwSREoL83duuCnjgZWKxW/Mn+
 xl2+Wy/MOeAUEo2iDtLGlbPjQBA7ySkF9Us8sAKhvkBIG2FXrwpPxGEdMFwz9Yxin
 zkVfFjuKKcHUcWxdvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.at
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.at header.i=dalang@gmx.at header.a=rsa-sha256
 header.s=s31663417 header.b=hIHbGnDc
Subject: [Buildroot] [PATCH] package/paho-mqtt-cpp: bump to version 1.5.3
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
From: Daniel Lang via buildroot <buildroot@buildroot.org>
Reply-To: Daniel Lang <dalang@gmx.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

C++17 is required since 1.5.0.

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/paho-mqtt-cpp/Config.in          | 6 ++++--
 package/paho-mqtt-cpp/paho-mqtt-cpp.hash | 2 +-
 package/paho-mqtt-cpp/paho-mqtt-cpp.mk   | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/paho-mqtt-cpp/Config.in b/package/paho-mqtt-cpp/Config.in
index a46c1256e8..023487c45d 100644
--- a/package/paho-mqtt-cpp/Config.in
+++ b/package/paho-mqtt-cpp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PAHO_MQTT_CPP
 	bool "paho-mqtt-cpp"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_PAHO_MQTT_C
@@ -9,8 +10,9 @@ config BR2_PACKAGE_PAHO_MQTT_CPP
 
 	  https://eclipse.org/paho/clients/cpp/
 
-comment "paho-mqtt-cpp needs a toolchain w/ threads, C++"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+comment "paho-mqtt-cpp needs a toolchain w/ threads, gcc >= 7, C++"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 comment "paho-mqtt-cpp needs a toolchain not affected by GCC bug 64735"
diff --git a/package/paho-mqtt-cpp/paho-mqtt-cpp.hash b/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
index a35cd102b3..08f7415a8b 100644
--- a/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
+++ b/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  c271d521287f417102b447b3d1e8d17be0e0f6a3b0b653334ebcd2ccd20d1e46  paho-mqtt-cpp-1.3.2.tar.gz
+sha256  8aab7761bcb43e2d65dbf266c8623d345f7612411363a97aa66370fb9822d0b9  paho-mqtt-cpp-1.5.3.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  epl-v20
diff --git a/package/paho-mqtt-cpp/paho-mqtt-cpp.mk b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
index 2e0f409b96..0562cb0eb5 100644
--- a/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
+++ b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHO_MQTT_CPP_VERSION = 1.3.2
+PAHO_MQTT_CPP_VERSION = 1.5.3
 PAHO_MQTT_CPP_SITE = $(call github,eclipse,paho.mqtt.cpp,v$(PAHO_MQTT_CPP_VERSION))
 PAHO_MQTT_CPP_LICENSE = EPL-2.0 or BSD-3-Clause
 PAHO_MQTT_CPP_LICENSE_FILES = epl-v20 edl-v10
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

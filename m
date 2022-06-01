Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA78C433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 19:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDB8A40580;
	Wed,  1 Jun 2022 19:48:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N3l2NXuVjZ9o; Wed,  1 Jun 2022 19:48:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4C0D404EC;
	Wed,  1 Jun 2022 19:48:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 50D171BF333
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 19:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30C9960E4C
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 19:48:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tpm.dev
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CrUrvesHWCFb for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 19:48:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from delivery.mailspamprotection.com
 (delivery.mailspamprotection.com [185.56.84.25])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F00D060D65
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 19:48:03 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se26.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1nwUJw-0009p9-EV; Wed, 01 Jun 2022 14:48:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tpm.dev;
 s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VE6lhxSglJac1oFM4/+s/5k+twyoOL5oDrC3ZafwIU8=; b=KArh9eOZcO4uVR7GzUqvyWzMHn
 r17C51w0FeW6luB58fBGXlKIn3HGDlVMdTH4I0sDjNhiZU2udHcCqxAm1mfEu1/nzKmR5Ke4m8hIo
 6hxQYGXsPKlxCHSZh9cpz/pbdErzOehVWY88ab2ELLbMA9deyniJtCZ2vFGmyFcYmg3UsarY2kx74
 S3GVLiOS/gbfUQGbavOOPYkSSA+SzINfiqgTHGG99HpsbGsvpA8kMqQcm5Kq/TPhwkwX4MPf1nIGp
 c6JHZHBfJqzvbQe3xMEw/PjBOqOK0dwsxh081WP/1xYF4nTPbyxdve1dzGNIAvWoov2QfXhrsaLeB
 IGfGFPSQ==;
Received: from [95.111.54.43] (port=35922 helo=localhost.localdomain)
 by es87.siteground.eu with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1nwUJu-000H5p-5o; Wed, 01 Jun 2022 19:47:54 +0000
From: Dimi Tomov <dimi@tpm.dev>
To: buildroot@buildroot.org
Date: Wed,  1 Jun 2022 22:47:46 +0300
Message-Id: <20220601194746.29106-1-dimi@tpm.dev>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220530203001.574908-1-dimi@tpm.dev>
References: <20220530203001.574908-1-dimi@tpm.dev>
MIME-Version: 1.0
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
Authentication-Results: mailspamprotection.com;
 auth=pass smtp.auth=35.214.247.6@es87.siteground.eu
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.02)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT9UD9J6Y+PpKh0oZbYCJJRuPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xKipkaFeQDP2JiLCjsOSqCBHoJjdDPbdunZvlh+03gEx+y
 AgUhs4TMs248ll4GqtGr/hqYzjDWzrFya1I3MqUAQaXPwIlI4yu/PH1NWDdGRQquD+aVDmMXWiFq
 XMzSguFTtObPqIqeRAv2CqzEPfjvzn3+O390ZiUEIR10am7COXQg45AD+/l6P8h0+TPjaDxMfcvw
 9uVrltEafCGDyHAgHlsrgHdRWEueoBSMqiQzPh1yRvIbtitNGnLjaBpZxUE1lUtc0sYymngJCgc9
 Cmsi1aGGPfH65H6AVD6gAKRZUoPAgTtUp75uqlx0KezvZHWbz5twsxHtQVQSuIppndtMh4qquF0m
 STLvgCmSR4faGwwvmLeDYYVoZCdncqjCVTxqe+hzuzR4e2zKsft/i9azUpyDFBOp1ITdzGU/ruyy
 5nGfZreTrrCodBGR0eudR/Re4NVbVEBU/8Tv9RjL1Pyu39sUHXwyAFnSuVW90ZJgh3r6hAL/pjzQ
 N/GQ45ibIzuzIh1wkn5B+muMTuS2LDwzt8Ds8HhMu8AsuC+XP0IWdUIAUNuMtkDDGcfMcpylyxhs
 01KruaxB6s0aI7mWLxFqewZEt7CZOQ7IU15wrAsvU4/yXIk618YVJp5jM2kZcUgHPUbw7CVpNolc
 zSoTuJsRnENsSECCOsy4kitQ2EVON3ZmAvzhACRw3PmZbvOIthHvIRoPLftsPu5fZEkoeBRdf/xQ
 rs3vASn8aqCRe/qNvzYfTH509XQw8Xdr+MnJzzZn/WnTKonJfGSB+FJgE/zw4HUoD+cIWUzsqPTs
 oNyo6vdjzQ6YC7Heg3Xf7O1TOd6RJQvT/U9rVpsp+2+YWHqMJlXoybOvrfLlgErbJFPCX7X6uLCQ
 WGN9pNli3DC1GSEAp1f7vHUD5ifdT+LC9vzGvhBIsXtgL7ASKOcoAhS7yiG7X+t1TW39Ja77LGPp
 OwBdIsa6pXKCXxjFsbUwgHS0eo7ybJmmaWykWTbAAZ1XGFTzcEStuOgM8+WgcxlSOIcPxmo87wug
 keVczgPJFLMsHgC00qgRk2z6CMYeLQ7wp2F7GO6T6bnYu21C1+IFqWMHzhJIya1bhC8OG6CHeS+X
 Mj9B6P5z9jr1E+YC0mZnY7DiOrvyPQGBoymZzgLPbwz2OKHH5lr9xXvSM4nM3avg
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
Subject: [Buildroot] [PATCH 1/1] package/wolftpm: new package
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
Cc: Dimitar Tomov <dimi@tpm.dev>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dimitar Tomov <dimi@tpm.dev>

wolfTPM is an open-source TPM 2.0 stack with backward API compatibility,
designed for embedded use. It is highly portable, and has native support
for Linux. wolfTPM has a compact code size with low resource usage.

Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
---
Changes v2 -> v3:
- Applied feedback from the maintainer, list of changes below
- Added new entry to the DEVELOPERS file
- Replaced depends with select for BR2_PACKAGE_WOLFSSL
- Added missing depends for BR2_TOOLCHAIN_HAS_THREADS
- Removed redundant --with-wolfcrypt option
Changes v1 -> v2:
- Fix typo in the hash file and create path before using touch
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/wolftpm/Config.in    | 15 +++++++++++++++
 package/wolftpm/wolftpm.hash |  2 ++
 package/wolftpm/wolftpm.mk   | 29 +++++++++++++++++++++++++++++
 5 files changed, 50 insertions(+)
 create mode 100644 package/wolftpm/Config.in
 create mode 100644 package/wolftpm/wolftpm.hash
 create mode 100644 package/wolftpm/wolftpm.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 71cc3da6d7..c123d1b915 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3072,3 +3072,6 @@ F:	package/quazip/
 F:	package/shapelib/
 F:	package/simple-mail/
 F:	package/tinc/
+
+N:	Dimi Tomov <dimi@tpm.dev>
+F:	package/wolftpm/
diff --git a/package/Config.in b/package/Config.in
index 00f061015f..b287c5a94d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1431,6 +1431,7 @@ menu "Crypto"
 	source "package/trousers/Config.in"
 	source "package/ustream-ssl/Config.in"
 	source "package/wolfssl/Config.in"
+	source "package/wolftpm/Config.in"
 endmenu
 
 menu "Database"
diff --git a/package/wolftpm/Config.in b/package/wolftpm/Config.in
new file mode 100644
index 0000000000..23932a4170
--- /dev/null
+++ b/package/wolftpm/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_WOLFTPM
+	bool "wolftpm"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select on BR2_PACKAGE_WOLFSSL
+	select on BR2_PACKAGE_WOLFSSL_ALL
+	help
+	  wolfTPM is a portable, open-source TPM 2.0 stack with
+	  backward API compatibility, designed for embedded use.
+	  No external dependencies, compact code size with low
+	  resource usage.
+
+	  https://www.wolfssl.com/
+
+comment "wolftpm needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/wolftpm/wolftpm.hash b/package/wolftpm/wolftpm.hash
new file mode 100644
index 0000000000..6dbf143ffe
--- /dev/null
+++ b/package/wolftpm/wolftpm.hash
@@ -0,0 +1,2 @@
+# Hash from https://github.com/wolfSSL/wolfTPM/archive/refs/tags/v2.3.1.tar.gz
+sha256  f0d7c095491ac2cc9e44aa4ac3c22febf15942ef080431d8b43a9d0312ca6567  wolftpm-2.3.1.tar.gz
diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
new file mode 100644
index 0000000000..1e1ddc13e3
--- /dev/null
+++ b/package/wolftpm/wolftpm.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# wolftpm
+#
+################################################################################
+
+WOLFTPM_VERSION = 2.3.1
+WOLFTPM_SITE = $(call github,wolfSSL,wolfTPM,v$(WOLFTPM_VERSION))
+WOLFTPM_INSTALL_STAGING = YES
+WOLFTPM_LICENSE = GPL-2.0+
+WOLFTPM_LICENSE_FILES = LICENSE
+WOLFTPM_CPE_ID_VENDOR = wolfssl
+
+WOLFTPM_DEPENDENCIES = host-pkgconf
+
+# wolfTPM's source code is released without a configure script,
+# therefore we need autoreconf
+WOLFTPM_AUTORECONF = YES
+
+WOLFTPM_CONF_OPTS = --disable-examples --enable-devtpm
+
+define WOLFTPM_CONFIG_RPATH
+    mkdir $(@D)/build-aux
+    touch $(@D)/build-aux/config.rpath
+endef
+# Fix for autoconf bug with config.rconf
+WOLFTPM_PRE_CONFIGURE_HOOKS += WOLFTPM_CONFIG_RPATH
+
+$(eval $(autotools-package))
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

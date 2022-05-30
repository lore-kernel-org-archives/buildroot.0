Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CECC433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5554A6121A;
	Mon, 30 May 2022 20:30:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FQrSEIPND4pd; Mon, 30 May 2022 20:30:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E36F60B4B;
	Mon, 30 May 2022 20:30:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C149D1BF31A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCD6141B87
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:30:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tpm.dev
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v_hANJu9FqnB for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:30:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from delivery.mailspamprotection.com
 (delivery.mailspamprotection.com [185.56.84.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47F4A41B81
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:30:15 +0000 (UTC)
Received: from 6.247.214.35.bc.googleusercontent.com ([35.214.247.6]
 helo=es87.siteground.eu)
 by se23.mailspamprotection.com with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <dimi@tpm.dev>)
 id 1nvm1h-0006E2-OZ; Mon, 30 May 2022 15:30:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tpm.dev;
 s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WzGLsRsgtVuKKTDiNaFW9t5ZksE8GcBGVblKzxbCQCI=; b=FSyJilRvqVm3VZPHEvkh8SO0kD
 pa2bjXw1/noSJ7iUJo439ACyT76kE3chqTrTLNz+DZcuFjdv9RaM3vvsWt7Ez3hVuKI2LvJPtuI7f
 zzMT4SMHjZYtlNpCdFPYgw7q7obRdC6Us7mEUDAnaCeVUZ7Ur49T/8NeG3FrA8MPGcq6NynRcFVnJ
 eiERe0E1JnDmedJX4BSSfNeJlElULARw8X8SJ9zlpgdVr4UZo7PpvwtOzTPF+qRIhdAiHw6oayr/O
 iSgNRxFEWIENptQ1pDEJ0q/iMe6DQO7hntgj3AgOJOUM4zTPu0xuHSySfcnBZwRMPl3/4OL9KLi8r
 nInc6ioQ==;
Received: from [95.111.54.43] (port=56038 helo=localhost.localdomain)
 by es87.siteground.eu with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.90-.1)
 (envelope-from <dimi@tpm.dev>)
 id 1nvm1f-0003PW-Dk; Mon, 30 May 2022 20:30:07 +0000
From: Dimi Tomov <dimi@tpm.dev>
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 23:30:00 +0300
Message-Id: <20220530203001.574908-1-dimi@tpm.dev>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220508212014.629607-1-dimi@tpm.dev>
References: <20220508212014.629607-1-dimi@tpm.dev>
MIME-Version: 1.0
X-Originating-IP: 35.214.247.6
X-SpamExperts-Domain: es87.siteground.eu
X-SpamExperts-Username: 35.214.247.6
Authentication-Results: mailspamprotection.com;
 auth=pass smtp.auth=35.214.247.6@es87.siteground.eu
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.03)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT8FAVxltc7XWjOKc8R4aBmaPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xKipkaFeQDP2JiLCjsOSqCBHoJjdDPbdunZvlh+03gEx+y
 AgUhs4TMs248ll4GqtGr/hqYzjDWzrFya1I3MqUAQaXPwIlI4yu/PH1NWDdGRYw+x1LujWud+rLy
 4FZsp7NTtObPqIqeRAv2CqzEPfjvzn3+O390ZiUEIR10am7COXQg45AD+/l6P8h0+TPjaDxMfcvw
 9uVrltEafCGDyHAgHlsrgHdRWEueoBSMqiQzPh1yRvIbtitNGnLjaBpZxUE1lUtc0sYymngJCgc9
 Cmsi1aGGPfH65H6AVD6gAKRZUoPAgTtUp75uqlx0KezvZHV2PGGSsz4vL/EJ/mIfZdAth4qquF0m
 STLvgCmSR4faGwwvmLeDYYVoZCdncqjCVTxqe+hzuzR4e2zKsft/i9azUpyDFBOp1ITdzGU/ruyy
 5nGfZreTrrCodBGR0eudR/Re4NVbVEBU/8Tv9RjL1Pyu39sUHXwyAFnSuVW90ZJgh3r6hAL/pjzQ
 N/GQ45ibIzuzIh1wkn5B+muMTuS2LDwzt8Ds8HhMu8AsuC+XP0IWdUIAUNuMtkDDGcfMcpylyxhs
 01KruaxB6s0aI7mWLxFqewZEt7CZOQ7IU15wrAsvU4/yXIk618YVJp5jM2kZcUgHPUbw7CVpNolc
 zSoTuJsRnENsSECCOsy4kitQ2EVON3ZmAvzhACRw3PmZbvOIthEBCAXfjTx5VY+N0cu8XXuOw5V5
 iFKHH7XBvQfUIAakRjYfTH509XQw8Xdr+MnJzzZn/WnTKonJfGSB+FJgE/zw4HUoD+cIWUzsqPTs
 oNyo6vdjzQ6YC7Heg3Xf7O1TOd6RJQvT/U9rVpsp+2+YWHqMJlXoybOvrfLlgErbJFPCX7X6uLCQ
 WGN9pNli3DC1GSGHtN7h1v0Zi82s9uPaoY92Z2hJbal2FcLSNFsg2HlsZSG7X+t1TW39Ja77LGPp
 OwBdIsa6pXKCXxjFsbUwgHS0eo7ybJmmaWykWTbAAZ1XGFTzcEStuOgM8+WgcxlSOIcPxmo87wug
 keVczgPJFLMsHgC00qgRk2z6CMYeLQ7wp2F7GO6T6bnYu21C1+IFqWMHzhJIya1bhC8OG6CHeS+X
 Mj9B6P5z9jr1E+YC0mZnY7DiOrvyPQGBoymZzgLPbwz2OKHH5lr9xXvSM4nM3avg
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
Subject: [Buildroot] [PATCH 1/2] package/wolftpm: new package,
 wolfTPM library for TPM2.0
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
 package/Config.in            |  1 +
 package/wolftpm/Config.in    | 14 ++++++++++++++
 package/wolftpm/wolftpm.hash |  2 ++
 package/wolftpm/wolftpm.mk   | 29 +++++++++++++++++++++++++++++
 4 files changed, 46 insertions(+)
 create mode 100644 package/wolftpm/Config.in
 create mode 100644 package/wolftpm/wolftpm.hash
 create mode 100644 package/wolftpm/wolftpm.mk

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
index 0000000000..497f5ae6e9
--- /dev/null
+++ b/package/wolftpm/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_WOLFTPM
+	bool "wolftpm"
+	depends on BR2_PACKAGE_WOLFSSL
+    select BR2_PACKAGE_WOLFSSL_ALL
+	help
+	  wolfTPM is a portable, open-source TPM 2.0 stack with
+	  backward API compatibility, designed for embedded use.
+	  No external dependencies, compact code size with low
+	  resource usage.
+
+	  https://www.wolfssl.com/
+
+comment "wolfTPM needs the wolfSSL cryptographic library"
+	depends on !BR2_PACKAGE_WOLFSSL
diff --git a/package/wolftpm/wolftpm.hash b/package/wolftpm/wolftpm.hash
new file mode 100644
index 0000000000..871e3e2d1d
--- /dev/null
+++ b/package/wolftpm/wolftpm.hash
@@ -0,0 +1,2 @@
+# Hash from https://github.com/wolfSSL/wolfTPM/archive/refs/tags/v2.3.1.tar.gz
+sha256  f0d7c095491ac2cc9e44aa4ac3c22febf15942ef080431d8b43a9d0312ca6567  wolfTPM-2.3.1.tar.gz
diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
new file mode 100644
index 0000000000..33cfdef6af
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
+
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
+WOLFTPM_CONF_OPTS = --disable-examples --enable-devtpm --with-wolfcrypt=$(TARGET_DIR)/usr/
+
+define WOLFTPM_CONFIG_RPATH
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

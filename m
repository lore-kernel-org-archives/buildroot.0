Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAACFCD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CD04610EB;
	Fri, 29 May 2026 18:27:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nSRdAotXp5h7; Fri, 29 May 2026 18:27:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7A3F61634
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780079267;
	bh=uxZLLvjT27LTkpXPKGdSill6MVc5UCduj7eESBoZJg8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iC8pp125eRNrlaYwFQrXhlQqmLTplcaPOI/QyyHCCxiXh9uA05ubqu1lqutLDXCkW
	 qfohkH9WC46YWFWBBR81NazlsBLXaCQjkXt0O19Febp1+dOT4isYs3X0P+DG+hiWbQ
	 VgBS/jqY97r+p/qE+RkwWGMqqGhDtjL9aiI3HSFarmB0YYYPiyC7rBnjl+hicL4vsW
	 qOibYGNPwPRAAxvYtk1m8KTBHRhM+b5vGTFTFLG73r3JOybkha0KhF1kUr9xBPkT8Q
	 4LTPTncWR+jgtHFN+dHT6mLCzs5vtEPtjFvvlyNP/BR7JVPTpvmbOpFBuMWT2t0sxp
	 iJXxtHFpQy2+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7A3F61634;
	Fri, 29 May 2026 18:27:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 94092288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8391C61634
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:27:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id teTWpJmjErfS for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:27:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=and@gmx.li; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 181D1610EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 181D1610EB
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 181D1610EB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:27:44 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MysRk-1xFkdA2OAM-00shPQ for
 <buildroot@buildroot.org>; Fri, 29 May 2026 20:27:42 +0200
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 18:27:27 +0000
Message-ID: <20260529182727.2044-1-and@gmx.li>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:IqgszRSzNh9lxpLqPB5JJpyXZOHrvCrUD4WOEmZAYzLxfcVBrHD
 7OKiDQJuIg68Nk6eoow6dGU14JS2Csn1hEGq/Cj1mGtPtRNcUGJaW49ONcVhyzE1NBTveL7
 fdN8H4Il87e2r3qzTV+xPHaec/O42vNYSk7O196MRl46BbyyKoKKhwVvzmm+uhwiz0/ZbBs
 ap+z/KFkkeTac4uUnQV+w==
UI-OutboundReport: notjunk:1;M01:P0:vqBWNLQ7OLQ=;YAcst+hmfKxmOYi3AFQwogXQECs
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.li; 
 s=s31663417; t=1780079262; x=1780684062; i=and@gmx.li;
 bh=ovB9WDqr68jfepr+E3BdpMvYEbvQ40gyjCGHT3qhk9M=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=BQn+FqMZlR6T7aKLrY22MrSFBTzRbVKpufuIP/JvGLcgn2uxlTT58pvA90ar/hxJ
 sKk/ohvcAMgW2KlRMyPZMuBOLIK9zw2zRkUFoj2Zfj3PEd5DMkHkbRss1fQ6ja9cM
 tLPmNnJJkYSF5EVQv+wWfVnxRjh5Ime+EdAnIQnJDNXf85RnHamrdWcSTWgFCQlkH
 7znUuqZu+pvTYkB0mPYuGXJ+MIq6CMAgRVhTsbU14WSmbjIkmZAlImxPw2ib5iRTx
 5JOqVeUW9VZeMPfYYM/hjVQpqZ/hl6fgjaMeZJMjJF3lsXDoi4jnFWu5AkGwG6ngv
 1fu+rlna1aCdJVxFXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.li
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.li header.i=and@gmx.li header.a=rsa-sha256
 header.s=s31663417 header.b=BQn+FqMZ
Subject: [Buildroot] [PATCH/next 1/1] package/tpm2-tss: add Mbed-TLS crypto
 backend support
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
From: Andreas Mohr via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Mohr <and@gmx.li>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add mbedtls crypto backend support for lightweight build

BR2_PACKAGE_TPM2_TSS_FAPI depends on openssl explicitly

Rewrite fapi -> FAPI

Signed-off-by: Andreas Mohr <and@gmx.li>
---
 package/tpm2-tss/Config.in   |  9 ++++++---
 package/tpm2-tss/tpm2-tss.mk | 11 +++++++++--
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
index 9ce3c22763..dbcad52130 100644
--- a/package/tpm2-tss/Config.in
+++ b/package/tpm2-tss/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_TPM2_TSS
 	bool "tpm2-tss"
 	depends on !BR2_STATIC_LIBS # dlfcn.h
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL if !BR2_PACKAGE_MBEDTLS
 	help
 	  OSS implementation of the Trusted Computing Group's (TCG) TPM2
 	  Software Stack (TSS). This stack consists of the following
@@ -35,8 +35,9 @@ config BR2_PACKAGE_TPM2_TSS
 if BR2_PACKAGE_TPM2_TSS
 
 config BR2_PACKAGE_TPM2_TSS_FAPI
-	bool "fapi support"
+	bool "FAPI support"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	depends on !BR2_PACKAGE_MBEDTLS # configure: FAPI has to be compiled with OpenSSL
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_UTIL_LINUX
@@ -54,6 +55,8 @@ config BR2_PACKAGE_TPM2_TSS_FAPI
 	  https://trustedcomputinggroup.org/wp-content/uploads/TSS_FAPI_v0.94_r04_pubrev.pdf
 	  https://trustedcomputinggroup.org/wp-content/uploads/TSS_JSON_Policy_v0.7_r04_pubrev.pdf
 
+comment "FAPI not supported with Mbed TLS backend"
+	depends on BR2_PACKAGE_MBEDTLS
 endif
 
 comment "tpm2-tss needs a toolchain w/ dynamic library"
diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 11da37a5b4..f3a63cee81 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -11,7 +11,7 @@ TPM2_TSS_LICENSE_FILES = LICENSE
 TPM2_TSS_CPE_ID_VENDOR = tpm2_software_stack_project
 TPM2_TSS_CPE_ID_PRODUCT = tpm2_software_stack
 TPM2_TSS_INSTALL_STAGING = YES
-TPM2_TSS_DEPENDENCIES = openssl host-pkgconf
+TPM2_TSS_DEPENDENCIES = host-pkgconf
 
 # systemd-sysusers and systemd-tmpfiles are only used at install time
 # to trigger the creation of users and tmpfiles, which we do not care
@@ -25,10 +25,17 @@ TPM2_TSS_CONF_OPTS = \
 	ac_cv_prog_systemd_tmpfiles=no \
 	ac_cv_prog_useradd=yes \
 	ac_cv_prog_groupadd=yes \
-	--with-crypto=ossl \
 	--disable-doxygen-doc \
 	--disable-defaultflags
 
+ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+TPM2_TSS_DEPENDENCIES += mbedtls
+TPM2_TSS_CONF_OPTS += --with-crypto=mbed
+else
+TPM2_TSS_DEPENDENCIES += openssl
+TPM2_TSS_CONF_OPTS += --with-crypto=ossl
+endif
+
 # uses C99 code but forgets to pass -std=c99 when --disable-defaultflags is used
 TPM2_TSS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

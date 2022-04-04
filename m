Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C55FC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 16:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A82D3414C0;
	Mon,  4 Apr 2022 16:25:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QNvAhvv_1F4V; Mon,  4 Apr 2022 16:25:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 721D341497;
	Mon,  4 Apr 2022 16:25:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CDEF1BF983
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 16:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59E0660EDE
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 16:25:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v3hOoPuykUzc for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 16:25:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D09160BD7
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 16:25:41 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id q19so8397531wrc.6
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 09:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B+lXQgKDRQZHEs1Fwte7wTkT0Wdn24yS/nPxD3L6JAE=;
 b=i0jQQs+9mm/rLtvdvk1pP5k5FCTbccImL2eoYC3fLeJl3lniyHj6qixYVjpD6dBXEC
 pnq0nuVkOuKy/MlEJj+egctCZkmDdpIel9LePo3+Q4KU6zbJsPLF2iGs/BNeSIsN6tIh
 wWeWdAWpc89itnUhDcEAgPtuVKpzXYa05TAJSya6Wp5e84llQxsG8LyD0xCa6OxDoOz4
 jdUMbDeLhAHZ9PqOnA2tZEv8L7z64qv78PddEh9ja8ZDis+WxF+N5Xz9TMFMWHboTJaS
 8amhiS7X/kby53WMPG0wUizYyv+Lz41kL2PAI8k9DWZjIdrNWjWYiCr5EuzDFMfo7Bp1
 HudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B+lXQgKDRQZHEs1Fwte7wTkT0Wdn24yS/nPxD3L6JAE=;
 b=FeB7XFqg9NjJPDNR3r2nR0+7y16Y3dyMJfYeEDKIW1+9AiHguvseKxhLvdr0dwf4eD
 CVfDUJznHMhHSJZBLvPGLuHTfWmkMhLUmVvL+Bgw+mva/GYyy7iYuh5rb6K1hRuIZUOu
 R8XJCkrb3cv1ksxRcsT7qV99k8DTfryAOBvYNpULaWTJVavY3tCIE0kpkzZ+n3/NCDLk
 hKHQuPWnsgJ4+68s8PH3DvPKbtZUy1fqa+i+aBmbVc5oNntacfE7zudNoisbj529Swbp
 9ZGVTi+V79V47STrUCCGmHAPnDTyUVx+MWmzyS91ZV0zuulXKL5W+8q6xjoSn6QylA9r
 aluQ==
X-Gm-Message-State: AOAM530lIGSIw2B/sndaav/GxJsMpOujqlHT3fcbxxF8bdSzAYvHLPfA
 etoIxn53Uzb27b37LGFZ08l/OmBkLuc=
X-Google-Smtp-Source: ABdhPJz6BOdqp+eZuWWXXrgotstdkE6PiwVOuVYfuc936NzmLjYfl+canCVmVJhRCRpdgxyoL9trxA==
X-Received: by 2002:a5d:4bcd:0:b0:203:fed7:c85e with SMTP id
 l13-20020a5d4bcd000000b00203fed7c85emr391786wrt.397.1649089539238; 
 Mon, 04 Apr 2022 09:25:39 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a05600c400100b0038cf3371208sm9956847wmm.22.2022.04.04.09.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 09:25:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Apr 2022 18:22:48 +0200
Message-Id: <20220404162248.325842-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libp11: fix build with libressl
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libressl:

p11_rsa.c:355:14: error: static declaration of 'RSA_meth_get_finish' follows non-static declaration
  355 | static int (*RSA_meth_get_finish(const RSA_METHOD *meth)) (RSA *rsa)
      |              ^~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/de3b1e97796f717eac47d291911e3e1517cb557b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libp11/0001-Update-wp11_rsa.c.patch | 26 +++++++++++++++++++++
 package/libp11/libp11.mk                    |  8 ++++++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 package/libp11/0001-Update-wp11_rsa.c.patch

diff --git a/package/libp11/0001-Update-wp11_rsa.c.patch b/package/libp11/0001-Update-wp11_rsa.c.patch
new file mode 100644
index 0000000000..0a2d6e65ce
--- /dev/null
+++ b/package/libp11/0001-Update-wp11_rsa.c.patch
@@ -0,0 +1,26 @@
+From 4968cfc64dbaa39bb479a24d9578d75099e2f337 Mon Sep 17 00:00:00 2001
+From: patchMonkey156 <pagorman@asu.edu>
+Date: Mon, 19 Oct 2020 17:12:15 -0400
+Subject: [PATCH] Update p11_rsa.c
+
+Bugfix for new LibreSSL version 3.2.2
+[Retrieved from:
+https://github.com/OpenSC/libp11/commit/4968cfc64dbaa39bb479a24d9578d75099e2f337]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/p11_rsa.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/p11_rsa.c b/src/p11_rsa.c
+index b6beef0..ff12ed7 100644
+--- a/src/p11_rsa.c
++++ b/src/p11_rsa.c
+@@ -336,7 +336,7 @@ int pkcs11_get_key_size(PKCS11_KEY *key)
+ 	return RSA_size(rsa);
+ }
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100005L || defined(LIBRESSL_VERSION_NUMBER)
++#if ( ( defined (OPENSSL_VERSION_NUMBER) && OPENSSL_VERSION_NUMBER < 0x10100005L ) || ( defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x3020199L ) )
+ 
+ int (*RSA_meth_get_priv_enc(const RSA_METHOD *meth))
+ 		(int flen, const unsigned char *from,
diff --git a/package/libp11/libp11.mk b/package/libp11/libp11.mk
index 45a718ee99..c1873a920c 100644
--- a/package/libp11/libp11.mk
+++ b/package/libp11/libp11.mk
@@ -11,10 +11,16 @@ LIBP11_INSTALL_STAGING = YES
 LIBP11_LICENSE = LGPL-2.1+
 LIBP11_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+LIBP11_ENGINESDIR = enginesdir
+else ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+LIBP11_ENGINESDIR = libdir
+endif
+
 # pkg-config returns a libcrypto enginesdir prefixed with the sysroot,
 # so let's rip it out.
 LIBP11_CONF_OPTS = \
-	--with-enginesdir=`$(PKG_CONFIG_HOST_BINARY) --variable enginesdir libcrypto | xargs readlink -f | sed 's%^$(STAGING_DIR)%%'`
+	--with-enginesdir=`$(PKG_CONFIG_HOST_BINARY) --variable $(LIBP11_ENGINESDIR) libcrypto | xargs readlink -f | sed 's%^$(STAGING_DIR)%%'`
 
 ifeq ($(BR2_PACKAGE_P11_KIT),y)
 LIBP11_CONF_OPTS += --with-pkcs11-module=/usr/lib/p11-kit-proxy.so
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

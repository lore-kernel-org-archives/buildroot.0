Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DB5C433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 16:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67E1D40C12;
	Thu, 12 May 2022 16:01:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dvoxyF_TofqI; Thu, 12 May 2022 16:01:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53DE4405CD;
	Thu, 12 May 2022 16:01:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10CCA1BF336
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 16:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F299F405BD
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 16:01:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m5OPGabHVsya for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 16:01:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04A4A405CD
 for <buildroot@buildroot.org>; Thu, 12 May 2022 16:01:19 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id m20so11100656ejj.10
 for <buildroot@buildroot.org>; Thu, 12 May 2022 09:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y4uAalrRn2Owg4gn73bh66XNvw+X0j6YuXpcWuyixYQ=;
 b=PogWLCJvl3ZpvBvOZUarx8vV8RusLQF+fkbKErTzwXtClLlmXRZwqJDIzZAJaXUxLe
 EfjwVoT33BEEpyOdJ+16zOacjuwJl7sePZrjSeHVbxDbVZgjpJcocHKvBBuR4ZfvCcfb
 /4JZYi2O73A2SZs/Rv98K7eyAQYypWVkrSOkLEXwWcPEyxWdyseHSJvwmwrrjdia4w/R
 Y9T63Xm2ZDjpj6su5KIJbBYJdIM9YJ21p2GgTAAbD+6x+1ni9xmXsbX32dVtruzYbU+B
 fnHfzuXNTGDOhdQFZTH3p1pmpsDJK5TbttrEKhTVvzdKFrl82pUF2YCV2KruCSvVFPEW
 tUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y4uAalrRn2Owg4gn73bh66XNvw+X0j6YuXpcWuyixYQ=;
 b=S7jBH9EKdD3B9hFL6mL/CXnfdiUIxznYiT0tfW+RaIN2p0fL99B/Oh/X9nwu4qIEVC
 12gXbVoO89PH9SvxpimZzEYEspWJazfpzOMTzINWx1eTmtGseL6gTxorYkLQa2+CTj5f
 9txL2G6cGMIKF3Ce10jrX6KbIWn0Noc9rdzDFTSfWJA1/bSiqYshbejj+mNwkjTVDpFo
 F4v+zSX5OCil793ZZzSzggfK8nqHfl4QlogwkGT8+7Ry6K2UTTX1N+sOUn9meE81j+4k
 YjDGmHBOeikxI4s22jcCbbI8ExlLcp9OP/Z1qFoiJDFOnqbuHR1WD767M7/9h10UPOkz
 JJ7A==
X-Gm-Message-State: AOAM531Nw5b5WnX+/X5J4BwHxdeKMPUulEs/f+ajk04Xe/q8YA6hNhkY
 uOqK7b37EOR1n7S6iR+3MfiJ6chznqU2vg==
X-Google-Smtp-Source: ABdhPJyX5yqtEqBS5aiCxwTU9IE4++LsGVWmj7fscPwnuSnkZltJNKcCWyRBvVY7Bpf5qfHO+8wW0A==
X-Received: by 2002:a17:907:6d0a:b0:6f9:b861:82b8 with SMTP id
 sa10-20020a1709076d0a00b006f9b86182b8mr544257ejc.478.1652371277990; 
 Thu, 12 May 2022 09:01:17 -0700 (PDT)
Received: from arnoutx1.. (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 lb20-20020a170907785400b006f3ef214df6sm2312382ejc.92.2022.05.12.09.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 09:01:17 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 18:01:12 +0200
Message-Id: <20220512160116.2011627-1-arnout@mind.be>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/5] package/gnutls: disable library search in
 /usr/lib
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gnutls's configure script has a weird approach where it first searches
for dependent libraries in the path specified by --prefix, before
searching in the default search path. Since we set --prefix to /usr,
and it doesn't take into account DESTDIR (which is anyway not set at
configure time), that means it will first search /usr/lib before
searching $(STAGING_DIR)/usr/lib.

Ideally, this would be fixed in the configure script itself. However,
the m4 file that does this is pretty complex, it's not immediately clear
where to add $DESTDIR. In addition it comes from gnulib which is a
somewhat annoying upstream.

Therefore, instead, bypass the prefix lookup with
--without-libfoo-prefix. Note that we could set
--with-libfoo-prefix=$(STAGING_DIR)/usr (the latter is already done for
librt and libpthread), but that's pretty pointless -
--without-libfoo-prefix in fact reverts to what should have been done in
the first place, i.e. use the toolchain search path.

Add --without-libfoo-prefix for all options defined in configure (found
with ./configure --help | grep without-.*-prefix). Most of these are
only used in tests (e.g. libcrypto) or even not at all (e.g. libiconv),
but it's fairly hard to discover this and to be sure that they are
indeed not needed, so better pass all of them.

Remove the now-redundant arguments for librt and libpthread.

Add a comment to remind people to revisit these when bumping the
version.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
This is for stable, but need to check if the same prefix options exist
in 3.7.3.
---
 package/gnutls/gnutls.mk | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 0e461cd44c..b5503b1fc9 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
 GNUTLS_VERSION_MAJOR = 3.7
 GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).4
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
@@ -26,7 +27,15 @@ GNUTLS_CONF_OPTS = \
 	--disable-tests \
 	--enable-local-libopts \
 	--enable-openssl-compatibility \
-	--with-librt-prefix=$(STAGING_DIR) \
+	--without-libcrypto-prefix \
+	--without-libdl-prefix \
+	--without-libev-prefix \
+	--without-libiconv-prefix \
+	--without-libintl-prefix \
+	--without-libpthread-prefix \
+	--without-libseccomp-prefix \
+	--without-librt-prefix \
+	--without-libz-prefix \
 	--without-tpm \
 	$(if $(BR2_PACKAGE_GNUTLS_OPENSSL),--enable,--disable)-openssl-compatibility \
 	$(if $(BR2_PACKAGE_GNUTLS_TOOLS),--enable-tools,--disable-tools) \
@@ -39,9 +48,6 @@ GNUTLS_CONF_ENV = gl_cv_socket_ipv6=yes \
 	gl_cv_func_gettimeofday_clobber=no
 GNUTLS_INSTALL_STAGING = YES
 
-# libpthread autodetection poison the linkpath
-GNUTLS_CONF_OPTS += $(if $(BR2_TOOLCHAIN_HAS_THREADS),--with-libpthread-prefix=$(STAGING_DIR)/usr)
-
 # gnutls needs libregex, but pcre can be used too
 # The check isn't cross-compile friendly
 GNUTLS_CONF_ENV += libopts_cv_with_libregex=yes
@@ -70,7 +76,6 @@ GNUTLS_CONF_OPTS += --without-p11-kit
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUNISTRING),y)
-GNUTLS_CONF_OPTS += --with-libunistring-prefix=$(STAGING_DIR)/usr
 GNUTLS_DEPENDENCIES += libunistring
 else
 GNUTLS_CONF_OPTS += --with-included-unistring
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

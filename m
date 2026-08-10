Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D82C5AD55
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 15:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFD4340642;
	Mon, 10 Aug 2026 15:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kdnc4EUS60c3; Mon, 10 Aug 2026 15:50:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 025A340624
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786377021;
	bh=5NvA6kIDKD6cbRn1Yk/RdIptUQrga8PW8JNwAauDnNU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L1MIUh5KRDQeqtM5RwnVcC7SEmnT4HbyWppZ7YTwTOa8H58lq2gOq5qZ/mnyvJ0hT
	 1eXoVVvhipEqEcMjHQ1g9HkjNX4WWwBXgacninQg7Z5zumQBxIez9wWggYFr9YutEg
	 weqhDAlN+sz3fFasvMR7xMICVAAecydnd6SSEoD6wThh7jepv3sV5SnSpIYetSQigu
	 T65SLBmHYdZe10xsT3ZnG8+Tk1b3wf221sUdqrEr1C2qYOoR66dVDTJ4RzvRkYvoPX
	 WVAJNEPfJXrJbFYFz15AiCS7UwIjtY2kTdO8dqMWpxx2HdCoskdXjM2iM086rJcAXf
	 NYj1P7JFHW2SQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 025A340624;
	Mon, 10 Aug 2026 15:50:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C198296
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 15:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82AE960728
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 15:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kW8PtkFQTTad for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 15:50:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9C9F060727
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C9F060727
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C9F060727
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 15:50:18 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-c9d1fff21edso1488490a12.1
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 08:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786377018; x=1786981818;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5sS2BcKY2kaAVqPcLLAyw8Rr2mlgExersJ+RoWovuQU=;
 b=Mf2BKga/ihj4S29/0sD8Ci0bpCk9FhSY15bBTHXU4XnMCXvWK5Ng9Oy8KFVIp/yHTB
 H7UhKP/Jyx6BvPcZJg3czuNsI2Lvl60lXe3ifGPcpdQ+/LQLhC8iE0Q7bH1NHiCl0jM/
 v2Rnz/CcuiLGVvOzuoLdWsnnWIT7ox/t62YEtQsaiqrXEpe2+lkwOqNLPmH96kCuC2EY
 wTTHWF6j+XTDHZ/Un1dcWBvjis2MBZY7rXUsX8Cd4HG8dQYvHRrPFyAlCUvx4XMv+Wax
 24fdeP1C8AuDhsxmZkVcj8g9OKNCFPG/1j3wYYaQOHtDM9R9eoZj+VrrsnLGCT+9FaiJ
 FEbA==
X-Gm-Message-State: AOJu0Yw79Bg94K1ln3mnpCcI3vKjkMkJ0p7NGNSmYMVnc3QEkwy2c632
 b4mbNla0spR7URNqA27Z8TDEuXeyvIUSLJP7Z93GjpueGMVOztPLtSZ0H9PdJE9w
X-Gm-Gg: AR+sD13N+jfYCKvbF3XG6MIqnSTr3egIHQzV0Bkl66tBZJ5+haBZkMORXeq1T5tkjwB
 NpH9apOLIR3JgajrbjAoXcn4OxkJgO0nRSLrnVu8U/9Y8lz8XlEFgKc1Z7K2Nz/QErdjaqyEtl/
 Rqpjgv6rjrJTwTVT6bXGjLZPi22xk8AS5hGR2Z+9tMm/8XOE5jOnXwhyVJ5iBx+BaY1ugmf1in8
 Yl/+uqYqtpo6SKVrSIHsp7zNMJFZw0z3IdCM863isOTF3/x5AJGsCi8AzHJheMC1T/B+Wr0LcNY
 a/mxgI5frngNDvRXJzWfQDO8vPJRWlEtL9l1i6a8zj/avB2mO43O3CHPLVfQfyM/E1BMNCr+uBu
 oElPqoXaC2isuvOfAw3YykT+HJlnCcdZ72JPu464YPJ9W1SVRZBDBpWux73RmpFuo7ipYFqS6x3
 JvnTxxWxUJBGuX7Jw5PzAtOAv2XHayH0PBQ6KbdNEpayVwnqjkF3pHOVNbHIbwavUoLwj3tg==
X-Received: by 2002:a05:6a20:1441:b0:3b3:1c7b:ffb with SMTP id
 adf61e73a8af0-3cb85f4e1b0mr55739876637.34.1786377017587; 
 Mon, 10 Aug 2026 08:50:17 -0700 (PDT)
Received: from fedora ([2409:40e5:1164:f0da:ce1b:8575:cc78:84c8])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-315bec29672sm45064947eec.29.2026.08.10.08.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2026 08:50:17 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 10 Aug 2026 21:19:58 +0530
Message-ID: <20260810155000.3774763-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260514164448.92054-1-chakrabortyshubham66@gmail.com>
References: <20260514164448.92054-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786377018; x=1786981818; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5sS2BcKY2kaAVqPcLLAyw8Rr2mlgExersJ+RoWovuQU=;
 b=KSrtjqMQZj7FdSA3DXj3SC+fLg3vUzEo6u71D9ng+DGqu/3ftbHCDHl+PDZ1T/nerU
 4CqAbDpA+xhtTeBSaRzhLLv/JoCuen4gWv4Hhfp1jfLUHNi8CghHcrPeeysYoTfVNeAB
 5bsMjE1HoIGw2jq++M0fK6/g9AQOkeC/R91FTp66vWN7Pbm4LUUtJo/kPeU7TXJaaYu8
 NJj5tcQ+cEMdzkzpM9jsInMy9BNtaUekYOMeLe7HP3EkhfHqI5yJs5u7zVmgvGjWn6sF
 3HIAP719uDthT+8fhV9Ovc3pavIiKE8PfQqlZyPHORd3nAAl7TSxtXo8xHUzyjqE4cLT
 7y3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=KSrtjqMQ
Subject: [Buildroot] [PATCH v2] package/git: switch to meson build system
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

Switching from autotools-package to meson-package fixes build
failures on older glibc toolchains (such as glibc 2.24 without
<sys/random.h>) because Meson checks both symbol and header presence
via compiler.has_header_symbol('sys/random.h', 'getrandom'), avoiding an
unconditional #include <sys/random.h>.

Also add BR2_TOOLCHAIN_HAS_THREADS dependency to package/git/Config.in
because on toolchains without thread support, compilation fails with
'fatal error: pthread.h: No such file or directory' in thread-utils.h
and linking fails with 'cannot find -lpthread'.

Tested with:
  utils/test-pkg -a -p git

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
Changes v1 -> v2:
  - Convert build infrastructure from autotools-package to meson-package
    instead of carrying custom C patch (Arnout Vandecappelle).
  - Add BR2_TOOLCHAIN_HAS_THREADS dependency to package/git/Config.in.

 package/git/Config.in |  5 ++++
 package/git/git.mk    | 57 +++++++++++++++++++------------------------
 2 files changed, 30 insertions(+), 32 deletions(-)

diff --git a/package/git/Config.in b/package/git/Config.in
index d53921d7d5..e8bc2a76c7 100644
--- a/package/git/Config.in
+++ b/package/git/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GIT
 	bool "git"
 	depends on BR2_USE_MMU # uses fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
@@ -9,3 +10,7 @@ config BR2_PACKAGE_GIT
 	  projects.
 
 	  http://git-scm.com
+
+comment "git needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/git/git.mk b/package/git/git.mk
index 10ef081223..321e168589 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -13,71 +13,64 @@ GIT_CPE_ID_VENDOR = git-scm
 GIT_SELINUX_MODULES = apache git xdg
 GIT_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
 
+GIT_CONF_OPTS = \
+	-Dperl=disabled \
+	-Dpython=disabled \
+	-Dgitweb=disabled \
+	-Dtests=false
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-GIT_DEPENDENCIES += host-pkgconf openssl
-GIT_CONF_OPTS += --with-openssl
-GIT_MAKE_OPTS += LIB_4_CRYPTO="`$(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`"
+GIT_DEPENDENCIES += openssl
+GIT_CONF_OPTS += -Dhttps_backend=openssl
 else
-GIT_CONF_OPTS += --without-openssl
+GIT_CONF_OPTS += -Dhttps_backend=none
 endif
 
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 GIT_DEPENDENCIES += pcre2
-GIT_CONF_OPTS += --with-libpcre2
+GIT_CONF_OPTS += -Dpcre2=enabled
 else
-GIT_CONF_OPTS += --without-libpcre2
+GIT_CONF_OPTS += -Dpcre2=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 GIT_DEPENDENCIES += libcurl
-GIT_CONF_OPTS += --with-curl
-GIT_CONF_ENV += \
-	ac_cv_prog_CURL_CONFIG=$(STAGING_DIR)/usr/bin/$(LIBCURL_CONFIG_SCRIPTS)
+GIT_CONF_OPTS += -Dcurl=enabled
 else
-GIT_CONF_OPTS += --without-curl
+GIT_CONF_OPTS += -Dcurl=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_EXPAT),y)
 GIT_DEPENDENCIES += expat
-GIT_CONF_OPTS += --with-expat
+GIT_CONF_OPTS += -Dexpat=enabled
 else
-GIT_CONF_OPTS += --without-expat
+GIT_CONF_OPTS += -Dexpat=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 GIT_DEPENDENCIES += libiconv
-GIT_CONF_ENV_LIBS += -liconv
-GIT_CONF_OPTS += --with-iconv=$(STAGING_DIR)/usr
-GIT_CONF_ENV += ac_cv_iconv_omits_bom=no
+GIT_CONF_OPTS += -Diconv=enabled
 else
-GIT_CONF_OPTS += --without-iconv
+GIT_CONF_OPTS += -Diconv=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_TCL),y)
 GIT_DEPENDENCIES += tcl
-GIT_CONF_OPTS += --with-tcltk
+GIT_CONF_OPTS += -Dgitk=enabled -Dgit_gui=enabled
 else
-GIT_CONF_OPTS += --without-tcltk
+GIT_CONF_OPTS += -Dgitk=disabled -Dgit_gui=disabled
 endif
 
-ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
-GIT_MAKE_OPTS += NO_GETTEXT=1
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+GIT_CONF_OPTS += -Dgettext=enabled
+else
+GIT_CONF_OPTS += -Dgettext=disabled
 endif
 
-GIT_CFLAGS = $(TARGET_CFLAGS)
-
 ifneq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),)
 GIT_CFLAGS += -O0
 endif
 
-GIT_CONF_OPTS += CFLAGS="$(GIT_CFLAGS)"
-
-GIT_INSTALL_TARGET_OPTS = $(GIT_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
-
-# assume yes for these tests, configure will bail out otherwise
-# saying error: cannot run test program while cross compiling
-GIT_CONF_ENV += \
-	ac_cv_fread_reads_directories=yes \
-	ac_cv_snprintf_returns_bogus=yes LIBS='$(GIT_CONF_ENV_LIBS)'
+GIT_CONF_OPTS += -Dc_args="$(TARGET_CFLAGS) $(GIT_CFLAGS)"
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E796606A339
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 17:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SKjs9VcQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UwP1yCEh
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 147CC60623;
	Sat, 21 Nov 2026 17:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8F9D9wnsx51L; Sat, 21 Nov 2026 17:05:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0A4186063E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795280705;
	b=NWAYoYwusxs17u/ApiGt2gMAjqYD/UGUwQhO4kOKU7zom+xkctKJdq2hEtQsJqXNQLEN
	 Q6xm/9GzkLJS2vgTpoETGAQ45VxH6vNpTa/bsdtkAMW0nLirk7QuAn/7Cts7k5Sw7KFzf
	 iYNxObaDOFtEx0TI4Bu8LGr2GhGGDYfj9Pru/uKxjtURzW1YXG2tHi9oRfQd/nkLJtbsm
	 fiGxkku1IXR/eP6QV4PMUm/zEHzq3jdiaaqWmbbsUpgMVRFnhYQruZPXlQz/y9DR5QAyr
	 1yP/ct4zYt2oGbZ2Ztl96xPPhUusBi9cWKRfX06+la/H5VSlaJb0jduOfmZgaTrl7yg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795280705;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=mMKmxnFn5N8qV0FSsFz6nIn8BRfFOhYiCIeL1Mxr/v4=;
	b=pps78rpNtnld24thrE4Ud5PVMrN3cKW0Ck2ZmCB/cQ6hzNJlcw2RURoRwHB+ulosY/h8
	 6JkqN/UHQHFpuQGjtCQfGeK3VTorGj9uexZZfLM7fZpugvuCv3isyIZdymAfSvn3VNN4x
	 73oJAE3lUeFR065wm3anSMBt3WVmuIG4R4wSTObWnFHv3ytbYb6r5Ue7Jb8XFCHA+OuL5
	 3ohl4Eu9AgFVlxG4e39Z1ThJ876jaUvW/Aa9GoW7x9cChszCbv3LbEb3pwanIjaCw4WwQ
	 XaXZZId0Qa3St3v5GNgk3frcHWylwRvcgsiMgTrCYJj3FCvHvmZpUtxgqZl4v+Yx15A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795280705;
	bh=mMKmxnFn5N8qV0FSsFz6nIn8BRfFOhYiCIeL1Mxr/v4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SKjs9VcQb3U0jMAZpaTfAxVXqnfmd6fy6e/YZxnD0Ca14EWmHQKtqV50YgSCc0Rii
	 t3uyzsE0xogwfyq72wMOa+aoQ4WUXvbRpdTPo/s3TRf9GgIOSNZ+E7zJ0qMh3g+nVa
	 ax89AqKx6nXxN0hHns8no1gZk4AVmQcIcxajBnrQWJ2joiUWvt9D5Dx9EkW0+WIGDd
	 FkilP4ihd8MsEZ5CqQa9XqpaZeRnnQC+otgg9VlichGBSzjhdG5hqVNEEahD8yF4K8
	 Z4JzkpfFm5FFZXxNqs/9ygVfHwSW5YluR0k33mygax1N4AHIC26CBuexHcYzngOM0z
	 OWVWjW3DA5dRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A4186063E;
	Sat, 21 Nov 2026 17:05:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 77F9F3A8
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 17:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E384400AC
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 17:05:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GaVKeGcSdGD5 for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 17:05:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 107144009D
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=UwP1yCEh
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 107144009D
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 17:05:01 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4bb64ef5a00so14825365e9.3
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 09:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795280700; x=1795885500; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UTTlcuNT7UGjfs27lsUOGWXj5GC/jrQoweqXDHEthkA=;
 b=UwP1yCEhfQir6/7T3AAhXX15+UHdRkN+UOl0sZsWU+iRynVQ2RoZbQCSl5oKmFadsj
 BsHqMgw1UIXigEKip/s87OwpZQi0uSI937junb/rwBwJHBryNXB1qGN7NdFJ0ktLjE7l
 aVVaO0GYjDvkHURUKge2HaX96CHKchy5/t9Dzpu2Ilkw+3MXmq9vVLKdwH1vyxAObYqb
 /4iJynG/NfAs710GH1GkwKAd50/PaSxn4SZqJPYlEztw+BIZn+QzOohN11O1Vu2ZBrwS
 EzK142EIeMlE3WlmBC0mWeMm4RDqem5RUY9768+5gyMSD/fgFYfwD6ga6bOqwwGbRcdD
 pNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795280700; x=1795885500;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=UTTlcuNT7UGjfs27lsUOGWXj5GC/jrQoweqXDHEthkA=;
 b=rRtTs03EoqoVt+sZYaV6MPTElfjkS/dykQJSDxm0RwlYMXY3oH8z4R5YLyIfE2oUR2
 u6MiV4oW+4lJR6xogm4GOl3p18Om8eRUB9xm7EIXlWHL9buUCcYYJ9yzEX7LwgxiygNp
 gHnhiFRLKMCT1RrX+WAkEWwhxIWuD5LfvIGPz/XgT20K8vOQtC4+AI8M3KL58iuRoCWf
 S50u8akJqk0aP1VhSY9YQSxeiBWu3BeK/BDAAf7xW2ccet6keVf6DCXHtSm5Cv8X9O39
 xxyCbPgNnAjurM8yeozi/ElkYIRQo76G9RVGUuuaHuqTPdbIt9CLzzS1uwxJl8wCbNyj
 0JFw==
X-Gm-Message-State: APuU4Z+TTEbQIhqXibDg5zpCcK5x6RIthMOF0xR9P7W1wyJux5HcpSV5
 bJs7zfOy2JD5Av1rM4vDJFwvnjVzfVe7vBn9cnXZdaujrfZeVhi3sOSvWB1/TLiB
X-Gm-Gg: AZFdTZeMq5nvNUG6oMG7fpUCYTQ5mfTnc/TCYLuMXpeZ+Pz7y6pyVl8Gk3pLb1aHYOi
 U8/86fexnK5sMdWCdEWa0le5BBVdr9REpvxRMBags8j0/vIN9hR6S2QDV1U9E6qpj4OUWCHlWiG
 pLHLjAdKQ3fSMAuwwza9AuA5XHc3SDL3WhrIzXbd4/70wIHlcx2ophOTooUfQfYlut4ruYp8kqB
 peYdsehkSrysWm7H9nQ0kG0X3jZL7r4XtNYI1Qj2h2B7K47tIbe1hP9knuhKYu2yUrTqsUfCedc
 0RGkrH2oEJS/P37pN36bmQKFsN0jjPvv9FG81iY7Gw6H5OVngOVbFNd2MHCpc36LqoLaP8CPEVN
 88etnQx/gWfG9VMHjzclRhhPRFDx3MheLWDbw3/27AAEZ4DcTplb+mmT/gBRWAJiXZby/E9OKe3
 1t/vMd/GYcLPvKKQvsKh8FZ62D02DPfxqYSBMF3DDt1V/8B4doDCY1r3BbQDe/9FtK3xB2WjlSn
 MjFz10FFRXTcM4YERixibxwj/9ZT3q32yFwGGl2xb4IWcKnxIQvph/pA1Cv5asbr43vLTAQc0Ip
 UizFs2HyZrR9VzIWFXyuvdeYlTfjnFnW3ZhI9htfc+hrOzJ4TY0=
X-Received: by 2002:a05:600c:3508:b0:4b2:3c81:d1 with SMTP id
 5b1f17b1804b1-4bb88826921mr143436305e9.5.1795280699601; 
 Sat, 21 Nov 2026 09:04:59 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884b7515sm262224745e9.13.2026.11.21.09.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 09:04:58 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Nicolas Carrier <nicolas.carrier@orolia.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Arnout Vandecappelle <arnout@rnout.be>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin@orange.com>,
 Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 Jim Reinhart <jimr@tekvox.com>, James Autry <jautry@tekvox.com>,
 Matthew Maron <matthewm@tekvox.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 21 Nov 2026 18:04:56 +0100
Message-ID: <20261121170456.3252494-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20231001163629.2635480-1-giulio.benetti@benettiengineering.com>
References: <20231001163629.2635480-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v7] package/apache: add option to disable server
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>

Other packages (e.g. mongoose) can use htdigest and htpasswd, but those
are only available with apache.

We don't want to build the whole apache server just for those tools, so
we add an option to disable the server; it is enabled by default for
legacy purposes (so that existing (def)configs still work).

However, there is no way to tell the apache buildsystem to only build
those two tools, so we have to provide custom build and install
commands.

Cc: Jim Reinhart <jimr@tekvox.com>
Cc: James Autry <jautry@tekvox.com>
Cc: Matthew Maron <matthewm@tekvox.com>
Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
Co-authored-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v6 -> v7:
  - rebase on master: put the new BR2_PACKAGE_APACHE_MOD_MD option in
    the daemon block too, as it is a module of the server
  - remove the trailing backslash after the common configure options
  - wrap the help text to the Config.in line length

Changes v5 -> v6:
  - update apparmor BR2_PACKAGE_APACHE to BR2_PACKAGE_APACHE_DAEMON
    [Romain Naour]

Changes v4 -> v5:
  - drop BR2_PACKAGE_APACHE check in package/Config.in for
    package/modsecurity2/Config.in [Yann E. MORIN]
  - make BR2_PACKAGE_PHP_SAPI_APACHE depends on
    BR2_PACKAGE_APACHE_DAEMON [Yann E. MORIN]
  - improve commit log [Yann E. MORIN]

Changes v3 -> v4:
  - drop --with-static-* options [Arnout Vandecappelle]

Changes v2 -> v3:
  - change negative option BR2_PACKAGE_APACHE_UTILS_ONLY to
    BR2_PACKAGE_APACHE_DAEMON [Arnout Vandecappelle]
  - set a common APACHE_CONF_OPTS and only add specific options for
    BR2_PACKAGE_APACHE_DAEMON enabled or not [Arnout Vandecappelle]

Changes v1 -> v2:
  - hide "External Apache modules" if BR2_PACKAGE_APACHE_UTILS_ONLY is
    enabled

Supersedes v6: https://patchwork.buildroot.org/project/buildroot/patch/20231001163629.2635480-1-giulio.benetti@benettiengineering.com/

 package/Config.in              |  2 --
 package/apache/Config.in       | 10 ++++++++++
 package/apache/apache.mk       | 22 ++++++++++++++++++----
 package/apparmor/apparmor.mk   |  2 +-
 package/modsecurity2/Config.in |  2 +-
 package/php/Config.in          |  2 +-
 6 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 49659b007e..3f841c60a7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2425,11 +2425,9 @@ menu "Networking applications"
 	source "package/alfred/Config.in"
 	source "package/aoetools/Config.in"
 	source "package/apache/Config.in"
-if BR2_PACKAGE_APACHE
 menu "External Apache modules"
 	source "package/modsecurity2/Config.in"
 endmenu
-endif
 	source "package/argus/Config.in"
 	source "package/arp-scan/Config.in"
 	source "package/arptables/Config.in"
diff --git a/package/apache/Config.in b/package/apache/Config.in
index 6b21428c2c..f59c387f71 100644
--- a/package/apache/Config.in
+++ b/package/apache/Config.in
@@ -17,6 +17,14 @@ config BR2_PACKAGE_APACHE
 
 if BR2_PACKAGE_APACHE
 
+config BR2_PACKAGE_APACHE_DAEMON
+	bool "apache-daemon"
+	default y
+	help
+	  Provide entire Apache daemon, otherwise only htdigest and
+	  htpasswd will be built and installed.
+
+if BR2_PACKAGE_APACHE_DAEMON
 choice
 	prompt "Multi-Processing Module (MPM)"
 	default BR2_PACKAGE_APACHE_MPM_WORKER
@@ -55,6 +63,8 @@ config BR2_PACKAGE_APACHE_MOD_MD
 
 endif
 
+endif
+
 comment "apache needs a toolchain w/ dynamic library, threads"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index d6ba7fa4f5..b601f08e7d 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -12,8 +12,6 @@ APACHE_LICENSE_FILES = LICENSE
 APACHE_CPE_ID_VENDOR = apache
 APACHE_CPE_ID_PRODUCT = http_server
 APACHE_SELINUX_MODULES = apache
-# Needed for mod_php
-APACHE_INSTALL_STAGING = YES
 # We have a patch touching configure.in and Makefile.in,
 # so we need to autoreconf:
 APACHE_AUTORECONF = YES
@@ -32,10 +30,16 @@ APACHE_MPM = worker
 endif
 
 APACHE_CONF_OPTS = \
-	--sysconfdir=/etc/apache2 \
 	--with-apr=$(STAGING_DIR)/usr \
 	--with-apr-util=$(STAGING_DIR)/usr \
-	--with-pcre=$(STAGING_DIR)/usr/bin/pcre2-config \
+	--with-pcre=$(STAGING_DIR)/usr/bin/pcre2-config
+
+ifeq ($(BR2_PACKAGE_APACHE_DAEMON),y)
+# Needed for mod_php
+APACHE_INSTALL_STAGING = YES
+
+APACHE_CONF_OPTS += \
+	--sysconfdir=/etc/apache2 \
 	--enable-http \
 	--enable-dbd \
 	--enable-proxy \
@@ -134,5 +138,15 @@ define APACHE_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/apache/apache.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/apache.service
 endef
+else
+define APACHE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/support htdigest htpasswd
+endef
+
+define APACHE_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/support/htdigest $(TARGET_DIR)/usr/bin/htdigest
+	$(INSTALL) -m 0755 -D $(@D)/support/htpasswd $(TARGET_DIR)/usr/bin/htpasswd
+endef
+endif
 
 $(eval $(autotools-package))
diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index ba63344bd2..9f35485c57 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -51,7 +51,7 @@ APPARMOR_DEPENDENCIES += linux-pam
 APPARMOR_TOOLS += changehat/pam_apparmor
 endif
 
-ifeq ($(BR2_PACKAGE_APACHE),y)
+ifeq ($(BR2_PACKAGE_APACHE_DAEMON),y)
 APPARMOR_DEPENDENCIES += apache
 APPARMOR_TOOLS += changehat/mod_apparmor
 APPARMOR_MAKE_OPTS += APXS=$(STAGING_DIR)/usr/bin/apxs
diff --git a/package/modsecurity2/Config.in b/package/modsecurity2/Config.in
index df5634bf89..0538521ddc 100644
--- a/package/modsecurity2/Config.in
+++ b/package/modsecurity2/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_MODSECURITY2
 	bool "modsecurity2"
-	depends on BR2_PACKAGE_APACHE
+	depends on BR2_PACKAGE_APACHE_DAEMON
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_PCRE2
 	help
diff --git a/package/php/Config.in b/package/php/Config.in
index af8574ac75..6c69ffa005 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -39,7 +39,7 @@ if BR2_PACKAGE_PHP
 
 config BR2_PACKAGE_PHP_SAPI_APACHE
 	bool "Apache interface"
-	depends on BR2_PACKAGE_APACHE
+	depends on BR2_PACKAGE_APACHE_DAEMON
 	help
 	  Apache module
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

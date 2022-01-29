Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A553C433EF
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 10:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A76FA40907;
	Sat, 29 Jan 2022 10:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ayf_70sBzgmP; Sat, 29 Jan 2022 10:46:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CA1D408CE;
	Sat, 29 Jan 2022 10:46:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC2871BF82F
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 10:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99AE140159
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 10:46:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d4S9LT69a1J7 for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 10:46:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59A9F400AF
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 10:46:33 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id u15so15741333wrt.3
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 02:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mltiYoQdyfmgyu9mr3XXuD7h4QSQIRKgMGLtAMM5UKU=;
 b=Y0XuW51NfeSSYTicdmokOIM5lmVGM39xXp8k9IOlAZks+O9pi8+osBQ270be0tFNSD
 9143AfTF9zn4bqCLh9rySDDNytaXZ16eRSizY/vjqxppMELhfCQgRt0zIVEXrHgvvFIF
 qtCtFtB7SbC3cK7JN7M9wuN4R1DruZ1+WBvX50lzGbmfwqr9PE6WMNBIqJBlaskZpilA
 bL+Otv2oEIFonWY0ilsR6h3QymN1TaowF5ke7EHkhe/Ba/7iW8hjfJpxCIR4vKTf5kLa
 NDNqu8HJLuWB6f61cpyFdOYO+JOqRptq+AIcUbG7VLSFsQn+u6WvIBVsRse4mZQvDDGz
 iO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mltiYoQdyfmgyu9mr3XXuD7h4QSQIRKgMGLtAMM5UKU=;
 b=Cy7JuoYb1IDDIhSlSkk+xK0FOk+QizajkrfnhNMOWqNKVYOOB2UeRk7HotddowcUJ2
 LE7CxgwOW1wCgLJIZnDhUa+jTSD2cmY0pypn871Sd0jmibdXmM+0rkDn2RO5u/rf/df5
 YdpAmYXIcVikcFhY2LVlT81PcnvfVSocipZCqja+IPR7vcjHVDOUKATPxCERLpjqwf2g
 eTpWp6sMeX02g583rXo3vve4moa+Dcf/T/R8fkFhNUNQNLhp7T8PKxmNGDkHrSdZKasU
 zoefVnbH6Cgz2fgddfAWuZ0t1t3lV1XlaXMbHm5W5KFImdGEku6rxmDxf1unI8s12fQ9
 AKig==
X-Gm-Message-State: AOAM530ft39peOSOG5q1TA376QxeAxbpf1WHntdDlBANyn0r37vfw+u2
 2Di7rUdtxGbM8Hyk2uv+xeLShNOijEo=
X-Google-Smtp-Source: ABdhPJxmKypxjjQvDSweia56lFJgF2tuUR8OrWlj3axMrMMJK6RyR5T+8XmEc57njVbONpdCSFGJ8w==
X-Received: by 2002:a5d:684a:: with SMTP id o10mr10195806wrw.196.1643453191363; 
 Sat, 29 Jan 2022 02:46:31 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id y6sm605800wrl.46.2022.01.29.02.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 02:46:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Jan 2022 11:44:25 +0100
Message-Id: <20220129104425.3724653-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/1] package/htpdate: fix static openssl build
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following static build failure with openssl raised since bump to
version 1.3.3 in commit 163509a8e0d558e6339c5489f072dfe805e0cc34:

/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sh4-buildroot-linux-uclibc/10.3.0/../../../../sh4-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-3/output-1/host/sh4-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a(rec_layer_d1.o): in function `DTLS_RECORD_LAYER_new':
rec_layer_d1.c:(.text+0x124): undefined reference to `CRYPTO_malloc'

Fixes:
 - http://autobuild.buildroot.org/results/75ad8515916dfa056b17c97fdd95c7eb4d83a304

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Move pkg-config call in htpdate.mk following upstream feedback:
   https://github.com/twekkel/htpdate/pull/17

 ...BS-to-be-configured-from-environment.patch | 37 +++++++++++++++++++
 package/htpdate/htpdate.mk                    |  4 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 package/htpdate/0001-Allow-SSL_LIBS-to-be-configured-from-environment.patch

diff --git a/package/htpdate/0001-Allow-SSL_LIBS-to-be-configured-from-environment.patch b/package/htpdate/0001-Allow-SSL_LIBS-to-be-configured-from-environment.patch
new file mode 100644
index 0000000000..6dca2babab
--- /dev/null
+++ b/package/htpdate/0001-Allow-SSL_LIBS-to-be-configured-from-environment.patch
@@ -0,0 +1,37 @@
+From 4ba90fedd553c3b06c925fb6ff5245a5dcabace9 Mon Sep 17 00:00:00 2001
+From: Eddy Vervest <eddy@vervest.org>
+Date: Sat, 29 Jan 2022 10:58:13 +0100
+Subject: [PATCH] Allow SSL_LIBS to be configured from environment
+
+[Retrieved from:
+https://github.com/twekkel/htpdate/commit/4ba90fedd553c3b06c925fb6ff5245a5dcabace9]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 4796efa..cf077e6 100644
+--- a/Makefile
++++ b/Makefile
+@@ -2,8 +2,9 @@ prefix = $(DESTDIR)/usr
+ bindir = ${prefix}/sbin
+ mandir = ${prefix}/share/man
+ 
+-CC     ?= gcc
+-CFLAGS += -Wall -std=c11 -pedantic -O2
++CC       ?= gcc
++CFLAGS   += -Wall -std=c11 -pedantic -O2
++SSL_LIBS ?= -lssl
+ 
+ INSTALL ?= install -c
+ STRIP   ?= strip -s
+@@ -14,7 +15,7 @@ htpdate: htpdate.c
+ 	$(CC) $(CFLAGS) -o htpdate htpdate.c
+ 
+ https: htpdate.c
+-	$(CC) $(CFLAGS) -DENABLE_HTTPS -o htpdate htpdate.c -lssl
++	$(CC) $(CFLAGS) -DENABLE_HTTPS -o htpdate htpdate.c $(SSL_LIBS)
+ 
+ install: all
+ 	$(STRIP) htpdate
diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
index 54b3ec2569..e32480fc85 100644
--- a/package/htpdate/htpdate.mk
+++ b/package/htpdate/htpdate.mk
@@ -10,7 +10,9 @@ HTPDATE_LICENSE = GPL-2.0+
 HTPDATE_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-HTPDATE_BUILD_OPTS = https
+HTPDATE_BUILD_OPTS = \
+	https \
+	SSL_LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs openssl`"
 HTPDATE_DEPENDENCIES += openssl host-pkgconf
 endif
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

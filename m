Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC539C433EF
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 12:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1471408D4;
	Sat, 19 Feb 2022 12:25:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w8uPePNpDzyV; Sat, 19 Feb 2022 12:25:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C76DF408C2;
	Sat, 19 Feb 2022 12:25:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D5D01BF3DA
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 12:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BD47408C2
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 12:25:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mcZjfUQFY4xi for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 12:25:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DB7D408BD
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 12:25:40 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id h6so18867531wrb.9
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 04:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tRteVz8DoESGhWfL7qwVFbUn6AgTNgjkzFr6tSdOMyA=;
 b=kNn93e5lO0Jzq8vvfk95DQco9o5Qn6J4rUbatYujNo2lVEkjoyYHB7wDjaFwuh2WzY
 lPRJ8QQpX+Yv/mJ9yPa9rivOWrUvkSxqfzm9WEx4WhnaKa80SHptUhnhgb+xxAjoYDb4
 33JCPJSv4lXAeklIO6VOUBAl5hTn60O+nCqPSE/5MmCQOIccFfeVhQPfgddzW/o6Osm3
 fdWmoA/skfTGcQUIhFzp9gfDRJlb16JvxSc4R+NrDB6UMD3LNIyH6HehkslLndQH3FgL
 MQuYOU4pYDIA3vegVFw64ftoKK4wS/25X3I/PPtPDdHlHKLUNdY+b0yIm3jRdDWlHCyc
 DZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tRteVz8DoESGhWfL7qwVFbUn6AgTNgjkzFr6tSdOMyA=;
 b=CerXHXMSMJveVvD+H5ILUt/g+hRCYrgDhJ5Tba5ZFejM06vDBk/zEGQxPPA1GoRqGa
 s1fSOzFDqDqJtvoofpDB1ZucFSXT5hJOC7rbaonC1J8SiS4pfGdRdizlLoG4N499oTEJ
 h3R+2FBn8x3ZI8HibJNZHCZ9RGyj2XspWRS3VFbcz+XZmZvg/9l1p9mvULf8Xy7ZNmyz
 qJpw4R54kzT/4fN7CMZEQPNiJf5ldOKF4BADq9oq0adPhDnHR72COzuGqL2KTHLRMBm8
 LiqXMusiXsmPwf+tp2kNzyWMmeGhzZtoegf+0jEDZImxj8dJwle/hgbEjwqW/+nqgsAI
 /wSg==
X-Gm-Message-State: AOAM531jJJ30RZBu0Sr7oqo555XF8ZYYmGvLjZUjIQ6v8bb+KNB3ddad
 ixKD6gDpNCGh687RKIT4pWbSxOFt0H8=
X-Google-Smtp-Source: ABdhPJx3JbGTQv2OrS/dGJeo/RNXXAQvLu2uEBJO5m8knlq2uQFMSfWwJvTbP9ffBq5u/brSy3lTCw==
X-Received: by 2002:adf:80ad:0:b0:1e3:238a:178e with SMTP id
 42-20020adf80ad000000b001e3238a178emr9627837wrl.551.1645273538222; 
 Sat, 19 Feb 2022 04:25:38 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id a9sm27155609wrr.20.2022.02.19.04.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 04:25:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 19 Feb 2022 13:25:26 +0100
Message-Id: <20220219122526.2954354-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220219122526.2954354-1-fontaine.fabrice@gmail.com>
References: <20220219122526.2954354-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/librsvg: fix loaders.cache
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

Set GDK_PIXBUF_MODULEDIR to gdk_pixbuf_moduledir before calling
gdk-pixbuf-query-loaders to build a correct loaders.cache and fix the
following PPD build failure of adwaita-icon-theme raised since commit
b06294e9897e90862656416e8b67fdace15488d7 which now correctly updates
loaders.cache:

Can't load file: Unrecognized image file format

Fixes:
 - http://autobuild.buildroot.org/results/0e00059b09b4445eaaec1030997883187c6a80d6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...r-Makefile.am-set-GDK_PIXBUF_MODULED.patch | 39 +++++++++++++++++++
 package/librsvg/librsvg.mk                    |  2 +
 2 files changed, 41 insertions(+)
 create mode 100644 package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch

diff --git a/package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch b/package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch
new file mode 100644
index 0000000000..94db8eb143
--- /dev/null
+++ b/package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch
@@ -0,0 +1,39 @@
+From 2c472bf55289ccbd7f305aa3e98d6fd70be4e3ab Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 19 Feb 2022 12:02:10 +0100
+Subject: [PATCH] gdk-pixbuf-loader/Makefile.am: set GDK_PIXBUF_MODULEDIR
+
+Set GDK_PIXBUF_MODULEDIR to gdk_pixbuf_moduledir before calling
+gdk-pixbuf-query-loaders to build a correct gdk_pixbuf_cache_file and
+gdk-pixbuf.loaders on 'exotic' systems
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ gdk-pixbuf-loader/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gdk-pixbuf-loader/Makefile.am b/gdk-pixbuf-loader/Makefile.am
+index c3493736..de1f9641 100644
+--- a/gdk-pixbuf-loader/Makefile.am
++++ b/gdk-pixbuf-loader/Makefile.am
+@@ -49,7 +49,7 @@ rsvg_loader_LDADD = \
+ EXTRA_rsvg_loader_DEPENDENCIES = libpixbufloader-svg.la gdk-pixbuf-loaders
+ 
+ gdk-pixbuf-loaders: Makefile
+-	$(AM_V_GEN) ( $(GDK_PIXBUF_QUERYLOADERS) ./libpixbufloader-svg.la && $(GDK_PIXBUF_QUERYLOADERS)) > gdk-pixbuf.loaders 2>/dev/null
++	$(AM_V_GEN) ( $(GDK_PIXBUF_QUERYLOADERS) ./libpixbufloader-svg.la && GDK_PIXBUF_MODULEDIR=$(gdk_pixbuf_moduledir) $(GDK_PIXBUF_QUERYLOADERS)) > gdk-pixbuf.loaders 2>/dev/null
+ 
+ if CROSS_COMPILING
+ RUN_QUERY_LOADER_TEST=false
+@@ -68,7 +68,7 @@ endif
+ install-data-hook:
+ 	@if $(RUN_QUERY_LOADER_TEST) ; then \
+ 		$(mkinstalldirs) $(DESTDIR)$(gdk_pixbuf_binarydir) ; \
+-		$(GDK_PIXBUF_QUERYLOADERS) > $(DESTDIR)$(gdk_pixbuf_cache_file) ; \
++		GDK_PIXBUF_MODULEDIR=$(gdk_pixbuf_moduledir) $(GDK_PIXBUF_QUERYLOADERS) > $(DESTDIR)$(gdk_pixbuf_cache_file) ; \
+ 	else \
+ 	  echo "***" ; \
+ 	  echo "*** Warning: loaders.cache not built" ; \
+-- 
+2.34.1
+
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index e4b1942b79..07a14b4366 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -20,6 +20,8 @@ HOST_LIBRSVG_DEPENDENCIES = host-cairo host-gdk-pixbuf host-libglib2 host-libxml
 LIBRSVG_LICENSE = LGPL-2.1+
 LIBRSVG_LICENSE_FILES = COPYING.LIB
 LIBRSVG_CPE_ID_VENDOR = gnome
+# We're patching gdk-pixbuf-loader/Makefile.am
+LIBRSVG_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 LIBRSVG_CONF_OPTS += --enable-introspection
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

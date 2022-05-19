Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BC3C433EF
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 04:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7512F41CF5;
	Thu, 19 May 2022 04:56:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n6XZi5hfeNbY; Thu, 19 May 2022 04:55:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEF6841D0D;
	Thu, 19 May 2022 04:55:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9262B1BF3C6
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 04:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 815D58440B
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 04:55:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5P0lNZ98__xQ for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 04:55:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1471843FC
 for <buildroot@buildroot.org>; Thu, 19 May 2022 04:55:54 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id s12so2909831iln.11
 for <buildroot@buildroot.org>; Wed, 18 May 2022 21:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JvxATByj3RDEfi/3/6uRmf6jDgLOKyLHckC9wqZ3LwI=;
 b=pPf1bRji6itBGBAh7KYLOIOB6rcxvDiolaeD09FjRII1PtrkVIsgvUc6pBekmRDoIV
 03YpvROYLSU8dR2ByRz9F5182Kw1CvjpodZEsQJ6/g3yLeaoBVTHx6e0yJVtBgwSyleT
 XnjAwF2TtZsqR7Zn/g73oCYhaa3wNteR8O3augYFZ2Cja5pXuHQDPQDxgaXadfRuY2B/
 KHb9oPRNeopgEbAyiS+Rnq58vjvETdpquNwkLau9nxmb29BpFKZbgvNgByqhcXGy+ja6
 IgwRojjxxUVVhdQfsvSVHgzUic2Jj3U5ZLRy/dqJZPtUFhVav8Z9htWEzd6F0VQopFY+
 qMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JvxATByj3RDEfi/3/6uRmf6jDgLOKyLHckC9wqZ3LwI=;
 b=VV2jzGb9Y97fApTf/tlUhZmRNhwDM5c9kPfYdsGKbaKeYV3DovzrpLJzyn4Tca1lF4
 fHkFUPaFzPiDu9a16WOcTDxjTSTv9E+nw+6Ki7wWwqCFchtYd2q8BQdGoZ3xHtPjwGGR
 5+bc3/TtqPS7VH5W3L1eelA1xzxi333opRudx/nijUW9eUeg0+A/SH5F469vGnFB++P9
 MqAN34xPT2knQ3gmg080aLOKRFKCfv+h2mrvCDF3NFRanxCgor6xXw4hHEI7t4Pzxq2n
 Eht51UBktq3yqI4oaggyUtJe+xpGsNIi5L24i1B65S5+RlWVB47B0t9EJMJuWXsLTwUm
 fbDg==
X-Gm-Message-State: AOAM531kKO/qttm4TWH8KisX2V0yQlkE+NsBCjANyhQvsrwvtuBkuXfw
 0aicDCjUZWfPj9XAcF9dsrlrn6jnggU=
X-Google-Smtp-Source: ABdhPJwhikABbIWeDJwVnv91VnRwHswCj9lW60XU1qsSy8aMOQ2NH6vW5QalphxIzf6jTrB6TzKo3Q==
X-Received: by 2002:a92:ce07:0:b0:2d1:1492:7e71 with SMTP id
 b7-20020a92ce07000000b002d114927e71mr1687911ilo.145.1652936153608; 
 Wed, 18 May 2022 21:55:53 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 y24-20020a5d9b18000000b0065a47e16f44sm443852ion.22.2022.05.18.21.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 21:55:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 May 2022 22:55:49 -0600
Message-Id: <20220519045549.2320246-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gcr: don't require gnupg2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Requiring BR2_PACKAGE_GNUPG2 introduced a recursive dependency,
since it appears gcr also supports gnupg we don't need to depend
on !BR2_PACKAGE_GNUPG and can use gnupg if needed.

Fixes:
package/gstreamer1/gstreamer1/Config.in:5:error: recursive dependency detected!
package/gstreamer1/gstreamer1/Config.in:5:	symbol BR2_PACKAGE_GSTREAMER1 is selected by BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
package/webkitgtk/Config.in:90:	symbol BR2_PACKAGE_WEBKITGTK_MULTIMEDIA depends on BR2_PACKAGE_WEBKITGTK
package/webkitgtk/Config.in:24:	symbol BR2_PACKAGE_WEBKITGTK is selected by BR2_PACKAGE_MIDORI
package/midori/Config.in:24:	symbol BR2_PACKAGE_MIDORI depends on BR2_PACKAGE_GNUPG
package/gnupg/Config.in:1:	symbol BR2_PACKAGE_GNUPG is selected by BR2_PACKAGE_PYTHON_GNUPG
package/python-gnupg/Config.in:1:	symbol BR2_PACKAGE_PYTHON_GNUPG depends on BR2_PACKAGE_PYTHON3
package/python3/Config.in:5:	symbol BR2_PACKAGE_PYTHON3 is selected by BR2_PACKAGE_JACK2_DBUS
package/jack2/Config.in:35:	symbol BR2_PACKAGE_JACK2_DBUS depends on BR2_PACKAGE_JACK2
package/jack2/Config.in:1:	symbol BR2_PACKAGE_JACK2 is selected by BR2_PACKAGE_FLUIDSYNTH_JACK2
package/fluidsynth/Config.in:38:	symbol BR2_PACKAGE_FLUIDSYNTH_JACK2 depends on BR2_PACKAGE_FLUIDSYNTH
package/fluidsynth/Config.in:1:	symbol BR2_PACKAGE_FLUIDSYNTH is selected by BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FLUIDSYNTH
package/gstreamer1/gst1-plugins-bad/Config.in:438:	symbol BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FLUIDSYNTH depends on BR2_PACKAGE_GSTREAMER1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gcr/Config.in    | 14 ++------------
 package/gcr/gcr.mk       | 10 +++++++---
 package/midori/Config.in |  6 ------
 3 files changed, 9 insertions(+), 21 deletions(-)

diff --git a/package/gcr/Config.in b/package/gcr/Config.in
index afbec1a317..7c5fdba008 100644
--- a/package/gcr/Config.in
+++ b/package/gcr/Config.in
@@ -1,12 +1,11 @@
 config BR2_PACKAGE_GCR
 	bool "gcr"
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # gnupg2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
 	depends on !BR2_STATIC_LIBS # p11-kit
-	depends on !BR2_PACKAGE_GNUPG # gnupg2
-	select BR2_PACKAGE_GNUPG2 # runtime
+	select BR2_PACKAGE_GNUPG2 if BR2_PACKAGE_GNUPG2_DEPENDS && !BR2_PACKAGE_GNUPG # runtime
+	select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2_DEPENDS # runtime
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_P11_KIT
@@ -16,15 +15,6 @@ config BR2_PACKAGE_GCR
 	  https://developer.gnome.org/gcr/
 
 comment "gcr needs a toolchain w/ wchar, threads, dynamic library"
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
-
-comment "gcr is incompatible with gnupg, gnupg2 only"
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
-	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_PACKAGE_GNUPG # gnupg2
diff --git a/package/gcr/gcr.mk b/package/gcr/gcr.mk
index ef253b4ef9..d479de82d3 100644
--- a/package/gcr/gcr.mk
+++ b/package/gcr/gcr.mk
@@ -15,14 +15,18 @@ GCR_DEPENDENCIES = \
 	p11-kit \
 	$(TARGET_NLS_DEPENDENCIES)
 GCR_INSTALL_STAGING = YES
-GCR_CONF_OPTS = \
-	-Dgpg_path=/usr/bin/gpg2 \
-	-Dgtk_doc=false
+GCR_CONF_OPTS = -Dgtk_doc=false
 # Even though COPYING is v2 the code states v2.1+
 GCR_LICENSE = LGPL-2.1+
 GCR_LICENSE_FILES = COPYING
 GCR_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
+ifeq ($(BR2_PACKAGE_GNUPG2),y)
+GCR_CONF_OPTS += -Dgpg_path=/usr/bin/gpg2
+else
+GCR_CONF_OPTS += -Dgpg_path=/usr/bin/gpg
+endif
+
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 GCR_DEPENDENCIES += gobject-introspection host-libxslt host-vala
 GCR_CONF_OPTS += -Dintrospection=true
diff --git a/package/midori/Config.in b/package/midori/Config.in
index 308b0a7a42..f45444a289 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT # webkitgtk -> icu
 
@@ -21,15 +20,10 @@ comment "midori needs libgtk3 w/ X11 or wayland backend"
 	depends on !BR2_PACKAGE_LIBGTK3_X11 && \
 		!BR2_PACKAGE_LIBGTK3_WAYLAND
 
-comment "midori is incompatible with gnupg, gnupg2 only"
-	depends on BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_GNUPG
-
 config BR2_PACKAGE_MIDORI
 	bool "midori"
 	depends on BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS # webkitgtk
-	depends on !BR2_PACKAGE_GNUPG # gcr
 	depends on BR2_INSTALL_LIBSTDCPP # webkitgtk
 	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # webkitgtk
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B93C4332F
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 21:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A236441666;
	Mon, 24 Jan 2022 21:36:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id whm0-jHk5Vi3; Mon, 24 Jan 2022 21:36:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5B1B4152B;
	Mon, 24 Jan 2022 21:36:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B336D1BF35F
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0F3A60B06
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CT8r5BjUTrEz for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 21:36:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5D0960F1C
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 21:36:34 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id e8so14321409wrc.0
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 13:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+6XVSBsN5a7qTcD0/ynRYYmbrcr+u6d13wQPULbiCOo=;
 b=kwaQiZ48okpmwr+bbhL3/AHky7+/urPNpQK9l2zw2gs7CWLnA39bBr3SiCnITBV5GM
 OCEcmgEPEyeJR6RZuELEVQbBo996QZ/ag5GByIxpVKVLGYCyxVo40YzxJ2YdB4fuwxLa
 JQBR0/QuQc8DxCGd+5GFC6JT79QaoFa0cVNIpSPZd49733nqxr0ozUlZxXpUzZgnDJlh
 gCO0h7I6MLc2a1yUGTtY7sqoGvWyuaEDGz4A6NzdeO8Rtj9tcWZ+0EPiFpvQ75X4pc3L
 iSKy9jufhpCzBI/dgtkPs884mYQxX7IoUAqrPPWC0mQZh5bzoDugv5eoJPepPkeUO2Df
 1cKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+6XVSBsN5a7qTcD0/ynRYYmbrcr+u6d13wQPULbiCOo=;
 b=Lmw9C8JOCPuDOY7ojAOk4zUk6dlekm9+sLC0bBdE0Mc2CDCEUtNCUzVWbsiox3zF5p
 U5bXgyVanJSmV2jM03izzBgIQkpU72+8lnhDVbG/xyUSV3onjoeKVPu0C5watN9F0Lg/
 LPh6ZmLzK1UTV5fqC0mnTZFacmzdM4K9AFkwXhESY0wdm2yvy4VMLOoYx+weSr+jTHaN
 Sajr6hKLfZ4hH+kmjn4udomWc8F1SfFTxmMwQD2ZWP+tfuojSJprDjo83rHArxN9J0cA
 VKmTbHpkJ26UTcScOeq11bMeo+IwZLxf5X+1+WWgXAPdte91DvcOS3i2OdpG6Kh+I0Ly
 mA+g==
X-Gm-Message-State: AOAM531lM4f0hXtaBfof0yuaRGdP4dYNgQsOKjeEbeJLnFGhgyQJ81tt
 4vGFkMODD+IeDKG2GSWsEksLvSJ5/Vs=
X-Google-Smtp-Source: ABdhPJy6GdfxoJfUPmWK1XsTerGcB1UjfsDcu1U+9NOW+Nun8gAIp6kwAibK1PXrRiKyXb1KxfUVhg==
X-Received: by 2002:a05:6000:184:: with SMTP id
 p4mr6324041wrx.273.1643060192665; 
 Mon, 24 Jan 2022 13:36:32 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id c8sm568670wmq.34.2022.01.24.13.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 13:36:32 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 22:34:45 +0100
Message-Id: <20220124213445.2426794-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/poppler: fix introspection build
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since commit
9d1d4818c39d97ad7a1cdf6e075b9acae6dfff71:

[ 98%] Generating Poppler-0.18.typelib
Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
error parsing file /home/giuliobenetti/autobuild/run/instance-1/output-1/build/poppler-21.12.0/glib/Poppler-0.18.gir: Failed to parse included gir GObject-2.0
If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the .mk file should help.
Typically like this: PKG_MAKE_ENV += GIR_EXTRA_LIBS_PATH="$(@D)/.libs"

Fixes:
 - http://autobuild.buildroot.org/results/d2f50aa56410c2fff8a0538c57038104906e747e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...txt-allow-the-user-to-configure-INTR.patch | 43 +++++++++++++++++++
 package/poppler/poppler.mk                    |  4 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 package/poppler/0002-glib-CMakeLists.txt-allow-the-user-to-configure-INTR.patch

diff --git a/package/poppler/0002-glib-CMakeLists.txt-allow-the-user-to-configure-INTR.patch b/package/poppler/0002-glib-CMakeLists.txt-allow-the-user-to-configure-INTR.patch
new file mode 100644
index 0000000000..473966d7c9
--- /dev/null
+++ b/package/poppler/0002-glib-CMakeLists.txt-allow-the-user-to-configure-INTR.patch
@@ -0,0 +1,43 @@
+From f9e5d423b0f765f2393a95c3299a2d827b9d3fb3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 24 Jan 2022 09:28:20 +0100
+Subject: [PATCH] glib/CMakeLists.txt: allow the user to configure
+ INTROSPECTION_COMPILER_ARGS
+
+Allow the user to add its own parameters such as
+--includedir=$(STAGING_DIR)/usr/share/gir-1.0 to
+INTROSPECTION_COMPILER_ARGS to avoid the following build failure when
+cross-compiling with buildroot:
+
+[ 98%] Generating Poppler-0.18.typelib
+Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
+error parsing file /home/giuliobenetti/autobuild/run/instance-1/output-1/build/poppler-21.12.0/glib/Poppler-0.18.gir: Failed to parse included gir GObject-2.0
+If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the .mk file should help.
+Typically like this: PKG_MAKE_ENV += GIR_EXTRA_LIBS_PATH="$(@D)/.libs"
+
+Fixes:
+ - http://autobuild.buildroot.org/results/d2f50aa56410c2fff8a0538c57038104906e747e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/poppler/poppler/-/merge_requests/1049]
+---
+ glib/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/glib/CMakeLists.txt b/glib/CMakeLists.txt
+index 7510e69e..f5130e3c 100644
+--- a/glib/CMakeLists.txt
++++ b/glib/CMakeLists.txt
+@@ -119,7 +119,7 @@ if (HAVE_INTROSPECTION AND BUILD_SHARED_LIBS)
+   # General gir: Reset object-list for introspection & load tool args
+   set(INTROSPECTION_GIRS)
+   set(INTROSPECTION_SCANNER_ARGS "--add-include-path=${CMAKE_CURRENT_SOURCE_DIR}" "--warn-all")
+-  set(INTROSPECTION_COMPILER_ARGS "--includedir=${CMAKE_CURRENT_SOURCE_DIR}")
++  set(INTROSPECTION_COMPILER_ARGS ${INTROSPECTION_COMPILER_ARGS} "--includedir=${CMAKE_CURRENT_SOURCE_DIR}")
+ 
+   # Poppler: Assign package to gir & export keys
+   set(Poppler_0_18_gir "poppler-glib")
+-- 
+2.34.1
+
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 9e9bfc9cba..7062923c6c 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -44,7 +44,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 POPPLER_DEPENDENCIES += gobject-introspection
-POPPLER_CONF_OPTS += -DENABLE_GOBJECT_INTROSPECTION=ON
+POPPLER_CONF_OPTS += \
+	-DENABLE_GOBJECT_INTROSPECTION=ON \
+	-DINTROSPECTION_COMPILER_ARGS="--includedir=$(STAGING_DIR)/usr/share/gir-1.0"
 else
 POPPLER_CONF_OPTS += -DENABLE_GOBJECT_INTROSPECTION=OFF
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

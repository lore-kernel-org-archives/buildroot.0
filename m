Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C3EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 21:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F22C400CD;
	Sat, 29 Jan 2022 21:43:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 105LxNiEYkAo; Sat, 29 Jan 2022 21:43:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4934A400FE;
	Sat, 29 Jan 2022 21:43:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 083AF1BF4E3
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 21:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9B09400F6
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 21:43:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oxjPUCW3lroD for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 21:43:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 874E4400CD
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 21:43:02 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id u24so18003780eds.11
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 13:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=h+Fw3dWQatzsz4sm6fJRx08K1LSpJqcfd4K3RpHGprk=;
 b=nE+Y6QLIl0YitLu0fIlgoxf8mYVRbTrJRfP3Z2KugxxIdTzIhwKSrCkRKo2L6hxksf
 214hh/YvhtyEhI0KPl0WGCZGAQHwDNq4gUaYtJbDesO3mhB8iAfRg202lQovTh75BnnA
 d9dLadqGqdADUEDVAye/RpZhZHKM+GQbfmkUTLK57WI0dMFQdH/ovzqqbP1Hah4dpPo9
 guT/0kpkGd9Fo76ahX/L13h8otMi0BkJAkgUVmcvAjSzpSi5G3yU18nwTuntgCAKIA6w
 ZvX2PYkAvnwHAI8uaRG3DtJLZOYCgzg8agej0Diy8Iwu6DG+kNo8tisCD9LZ6E2G89Id
 +Rhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=h+Fw3dWQatzsz4sm6fJRx08K1LSpJqcfd4K3RpHGprk=;
 b=ZiY5KhIp9Sms2L/eR0vfjielAZcZTS8s5rfA13t6tv+vqSlAMVnivfckQ+xa4sLA6V
 KF808YAs66Fddpj2OQWgtPYOw7XsC2796on4oE08Vr4CWRcbz5TphylEL7xO2BDenAZn
 KjFTF7yTBYVnjSN/hAZDQAKo4N0A8kjhqEzOQnXwbq/NoHIadUr83udtXvqMTUVbP7bF
 f+3/Ri4T632dFhWp1bWl+QxKFdMYMBjH+Y0T9gkD7ozjyn8v6yMuQQJsiQfmtL+GOFlk
 OI/ESAB+T+Y3kNm5JZjXWW5M0mAmwnHKl0y86QOH5JcSUWEwzSmcxYyEqk0zS0NToSuE
 e8jA==
X-Gm-Message-State: AOAM532VLXHbwS9XwAtD4fRJZIV5U8otRNYdfPJj3LjcxlJNjrHU1cNk
 eC87ybnjf3Ez79p+xOvWpq4G/fvPbrIFTZ9P
X-Google-Smtp-Source: ABdhPJxgba0I3A1KICClk0nsFQsLkCjmF1zZ0p9JKNwGi1WSLkZpChuatB77dK73PfmyFqpHu+o8Ow==
X-Received: by 2002:aa7:d9d1:: with SMTP id v17mr14006897eds.105.1643492580498; 
 Sat, 29 Jan 2022 13:43:00 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:eb68:2f00:88ae:3d08:e368:36])
 by smtp.googlemail.com with ESMTPSA id
 d2sm11514639ejw.79.2022.01.29.13.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 13:43:00 -0800 (PST)
From: Thomas Devoogdt <thomas.devoogdt@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Jan 2022 22:42:35 +0100
Message-Id: <20220129214235.5133-2-thomas.devoogdt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220129214235.5133-1-thomas.devoogdt@gmail.com>
References: <20220129214235.5133-1-thomas.devoogdt@gmail.com>
Subject: [Buildroot] [PATCH 2/2] package/libsoup: add choice between
 libsoup2 and libsoup3
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Libsoup3 has a new API [1], packages using libsoup2 may not
compile with libsoup3 or may crash at runtime in unexpected
ways. So the default will (for now) stay on libsoup2.
A tracking table for the migration can be found here [2].

Changes for libsoup3:
- "0001-meson.build-set-c_std-to-gnu99.patch" is upstream now [3].
- The "gnome" option was dropped in [4].
- A new "libnghttp2" dependency is added since libsoup 2.99.6 (HTTP2 backend) [5].

[1] https://libsoup.org/libsoup-3.0/ch02.html
[2] https://gitlab.gnome.org/GNOME/libsoup/-/issues/218
[3] https://gitlab.gnome.org/GNOME/libsoup/-/commit/5c3d431bdb094c59997f2a23e31e83f815ab667c
[4] https://gitlab.gnome.org/GNOME/libsoup/-/commit/3fcaa882c4eb29fd754cdb6dd06195632cb4b52a
[5] https://gitlab.gnome.org/GNOME/libsoup/-/commit/1a1d29c3114ca86c673d0c0b02a492d0962dcfe8

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
---
 .../0001-meson.build-set-c_std-to-gnu99.patch    |  0
 package/libsoup/Config.in                        | 16 ++++++++++++++++
 package/libsoup/libsoup.hash                     |  2 ++
 package/libsoup/libsoup.mk                       | 11 +++++++++++
 4 files changed, 29 insertions(+)
 rename package/libsoup/{ => 2.74.0}/0001-meson.build-set-c_std-to-gnu99.patch (100%)

diff --git a/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch b/package/libsoup/2.74.0/0001-meson.build-set-c_std-to-gnu99.patch
similarity index 100%
rename from package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
rename to package/libsoup/2.74.0/0001-meson.build-set-c_std-to-gnu99.patch
diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index 02e8e8b578..959ddedef5 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -16,8 +16,24 @@ config BR2_PACKAGE_LIBSOUP
 
 if BR2_PACKAGE_LIBSOUP
 
+choice
+	prompt "libsoup version"
+	default BR2_PACKAGE_LIBSOUP_VERSION_2
+	help
+	  Select the version of libsoup you wish to use.
+
+config BR2_PACKAGE_LIBSOUP_VERSION_3
+	select BR2_PACKAGE_NGHTTP2
+	bool "libsoup3"
+
+config BR2_PACKAGE_LIBSOUP_VERSION_2
+	bool "libsoup2"
+
+endchoice
+
 config BR2_PACKAGE_LIBSOUP_GNOME
 	bool "libsoup-gnome"
+	depends on BR2_PACKAGE_LIBSOUP_VERSION_2
 	help
 	  Build libsoup-gnome library.
 
diff --git a/package/libsoup/libsoup.hash b/package/libsoup/libsoup.hash
index 95c1c26eb4..6d87cc67e8 100644
--- a/package/libsoup/libsoup.hash
+++ b/package/libsoup/libsoup.hash
@@ -1,3 +1,5 @@
+# From https://ftp.gnome.org/pub/GNOME/sources/libsoup/3.0/libsoup-3.0.0.sha256sum
+sha256  cde05f3e20114ce985cbd03d575ff74e5e41e70a218e5eb3068c4bf4710dbf2b  libsoup-3.0.0.tar.xz
 # From https://ftp.gnome.org/pub/GNOME/sources/libsoup/2.74/libsoup-2.74.0.sha256sum
 sha256  33b1d4e0d639456c675c227877e94a8078d731233e2d57689c11abcef7d3c48e  libsoup-2.74.0.tar.xz
 # Locally calculated
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 1a26714992..bd8ce40643 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -4,8 +4,13 @@
 #
 ################################################################################
 
+ifeq ($(BR2_PACKAGE_LIBSOUP_VERSION_3),y)
+LIBSOUP_VERSION_MAJOR = 3.0
+LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).0
+else
 LIBSOUP_VERSION_MAJOR = 2.74
 LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).0
+endif
 LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
 LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
 LIBSOUP_LICENSE = LGPL-2.0+
@@ -55,10 +60,16 @@ else
 LIBSOUP_CONF_OPTS += -Dgssapi=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSOUP_VERSION_2),y)
 ifeq ($(BR2_PACKAGE_LIBSOUP_GNOME),y)
 LIBSOUP_CONF_OPTS += -Dgnome=true
 else
 LIBSOUP_CONF_OPTS += -Dgnome=false
 endif
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSOUP_VERSION_3),y)
+LIBSOUP_DEPENDENCIES += nghttp2
+endif
 
 $(eval $(meson-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

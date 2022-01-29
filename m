Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9791DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 21:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BBF440103;
	Sat, 29 Jan 2022 21:42:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8CD9zC3dl5zY; Sat, 29 Jan 2022 21:42:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AE59408A9;
	Sat, 29 Jan 2022 21:42:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F27D71BF4E3
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 21:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA9CC408A9
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 21:42:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 62-Iux6RzN-K for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 21:42:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88C0940895
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 21:42:49 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id w25so17299269edt.7
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 13:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=yqUcQ8zneo3QUg2Oe+xG+AarQ63SlUN4lxmrQaXPep0=;
 b=BGOTgq/M8eHylR72IyqyMxA9xkMeX4NlBaGFFcC1pbnAnTu+OvmZkCQNa0a6kY+pX+
 h9eBqoVVz+LS5TgkBWZrmAQ9fgoy+4RqCHPLnhODXwiIXc9vnuEuByUyx132fR38Mf+x
 l62acM4cSp0UQAZcwwQJSI7kQdcPlTnyr5MXLDpBW19lOVVdvnAgDvHJz3hAqZwEfr7u
 FCXxBiNOSzUgp9pA2sW/tFIfLzBTvT0HH0t1zbxY/or4dyc+rCLMkY5d1/iWQ5qxh5cF
 C0s2V4R32a9G8gjwf2hYl7SHG+EDkYGOg/2IFSRn29A72q/tkZyUHl4J+fkHzbAIyDQj
 fqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=yqUcQ8zneo3QUg2Oe+xG+AarQ63SlUN4lxmrQaXPep0=;
 b=qTf9Dafe134TVcczdCmetkQT+02H7VuKjPGfm4ZeVVoOgTVr7kuUi/5wJLP2TZqBx/
 rVyz0b08BPChhr8JKPsRZiyNSKclp7CIuYHJsW/HJRuU0FMq5N+xWHrqVBD9w/Uy9Xz+
 POAZcmmyQBifo6FN1/w9qi3E1MB+Dl438jfNF1A60Num5zHsg0Iv4uQVo4Al7fsuUBH0
 OjcimlmYX+GzdS61PRfkfRN0ZL66nsHYLZRg2nhCwjo73qIliVSH9rBltdLWHCyB4uNc
 9Esp0lyqh2ldcR3oy+BM7L36r3FxFOTyCZbLjs3Dx3foVKYQARSyKt+GajAi5buzOUKz
 znlA==
X-Gm-Message-State: AOAM533sAqKBy6F6HF0G3qpNEMvDaYDcTBgmomDZLrPi5WgQ79A1vlIh
 +nd7bZ7tlbPYPjH1HGy29VJX5NnHlNmZ+YAN
X-Google-Smtp-Source: ABdhPJwih2hmIi6kWNOB4w3nUOV2VuS7F2SQPaOH6nqNqIKCynln8LjI7oX8vrQzoCstaqghIGeZ5w==
X-Received: by 2002:a05:6402:4401:: with SMTP id
 y1mr14173343eda.215.1643492567257; 
 Sat, 29 Jan 2022 13:42:47 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:eb68:2f00:88ae:3d08:e368:36])
 by smtp.googlemail.com with ESMTPSA id
 d2sm11514639ejw.79.2022.01.29.13.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 13:42:46 -0800 (PST)
From: Thomas Devoogdt <thomas.devoogdt@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Jan 2022 22:42:34 +0100
Message-Id: <20220129214235.5133-1-thomas.devoogdt@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Buildroot] [PATCH 1/2] package/libglib2: bump version to 2.70.0
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

The internal_pcre option was dropped in:
https://gitlab.gnome.org/GNOME/glib/-/commit/9fbd7f3dc1f029b64b6991a540402b2bfa98de5c

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
---
 package/libglib2/0002-remove-cpp-requirement.patch | 2 +-
 package/libglib2/libglib2.hash                     | 4 ++--
 package/libglib2/libglib2.mk                       | 6 ++----
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/libglib2/0002-remove-cpp-requirement.patch b/package/libglib2/0002-remove-cpp-requirement.patch
index c402cbafa5..2f95228932 100644
--- a/package/libglib2/0002-remove-cpp-requirement.patch
+++ b/package/libglib2/0002-remove-cpp-requirement.patch
@@ -35,7 +35,7 @@ index 4bbf4c2..ac59f4e 100644
 @@ -1,4 +1,4 @@
 -project('glib', 'c', 'cpp',
 +project('glib', 'c',
-   version : '2.68.4',
+   version : '2.70.0',
    # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
    meson_version : '>= 0.49.2',
 @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index d421e025ff..580be3e08e 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.68/glib-2.68.4.sha256sum
-sha256  62fd061d08a75492617e625a73e2c05e259f831acbb8e1f8b9c81f23f7993a3b  glib-2.68.4.tar.xz
+# https://download.gnome.org/sources/glib/2.70/glib-2.70.0.sha256sum
+sha256  200d7df811c5ba634afbf109f14bb40ba7fde670e89389885da14e27c0840742  glib-2.70.0.tar.xz
 # License files, locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index af73aeb3bf..d3cba1a8bb 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.68
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
+LIBGLIB2_VERSION_MAJOR = 2.70
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
@@ -30,7 +30,6 @@ HOST_LIBGLIB2_CONF_OPTS = \
 	-Dselinux=disabled \
 	-Dsystemtap=false \
 	-Dxattr=false \
-	-Dinternal_pcre=false \
 	-Dtests=false \
 	-Doss_fuzz=disabled
 
@@ -52,7 +51,6 @@ HOST_LIBGLIB2_DEPENDENCIES = \
 # bogus installation path once combined with $(DESTDIR).
 LIBGLIB2_CONF_OPTS = \
 	-Dglib_debug=disabled \
-	-Dinternal_pcre=false \
 	-Dlibelf=disabled \
 	-Dgio_module_dir=/usr/lib/gio/modules \
 	-Dtests=false \
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

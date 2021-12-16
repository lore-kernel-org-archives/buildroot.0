Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F395C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 18:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3470961049;
	Thu, 16 Dec 2021 18:50:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R16QgY5ekza1; Thu, 16 Dec 2021 18:50:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68EBE6103B;
	Thu, 16 Dec 2021 18:50:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E77A51BF36F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E09A74017B
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:50:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kdtzxby1wffo for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 18:50:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C93240017
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 18:50:21 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id a18so45908602wrn.6
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 10:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wZA9x7rvfluy0OGBMWnan/M3ePodUBh9Ni7kWRyPR9U=;
 b=naV8k6Q47K3DfwFsBgARgJvoyqnRwBYilATGFTUT8cHz8DGUv1VsJ99OhRvI75Z/zU
 oKkBgJyQL0mUn6YOsBLLNPWszfrj7NYI3BjHFe+NQB45eCeSRO8+4SZYLFOqKXvu26vF
 7aA63Kz317CisTKqWhZyBdBDb5W9qg0uSAM1UBCQuWjICIat9Wq7NCEObe5u5cCzNZkz
 bZI5yHpqzJFgggMmJY1TWwJwj3m+N9tJerfMXJfqLzPxgfQBBENXjL+hVQzBCTNALj5h
 pOPGq0MQl7mLOW7luZjIRYdk6kvvJkImWeIr9BHZgV8AduPpSQAq01fTBsiCSQuVRDAI
 BnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wZA9x7rvfluy0OGBMWnan/M3ePodUBh9Ni7kWRyPR9U=;
 b=cIO6xn0fue46+no7w4IX4Jyj6l4foxdATmc5YX5FqO53ZZqkb0rbseU+Fs9kWEqcnP
 EXXS7FEuVrJ7iTMPiu6f8TbycfjmKGBmusCQuD7ZxXVCM9p3KI6ToIRA+/P9m8MR0zE2
 jQCaYcGXPU/sYISJr/tuHCIGFgTrsxALSy9lvUX+mi5gauzaWuMrD3nB4l/6ZihCfd5C
 RXrE20PPMedxz63cie8R5nFT5Ag3Mwkz+W2kK6EZ7hGXKRgWaQ/mNSY+BDJW9vDSkKox
 j5kVLfI/xIscpsGOL5gqTcYR5Me4AUW2ggJMPimk1LDOmNagMErpZL51+8fIiZSVVigP
 T67g==
X-Gm-Message-State: AOAM532gAPp2NYWk+Aoz0LeLSIqYwSXkKm55zLHi7EpRCX0q9OqQQWWN
 ds4PeFX3hybdAAue/DKa5XNgyvo6uyST5Q==
X-Google-Smtp-Source: ABdhPJwkhFfAV0T5MkVqSSTyh5urHzcVUddO0Aygv2THuossbfwMtd9kaYafV35hFi14dQV5n0/meA==
X-Received: by 2002:a5d:60ce:: with SMTP id x14mr6870645wrt.149.1639680619173; 
 Thu, 16 Dec 2021 10:50:19 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id b197sm5309964wmb.24.2021.12.16.10.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 10:50:18 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 19:49:43 +0100
Message-Id: <20211216184943.580682-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libqmi: fix build with help2man
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised with help2man since bump to
version 1.30.0 in commit 50c5495f81d3418a0f63fc642dc6beb41cd316e0:

FAILED: docs/man/qmicli.1
/usr/bin/help2man --output=docs/man/qmicli.1 '--name=Control QMI devices' '--help-option="--help-all"' /home/peko/autobuild/instance-1/output-1/build/libqmi-1.30.2/build/src/qmicli/qmicli
help2man: can't get `"--help-all"' info from /home/peko/autobuild/instance-1/output-1/build/libqmi-1.30.2/build/src/qmicli/qmicli
Try `--no-discard-stderr' if option outputs to stderr

Fixes:
 - http://autobuild.buildroot.org/results/15818b6de7378cd75c59b1d6dc732ed9a20c092a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...add-an-option-to-not-build-man-pages.patch | 65 +++++++++++++++++++
 package/libqmi/libqmi.mk                      |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 package/libqmi/0001-build-add-an-option-to-not-build-man-pages.patch

diff --git a/package/libqmi/0001-build-add-an-option-to-not-build-man-pages.patch b/package/libqmi/0001-build-add-an-option-to-not-build-man-pages.patch
new file mode 100644
index 0000000000..d9053de537
--- /dev/null
+++ b/package/libqmi/0001-build-add-an-option-to-not-build-man-pages.patch
@@ -0,0 +1,65 @@
+From 295b75e9c8dc895e281e36b1e8121d09fd556af0 Mon Sep 17 00:00:00 2001
+From: Aleksander Morgado <aleksander@aleksander.es>
+Date: Wed, 3 Nov 2021 10:57:51 +0100
+Subject: [PATCH] build: add an option to not build man pages
+
+When cross-compiling, the compiled binaries cannot be run on the build
+machine, unless one defines a helper (e.g. qemu) in the meson
+configuration, which is most of the time undesirable.
+
+If help2man is installed on the build machine, then the build would fail
+because of this, so add an option to disable generating the man pages.
+
+With later versions of meson, it will be possible to automatically
+detect this condition.
+
+Based on the same fix done in libmbim by Nicolas Cavallari, see
+https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/commit/792af73ea90e9689703ab526dd444fdb1c2f8e40
+
+Fixes https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/issues/75
+
+[Retrieved (and backported) from:
+https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/commit/295b75e9c8dc895e281e36b1e8121d09fd556af0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson.build       | 8 +++++++-
+ meson_options.txt | 1 +
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index e88b43a1..c7312146 100644
+--- a/meson.build
++++ b/meson.build
+@@ -223,8 +223,8 @@ if enable_gtk_doc
+   subdir('docs/reference/libqmi-glib')
+ endif
+ 
+-help2man = find_program('help2man', required: false)
+-if help2man.found()
++enable_man = get_option('man')
++if enable_man
+   subdir('docs/man')
+ endif
+ 
+@@ -237,6 +242,7 @@ summary({
+ output += '    Documentation:         ' + enable_gtk_doc.to_string() + '\n'
+ output += '    bash completion:       ' + enable_bash_completion.to_string() + '\n'
+ output += '    gobject introspection: ' + enable_gir.to_string() + '\n\n'
++output += '    man pages:             ' + enable_man.to_string() + '\n\n'
+ output += '  System paths\n'
+ output += '    prefix:                ' + qmi_prefix + '\n'
+ output += '    udev base directory:   ' + qmi_username + '\n\n'
+diff --git a/meson_options.txt b/meson_options.txt
+index 4d4f913d..bee5daac 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -16,5 +16,6 @@ option('udevdir', type: 'string', value: '', description: 'where udev base direc
+ 
+ option('introspection', type: 'boolean', value: 'auto', description: 'build introspection support')
+ option('gtk_doc', type: 'boolean', value: false, description: 'use gtk-doc to build documentation')
++option('man', type: 'boolean', value: 'true', description: 'build man pages using help2man')
+ 
+ option('bash_completion', type: 'boolean', value: true, description: 'install bash completion files')
+-- 
+GitLab
+
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index cd2c2719f9..a4839f1efb 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -12,6 +12,7 @@ LIBQMI_CPE_ID_VENDOR = libqmi_project
 LIBQMI_INSTALL_STAGING = YES
 
 LIBQMI_DEPENDENCIES = libglib2
+LIBQMI_CONF_OPTS = -Dman=false
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 LIBQMI_DEPENDENCIES += gobject-introspection
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

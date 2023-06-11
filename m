Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4974C7EE2E
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 12:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F8B94161A;
	Sun, 11 Jun 2023 12:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F8B94161A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q5hnkFITu80M; Sun, 11 Jun 2023 12:29:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E3D341621;
	Sun, 11 Jun 2023 12:29:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E3D341621
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC2BD1BF403
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 12:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5E264012D
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 12:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5E264012D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TJ-q1ZHzvTex for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 12:29:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B73C400D3
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B73C400D3
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 12:29:06 +0000 (UTC)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
 by mailout04.t-online.de (Postfix) with SMTP id CD4F52150A;
 Sun, 11 Jun 2023 14:29:03 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd74.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q8KBq-0eGq4v0; Sun, 11 Jun 2023 14:29:02 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:34948)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q8KBq-0001P1-0f;
 Sun, 11 Jun 2023 14:29:02 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 14:29:02 +0200
Message-Id: <20230611122902.372821-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686486542-317F9CD8-1D06634F/0/0 CLEAN NORMAL
X-TOI-MSGID: 7cda22cf-d803-49ab-973e-94440b722f29
Subject: [Buildroot] [PATCH v2 1/1] package/python-pyicu: fix build
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/977/977c043615603dd3541e23b81c5f11374606aff6/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Again I was unable to register on the upstream gitlab instance so I sent
the patch by mail to the author.

v2: prefer pkg-config (Yann), as proposed
    https://patchwork.ozlabs.org/project/buildroot/patch/20230516173411.823978-1-bernd.kuhls@t-online.de/

 ...001-Try-pkg-config-before-icu-config.patch | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 package/python-pyicu/0001-Try-pkg-config-before-icu-config.patch

diff --git a/package/python-pyicu/0001-Try-pkg-config-before-icu-config.patch b/package/python-pyicu/0001-Try-pkg-config-before-icu-config.patch
new file mode 100644
index 0000000000..4f6b86ffd3
--- /dev/null
+++ b/package/python-pyicu/0001-Try-pkg-config-before-icu-config.patch
@@ -0,0 +1,79 @@
+From ba717b8726e9bbf59b7fb4c851e886564b9888f7 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Tue, 30 May 2023 20:12:03 +0200
+Subject: [PATCH] Try pkg-config before icu-config
+
+In cross-compile setups the host version of the deprecated icu-config
+script can accidentally be picked up so try pkg-config first.
+
+Upstream: sent by mail to the author
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ setup.py | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 164324e..f1229e1 100644
+--- a/setup.py
++++ b/setup.py
+@@ -89,12 +89,12 @@ try:
+     ICU_VERSION = os.environ['ICU_VERSION']
+ except:
+     try:
+-        ICU_VERSION = check_output(('icu-config', '--version')).strip()
+-        CONFIGURE_WITH_ICU_CONFIG[platform] = True
++        ICU_VERSION = check_output(('pkg-config', '--modversion', 'icu-i18n')).strip()
++        CONFIGURE_WITH_PKG_CONFIG[platform] = True
+     except:
+         try:
+-            ICU_VERSION = check_output(('pkg-config', '--modversion', 'icu-i18n')).strip()
+-            CONFIGURE_WITH_PKG_CONFIG[platform] = True
++            ICU_VERSION = check_output(('icu-config', '--version')).strip()
++            CONFIGURE_WITH_ICU_CONFIG[platform] = True
+         except:
+             raise RuntimeError('''
+ Please install pkg-config on your system or set the ICU_VERSION environment
+@@ -181,7 +181,9 @@ if 'PYICU_CFLAGS' in os.environ:
+ else:
+     _cflags = CFLAGS[platform]
+     try:
+-        if CONFIGURE_WITH_ICU_CONFIG[platform]:
++        if CONFIGURE_WITH_PKG_CONFIG[platform]:
++            configure_with_pkg_config(_cflags, ('--cflags',), 'CFLAGS')
++        elif CONFIGURE_WITH_ICU_CONFIG[platform]:
+             try:
+                 configure_with_icu_config(
+                     _cflags, ('--cxxflags', '--cppflags'), 'CFLAGS')
+@@ -190,8 +192,6 @@ else:
+                     configure_with_pkg_config(_cflags, ('--cflags',), 'CFLAGS')
+                 else:
+                     raise
+-        elif CONFIGURE_WITH_PKG_CONFIG[platform]:
+-            configure_with_pkg_config(_cflags, ('--cflags',), 'CFLAGS')
+     except:
+         if not _cflags:
+             raise RuntimeError('''
+@@ -218,7 +218,9 @@ if 'PYICU_LFLAGS' in os.environ:
+ else:
+     _lflags = LFLAGS[platform]
+     try:
+-        if CONFIGURE_WITH_ICU_CONFIG[platform]:
++        if CONFIGURE_WITH_PKG_CONFIG[platform]:
++            configure_with_pkg_config(_lflags, ('--libs',), 'LFLAGS')
++        elif CONFIGURE_WITH_ICU_CONFIG[platform]:
+             try:
+                 configure_with_icu_config(_lflags, ('--ldflags',), 'LFLAGS')
+             except:
+@@ -226,8 +228,6 @@ else:
+                     configure_with_pkg_config(_lflags, ('--libs',), 'LFLAGS')
+                 else:
+                     raise
+-        elif CONFIGURE_WITH_PKG_CONFIG[platform]:
+-            configure_with_pkg_config(_lflags, ('--libs',), 'LFLAGS')
+     except:
+         if not _lflags:
+             raise RuntimeError('''
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

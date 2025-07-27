Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22ABEC87FCE
	for <buildroot@archiver.kernel.org>; Sun, 27 Jul 2025 20:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C897B40638;
	Sun, 27 Jul 2025 20:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYjZzmof3Rvi; Sun, 27 Jul 2025 20:41:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB94F406C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB94F406C7;
	Sun, 27 Jul 2025 20:41:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 495471BE
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 20:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FD7B60B57
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 20:41:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rpCfA1nFnYSR for <buildroot@buildroot.org>;
 Sun, 27 Jul 2025 20:41:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.117;
 helo=smtpcmd11117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B65996115E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B65996115E
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B65996115E
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 20:41:03 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id g8B3uHFSotr9dg8B3uzJlT; Sun, 27 Jul 2025 22:41:01 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 27 Jul 2025 22:41:00 +0200
Message-Id: <20250727204100.170031-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfI811z8N0AufgOXUgmRKwEb//vlwaq1kdKB4KLAtgF3hMuUEvAPjOORi3+EcP7Zaz4ZY/y4dW2f1frdJn4vO8lYXHiVnvSj00kY20A0eRAUffkOvcuPd
 68wgwkz/+LVHMh7u+MrkxNymb831AgoPHoW0sRR1uA0LEsZmUJJpQn1t5UU3MkJgeNwbvoNhEQ44tTeQTUiKxX9nMDYNzDM8rzkXqz1ptp2gDCE7H+o92KF2
 afYunwAE/DvPJb9yl+0cjuFMl1aCqT1KPDEfYT0ifHA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1753648861; bh=GmBjO7l5e5zTQf6Kc0kbB9FeZ0K/iCbG4nPyFxE2OR0=;
 h=From:To:Subject:Date:MIME-Version;
 b=OEsJuGGDKhMkuX5GEuRJb5G7TpvtXzu/95bk42gz44n8Xtbt79c/azW/tDtovf3OH
 4/LPxqwYQEcxEDt08Y7S8VU5+rn8O2aESOucLeNeyDBkRJBnybksWxPzH7YsNHUwOy
 aX4Pvk7Y7NHDbSp9BjX8FND96f0h5KH+6eVvhr0DXJPDPxJLwhPeP1h1A1tw625PqH
 M/TjA0A0CMwlgz1qM+nOSeDiInPxzuawtOk5VGaSv7Ua3ilk6PwEB/IdvVobNNyte3
 ol5S/qav4ZiM1HklRpKAOoLJI91q/U/ZByYwyBi5DnYJ5lHKWHu/Shvq2XmH4CZEjN
 zStITwzhzvO5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=OEsJuGGD
Subject: [Buildroot] [PATCH] package/libnvme: bump to version 1.15
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

For release note, see:
https://github.com/linux-nvme/libnvme/releases/tag/v1.15

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0001-Make-examples-build-selectable.patch | 46 -------------------
 package/libnvme/libnvme.hash                  |  2 +-
 package/libnvme/libnvme.mk                    |  2 +-
 3 files changed, 2 insertions(+), 48 deletions(-)
 delete mode 100644 package/libnvme/0001-Make-examples-build-selectable.patch

diff --git a/package/libnvme/0001-Make-examples-build-selectable.patch b/package/libnvme/0001-Make-examples-build-selectable.patch
deleted file mode 100644
index d3f59a3240..0000000000
--- a/package/libnvme/0001-Make-examples-build-selectable.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 6c0b9ad7822d9e9c74b787914cb766d27a358258 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Tue, 20 May 2025 22:34:16 +0200
-Subject: [PATCH] Make examples build selectable
-
-Sometimes we don't need to build examples and increase some dependency we
-don't have(i.e. bits/pthreadtypes.h in musl) so let's add examples option
-true by default.
-
-Upstream: https://github.com/linux-nvme/libnvme/pull/1014
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- meson.build       | 4 +++-
- meson_options.txt | 1 +
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 279245ac..4d819178 100644
---- a/meson.build
-+++ b/meson.build
-@@ -282,7 +282,9 @@ subdir('libnvme')
- if get_option('tests')
-     subdir('test')
- endif
--subdir('examples')
-+if get_option('examples')
-+    subdir('examples')
-+endif
- subdir('doc')
- 
- ################################################################################
-diff --git a/meson_options.txt b/meson_options.txt
-index 051b4ae5..48a93dae 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -6,6 +6,7 @@ option('rstdir', type : 'string', value : '', description : 'directory for ReST
- 
- option('docs', type : 'combo', choices : ['false', 'html', 'man', 'rst', 'all'], description : 'install documentation')
- option('docs-build', type : 'boolean', value : false,  description : 'build documentation')
-+option('examples', type : 'boolean', value : true, description : 'build examples')
- option('tests', type : 'boolean', value : true, description : 'build tests')
- 
- option('python', type : 'feature', value: 'auto', description : 'Generate libnvme python bindings')
--- 
-2.39.5
-
diff --git a/package/libnvme/libnvme.hash b/package/libnvme/libnvme.hash
index ae2c478ebc..a57a5b3958 100644
--- a/package/libnvme/libnvme.hash
+++ b/package/libnvme/libnvme.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  a7230d6d4959f26cf0c0ef6c9bb479bd94a8c0ec738bf6e164d66c3dc6397e66  libnvme-1.14.tar.gz
+sha256  c21cd9379390bdc52c9d9569a241274f8115fc247b76a5d922d639f48c8174a2  libnvme-1.15.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
index b69e9257cf..b576feb1ab 100644
--- a/package/libnvme/libnvme.mk
+++ b/package/libnvme/libnvme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNVME_VERSION = 1.14
+LIBNVME_VERSION = 1.15
 LIBNVME_SITE = $(call github,linux-nvme,libnvme,v$(LIBNVME_VERSION))
 LIBNVME_LICENSE = LGPL-2.1
 LIBNVME_LICENSE_FILES = COPYING
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C62C83F26
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 23:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B63241105;
	Mon, 28 Jul 2025 23:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N4GQuus-Fp2O; Mon, 28 Jul 2025 23:19:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3470C410FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3470C410FB;
	Mon, 28 Jul 2025 23:19:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B501615C
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 23:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6941410FB
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 23:18:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SvGhBLQxUe0k for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 23:18:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E73A4410FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E73A4410FA
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 23:18:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D33F286C50; Mon, 28 Jul 2025 23:18:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Jul 2025 01:17:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 034cd35fb4908f3df8a1d726df48cd04abf1e0fd
X-Git-Newrev: d08c30697b4eb62f20a50a512f354ea456d71ed0
X-Patchwork-Hint: ignore
Message-Id: <20250728231857.D33F286C50@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnvme: bump to version 1.15
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d08c30697b4eb62f20a50a512f354ea456d71ed0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
https://github.com/linux-nvme/libnvme/releases/tag/v1.15

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Make-examples-build-selectable.patch      | 46 ----------------------
 package/libnvme/libnvme.hash                       |  2 +-
 package/libnvme/libnvme.mk                         |  2 +-
 3 files changed, 2 insertions(+), 48 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

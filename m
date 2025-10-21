Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA68CCD1A5
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 19:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3067580C71;
	Tue, 21 Oct 2025 19:39:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aP2xU6FJFvkk; Tue, 21 Oct 2025 19:39:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D55980C74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D55980C74;
	Tue, 21 Oct 2025 19:39:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 150B243F
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 19:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 123D580C71
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 19:39:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pbJE5-UerFey for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 19:39:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 401F880C52
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 401F880C52
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 19:39:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C84B876EE; Tue, 21 Oct 2025 19:39:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Oct 2025 21:34:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72c7d99e22eb7706e413992cf7084438fea657bb
X-Git-Newrev: 0ec4649c16d8347c82892faec853f21184e374b0
X-Patchwork-Hint: ignore
Message-Id: <20251021193904.1C84B876EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dovecot: Fix build with icu 76.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ec4649c16d8347c82892faec853f21184e374b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit dcee99507c6767230fd1faeeefe95f5662eb03a3 bumped icu
from version 73-2 to 77-1 causing a build error during linking.

Upstream is not expected to backport this patch to 2.3.x:
https://dovecot.org/mailman3/archives/list/dovecot@dovecot.org/thread/VT7D6XWB5ZRL7KIER445D3JR464CALPU/

Fixes:
https://autobuild.buildroot.org/results/94fc2de03b5d6afd32c457be7faf0ac06cc37212/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...002-configure-Explicitly-check-for-icu-uc.patch | 28 ++++++++++++++++++++++
 package/dovecot/dovecot.mk                         |  4 ++++
 2 files changed, 32 insertions(+)

diff --git a/package/dovecot/0002-configure-Explicitly-check-for-icu-uc.patch b/package/dovecot/0002-configure-Explicitly-check-for-icu-uc.patch
new file mode 100644
index 0000000000..ea9aecebde
--- /dev/null
+++ b/package/dovecot/0002-configure-Explicitly-check-for-icu-uc.patch
@@ -0,0 +1,28 @@
+From 1ccd5b54a408d12fce0c94ab0bbaedbb5ef69830 Mon Sep 17 00:00:00 2001
+From: fundawang <fundawang@yeah.net>
+Date: Sun, 27 Oct 2024 22:11:21 +0800
+Subject: [PATCH] configure: Explicitly check for icu-uc
+
+Ensure we link against libicu-uc when it's split in v76.
+
+Upstream: https://github.com/dovecot/core/commit/1ccd5b54a408d12fce0c94ab0bbaedbb5ef69830
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Bernd: backported to version 2.3.21.1]
+---
+ m4/want_icu.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/m4/want_icu.m4 b/m4/want_icu.m4
+index b656ef9f479..405a73b361f 100644
+--- a/m4/want_icu.m4
++++ b/m4/want_icu.m4
+@@ -1,7 +1,7 @@
+ AC_DEFUN([DOVECOT_WANT_ICU], [
+   if test "$want_icu" != "no"; then
+     if test "$PKG_CONFIG" != "" && $PKG_CONFIG --exists icu-i18n 2>/dev/null; then
+-      PKG_CHECK_MODULES(LIBICU, icu-i18n)
++      PKG_CHECK_MODULES(LIBICU, icu-i18n icu-uc)
+       have_icu=yes
+       AC_DEFINE(HAVE_LIBICU,, [Define if you want ICU normalization support for FTS])
+     elif test "$want_icu" = "yes"; then
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index a48cd7536d..6612787a94 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -12,7 +12,11 @@ DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
 DOVECOT_LICENSE_FILES = COPYING COPYING.LGPL COPYING.MIT
 DOVECOT_CPE_ID_VENDOR = dovecot
 DOVECOT_SELINUX_MODULES = dovecot
+DOVECOT_AUTORECONF = YES
+
+# add host-gettext for AM_ICONV macro needed for autoreconf
 DOVECOT_DEPENDENCIES = \
+	host-gettext \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

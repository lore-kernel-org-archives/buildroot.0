Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC64CC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 13:58:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABB4060E76
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 13:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABB4060E76
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CB6640273;
	Sun,  5 Sep 2021 13:58:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wLtnYqea6pgv; Sun,  5 Sep 2021 13:58:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79E6A40253;
	Sun,  5 Sep 2021 13:58:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10E911BF57B
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 13:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3D1F80EFC
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 13:57:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VA3rruYGJSad for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 13:57:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 356B980F5F
 for <buildroot@buildroot.org>; Sun,  5 Sep 2021 13:57:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 17C6C88597; Sun,  5 Sep 2021 13:56:18 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 5 Sep 2021 15:56:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27cf1f659a433476a3c381d4883be533666965de
X-Git-Newrev: d0fb6778d3eb988843ea747facaa56551a35b00a
X-Patchwork-Hint: ignore
Message-Id: <20210905135618.17C6C88597@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsoup: bump to version 2.74.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d0fb6778d3eb988843ea747facaa56551a35b00a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch | 4 ++--
 package/libsoup/libsoup.hash                              | 4 ++--
 package/libsoup/libsoup.mk                                | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch b/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
index 5a85e05de7..f2e8f7701d 100644
--- a/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
+++ b/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
@@ -26,8 +26,8 @@ diff --git a/meson.build b/meson.build
 index 4dfd8c15..a5ebc63a 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -3,7 +3,7 @@ project('libsoup', 'c',
-         version: '2.72.0',
+@@ -2,6 +2,6 @@ project('libsoup', 'c',
+         version: '2.74.0',
          meson_version : '>= 0.50',
          license : 'LGPL2',
 -        default_options : 'c_std=c99')
diff --git a/package/libsoup/libsoup.hash b/package/libsoup/libsoup.hash
index 01bf419563..95c1c26eb4 100644
--- a/package/libsoup/libsoup.hash
+++ b/package/libsoup/libsoup.hash
@@ -1,4 +1,4 @@
-# From https://ftp.gnome.org/pub/GNOME/sources/libsoup/2.72/libsoup-2.72.0.sha256sum
-sha256  170c3f8446b0f65f8e4b93603349172b1085fb8917c181d10962f02bb85f5387  libsoup-2.72.0.tar.xz
+# From https://ftp.gnome.org/pub/GNOME/sources/libsoup/2.74/libsoup-2.74.0.sha256sum
+sha256  33b1d4e0d639456c675c227877e94a8078d731233e2d57689c11abcef7d3c48e  libsoup-2.74.0.tar.xz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 964488f430..a8b4cf12bb 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSOUP_VERSION_MAJOR = 2.72
+LIBSOUP_VERSION_MAJOR = 2.74
 LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).0
 LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
 LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

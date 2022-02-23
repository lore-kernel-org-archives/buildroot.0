Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5B6C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 15:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1386408D9;
	Wed, 23 Feb 2022 15:21:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q8KnfJYbaSvz; Wed, 23 Feb 2022 15:20:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D86944022C;
	Wed, 23 Feb 2022 15:20:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 387C41BF83B
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 15:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27B67415BF
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 15:20:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0rui2jYthUJ4 for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 15:20:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C69D415BC
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 15:20:45 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout05.t-online.de (Postfix) with SMTP id 10DD9CAD6;
 Wed, 23 Feb 2022 16:20:43 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.196.238]) by fwd83.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nMtRY-0zpWoj0; Wed, 23 Feb 2022 16:20:40 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:44820)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nMtRY-0001Qx-7a;
 Wed, 23 Feb 2022 16:20:40 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed, 23 Feb 2022 16:20:40 +0100
Message-Id: <20220223152040.188210-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223152040.188210-1-bernd.kuhls@t-online.de>
References: <20220223152040.188210-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1645629640-0000EDC4-F9CB01C1/0/0 CLEAN NORMAL
X-TOI-MSGID: b081391c-9b7d-48b0-9dcb-4a8455faa75b
Subject: [Buildroot] [PATCH/next 2/2] package/libva-utils: bump version to
 2.14.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/intel/libva-utils/releases/tag/2.14.0

Upstream does not provide a tarball so switch to github helper.
Switch build system to meson to avoid autoreconf.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva-utils/libva-utils.hash | 4 +---
 package/libva-utils/libva-utils.mk   | 7 +++----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index 18a078dc1c..5f21af800e 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,5 +1,3 @@
-# From https://github.com/intel/libva-utils/releases/download/2.13.0/libva-utils-2.13.0.tar.bz2.sha1sum
-sha1  7ab945cf232387f762891f9e4f7a6cb41e0766e8  libva-utils-2.13.0.tar.bz2
 # Locally computed
-sha256  db3ae0bd63c2a3f6ef498450c29ffc99c387ce611e1eb5db6a8da1f88845d612  libva-utils-2.13.0.tar.bz2
+sha256  0ad6410aaa27d7b15dadee0f4d775d54d6394b582bf315353a4657b49c78ac31  libva-utils-2.14.0.tar.gz
 sha256  c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index e6e31df8bd..4c527a748c 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 2.13.0
-LIBVA_UTILS_SOURCE = libva-utils-$(LIBVA_UTILS_VERSION).tar.bz2
-LIBVA_UTILS_SITE = https://github.com/intel/libva-utils/releases/download/$(LIBVA_UTILS_VERSION)
+LIBVA_UTILS_VERSION = 2.14.0
+LIBVA_UTILS_SITE = $(call github,intel,libva-utils,$(LIBVA_UTILS_VERSION))
 LIBVA_UTILS_LICENSE = MIT
 LIBVA_UTILS_LICENSE_FILES = COPYING
 LIBVA_UTILS_DEPENDENCIES = host-pkgconf libva
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

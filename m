Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813E5E82CC7
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 19:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CF5540228;
	Wed, 27 Sep 2023 19:12:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CF5540228
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UlMFaN63nAR6; Wed, 27 Sep 2023 19:12:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0825D4027D;
	Wed, 27 Sep 2023 19:12:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0825D4027D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A741A1BF32A
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EA814240E
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:12:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EA814240E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oet14qleTn_6 for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 19:12:22 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CDD14027D
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 19:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CDD14027D
Received: from fli4l.lan.fli4l (p4fd6c587.dip0.t-ipconnect.de [79.214.197.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0B3B0A4C0A0F;
 Wed, 27 Sep 2023 21:12:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47958)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qlZxK-0006UG-2J;
 Wed, 27 Sep 2023 21:12:18 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 21:12:18 +0200
Message-Id: <20230927191218.1167211-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695841939;
 bh=O51OGGl1uYypP1lkj8gtWVl+wV9FtUg4sefIyl6HlIY=;
 h=From:To:Cc:Subject:Date:From;
 b=FciJiG5NmBQrG131wdmDRkjW0gv3KacWW4/JIoKKeGWErLP8L9grwvo6pvDFNxm5D
 QrYOK2ddAb5jdbIJQuAsWZWHQTGIwsY/tpAVi5srxyO8OXL1MZCBPphO6ays+KU1Oi
 UBsi84KXaD3GIF+cTccxdIUakNmEZb1SiNttQQlOt0M6kFqXd02iuXqYzHqPaK/jfH
 ejZ1v5+6AcPxuKCscAVupXyhye+ImEUdug3Wcy/wb/Gw3Dd3wQvo7vkONWlCmbnd/a
 U+ZrOkrz1Z25HqJfbX9pFlmrn6GPOr93g0VaQrlmPgbkQcyTgNS0oDQ08itAk2Vs0t
 Tq3z037Fs7QJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=FciJiG5N
Subject: [Buildroot] [PATCH 1/1] package/gettext-gnu: bump version to 0.22.2
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
Cc: Vadim Kochan <vadim4j@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://git.savannah.gnu.org/gitweb/?p=gettext.git;a=blob;f=NEWS;h=35f2a2f82c7da4764b73617f45b8faa6c8d7e9c3;hb=775d1d26a8f72214834ef4d399bad4690b7a604c

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gettext-gnu/gettext-gnu.hash   | 5 +----
 package/gettext-gnu/gettext-gnu.mk     | 2 +-
 package/gettext-tiny/gettext-tiny.hash | 4 +---
 package/gettext-tiny/gettext-tiny.mk   | 2 +-
 4 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/package/gettext-gnu/gettext-gnu.hash b/package/gettext-gnu/gettext-gnu.hash
index b4ec27642c..878253bea4 100644
--- a/package/gettext-gnu/gettext-gnu.hash
+++ b/package/gettext-gnu/gettext-gnu.hash
@@ -1,8 +1,5 @@
 # Please keep in sync with package/gettext-tiny/gettext-tiny.hash
-# From https://lists.gnu.org/archive/html/info-gnu/2023-06/msg00003.html
-sha1  d9666d3b9c47a84c814d32e76fa75f60ec23756f  gettext-0.22.tar.xz
-
 # Locally calculated
-sha256  0e60393a47061567b46875b249b7d2788b092d6457d656145bb0e7e6a3e26d93  gettext-0.22.tar.xz
+sha256  4c82fbfe5e53d71a97c634aa98a898b9da807b08b27410f6a4641e8bb44dc4b2  gettext-0.22.2.tar.xz
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
 sha256  3fe5361f24b7c49ba12911c08f5a33f9cb18871d95d9fb881f5b8a4793e04288  gettext-runtime/intl/COPYING.LIB
diff --git a/package/gettext-gnu/gettext-gnu.mk b/package/gettext-gnu/gettext-gnu.mk
index 271d6ac57f..06ada568b1 100644
--- a/package/gettext-gnu/gettext-gnu.mk
+++ b/package/gettext-gnu/gettext-gnu.mk
@@ -6,7 +6,7 @@
 
 # Please keep in sync with GETTEXT_TINY_ARCHIVE_VERSION in
 # gettext-tiny/gettext-tiny.mk
-GETTEXT_GNU_VERSION = 0.22
+GETTEXT_GNU_VERSION = 0.22.2
 GETTEXT_GNU_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_GNU_SOURCE = gettext-$(GETTEXT_GNU_VERSION).tar.xz
 GETTEXT_GNU_INSTALL_STAGING = YES
diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
index f40e6274c0..02d9a803da 100644
--- a/package/gettext-tiny/gettext-tiny.hash
+++ b/package/gettext-tiny/gettext-tiny.hash
@@ -2,7 +2,5 @@
 sha256  29cc165e27e83d2bb3760118c2368eadab550830d962d758e51bd36eb860f383  gettext-tiny-0.3.2.tar.gz
 sha256  4c938aa3d8fa3c184bba5e87a8a2febc89560627c9d0567536879e3eca1a7b4f  LICENSE
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  extra/COPYING
-# From https://lists.gnu.org/archive/html/info-gnu/2023-06/msg00003.html
-sha1  d9666d3b9c47a84c814d32e76fa75f60ec23756f  gettext-0.22.tar.xz
 # Locally Computed:
-sha256  0e60393a47061567b46875b249b7d2788b092d6457d656145bb0e7e6a3e26d93  gettext-0.22.tar.xz
+sha256  4c82fbfe5e53d71a97c634aa98a898b9da807b08b27410f6a4641e8bb44dc4b2  gettext-0.22.2.tar.xz
diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index 234b974075..0aef4b0058 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -15,7 +15,7 @@ GETTEXT_TINY_PROVIDES = gettext
 
 # needed for gettextize
 # Please keep in sync with package/gettext-gnu/gettext-gnu.mk
-GETTEXT_TINY_ARCHIVE_VERSION = 0.22
+GETTEXT_TINY_ARCHIVE_VERSION = 0.22.2
 
 GETTEXT_TINY_EXTRA_GETTEXT_FILES = \
 	gettext-tools/misc/gettextize.in \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

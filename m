Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C556C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 21:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27C704174F;
	Mon,  4 Dec 2023 21:14:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27C704174F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1kC9wdoEVLeY; Mon,  4 Dec 2023 21:14:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1616A41750;
	Mon,  4 Dec 2023 21:14:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1616A41750
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D0B891BF30E
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B749660FBD
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B749660FBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YDqF5r0WYeoH for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 21:14:02 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C019A60B25
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 21:14:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C019A60B25
Received: from fli4l.lan.fli4l (p4fd6c4a5.dip0.t-ipconnect.de [79.214.196.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DFEAAA4C0C51;
 Mon,  4 Dec 2023 22:13:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33764)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rAGGN-0006hQ-27;
 Mon, 04 Dec 2023 22:13:59 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  4 Dec 2023 22:13:59 +0100
Message-Id: <20231204211359.12598-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1701724439;
 bh=Vdaw4SnK/MHD4jkuJCC7F5cAvd2kebhIz7yE48QVlI0=;
 h=From:To:Cc:Subject:Date:From;
 b=AZ8QBo1hsEesrnaXpEgKScKerN5a/HSn/YeibJQagRo7RDp1f3nnqJC0WLzCSPcn2
 D6sZMy68dmwkXc7h5n9pnyhMt+6TqI57oGxgDxlRh9DmirzVEy0qNaL2tQYTQsrfc8
 WsSCf02MECVY/HZB1d9Iv4WFOys2hCzb5UBK+V502EIIdwqpG/yqvKv8FYrYJ32V24
 KPjbSZuT0bukTHzNqb8ZOIYJdXkbo32JQIdR01IZEvTdUhxNI2q8g47Bi2U5wALkof
 N+MGU7Cpgs8kJM249tqqu2WuqwBIkqHXYoocH+tKgqVmkDLZ3cRQrFxprHJe8NhZVO
 9PkZyR3i85kNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=AZ8QBo1h
Subject: [Buildroot] [PATCH 1/1] package/gettext-gnu: bump version to 0.22.4
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
https://git.savannah.gnu.org/gitweb/?p=gettext.git;a=commitdiff;h=08f342937a09ce41977e8ceecc23509e4b330490

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gettext-gnu/gettext-gnu.hash   | 2 +-
 package/gettext-gnu/gettext-gnu.mk     | 2 +-
 package/gettext-tiny/gettext-tiny.hash | 2 +-
 package/gettext-tiny/gettext-tiny.mk   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gettext-gnu/gettext-gnu.hash b/package/gettext-gnu/gettext-gnu.hash
index f307b4a9fd..7c649843f4 100644
--- a/package/gettext-gnu/gettext-gnu.hash
+++ b/package/gettext-gnu/gettext-gnu.hash
@@ -1,5 +1,5 @@
 # Please keep in sync with package/gettext-tiny/gettext-tiny.hash
 # Locally calculated
-sha256  b838228b3f8823a6c1eddf07297197c4db13f7e1b173b9ef93f3f945a63080b6  gettext-0.22.3.tar.xz
+sha256  29217f1816ee2e777fa9a01f9956a14139c0c23cc1b20368f06b2888e8a34116  gettext-0.22.4.tar.xz
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
 sha256  3fe5361f24b7c49ba12911c08f5a33f9cb18871d95d9fb881f5b8a4793e04288  gettext-runtime/intl/COPYING.LIB
diff --git a/package/gettext-gnu/gettext-gnu.mk b/package/gettext-gnu/gettext-gnu.mk
index 35b79d1926..b7d0cf213c 100644
--- a/package/gettext-gnu/gettext-gnu.mk
+++ b/package/gettext-gnu/gettext-gnu.mk
@@ -6,7 +6,7 @@
 
 # Please keep in sync with GETTEXT_TINY_ARCHIVE_VERSION in
 # gettext-tiny/gettext-tiny.mk
-GETTEXT_GNU_VERSION = 0.22.3
+GETTEXT_GNU_VERSION = 0.22.4
 GETTEXT_GNU_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_GNU_SOURCE = gettext-$(GETTEXT_GNU_VERSION).tar.xz
 GETTEXT_GNU_INSTALL_STAGING = YES
diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
index a72b0c35e4..f7ed50b49f 100644
--- a/package/gettext-tiny/gettext-tiny.hash
+++ b/package/gettext-tiny/gettext-tiny.hash
@@ -3,4 +3,4 @@ sha256  29cc165e27e83d2bb3760118c2368eadab550830d962d758e51bd36eb860f383  gettex
 sha256  4c938aa3d8fa3c184bba5e87a8a2febc89560627c9d0567536879e3eca1a7b4f  LICENSE
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  extra/COPYING
 # Locally Computed:
-sha256  b838228b3f8823a6c1eddf07297197c4db13f7e1b173b9ef93f3f945a63080b6  gettext-0.22.3.tar.xz
+sha256  29217f1816ee2e777fa9a01f9956a14139c0c23cc1b20368f06b2888e8a34116  gettext-0.22.4.tar.xz
diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index e4a3625c5a..3fe8a781d9 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -15,7 +15,7 @@ GETTEXT_TINY_PROVIDES = gettext
 
 # needed for gettextize
 # Please keep in sync with package/gettext-gnu/gettext-gnu.mk
-GETTEXT_TINY_ARCHIVE_VERSION = 0.22.3
+GETTEXT_TINY_ARCHIVE_VERSION = 0.22.4
 
 GETTEXT_TINY_EXTRA_GETTEXT_FILES = \
 	gettext-tools/misc/gettextize.in \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

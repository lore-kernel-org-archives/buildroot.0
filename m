Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE3BC00528
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 17:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1827441681;
	Sun, 30 Jul 2023 17:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1827441681
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UOz2ZFbnD2xa; Sun, 30 Jul 2023 17:12:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE9AD41685;
	Sun, 30 Jul 2023 17:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE9AD41685
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E10A1BF3BC
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 17:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27B7760F08
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 17:12:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27B7760F08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2uNq2NdpFLIJ for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 17:12:48 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4AB3860B3B
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 17:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AB3860B3B
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B8307A4C0E76;
 Sun, 30 Jul 2023 19:12:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60884)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qQ9y4-00088q-1X;
 Sun, 30 Jul 2023 19:12:32 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 19:12:29 +0200
Message-Id: <20230730171232.3381097-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730171232.3381097-1-bernd@kuhls.net>
References: <20230730171232.3381097-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690737152;
 bh=LQxikGHPUQKsqu3umGKhOnNM8wgoOQRTCuAodJYkKPY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e8S65RKy05Gjkw1cFumW6gcdb81Ln2OhXfBE8MoiRcYJcvTsrwEkzpvEDwBvOhBK0
 TVctH3xkbfMYj0GQ9TdWDWEZ0Q25G9cRwgskNwVO5m0FebPWd88pt8cwMee0/dio2P
 lPHPRWqKpxnX72k43GkH6opECdQQoL73UAlPAKhF9NMmyrnzeA6crJxI7IrDsMeGgq
 oP1XCaIa12Shmi3ldnw85jV8k6+EAJEJb7/cEa40jVoRpNOt89xpcPyg3TuecF3D6y
 BgmnLD7CBx6fgOoKW/Xx8EP+QeOTZGooWu644ccGHkeSN12cjjj4HG+ljJ3chLhvPQ
 B+0sP5qP48k5g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=e8S65RKy
Subject: [Buildroot] [PATCH 2/5] package/spdlog: bump version to 1.12.0
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
Cc: Semyon Kolganov <semenak94@mail.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/gabime/spdlog/releases/tag/v1.12.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/spdlog/spdlog.hash | 2 +-
 package/spdlog/spdlog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spdlog/spdlog.hash b/package/spdlog/spdlog.hash
index af89ba4e84..a943abba2c 100644
--- a/package/spdlog/spdlog.hash
+++ b/package/spdlog/spdlog.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ca5cae8d6cac15dae0ec63b21d6ad3530070650f68076f3a4a862ca293a858bb  spdlog-1.11.0.tar.gz
+sha256  4dccf2d10f410c1e2feaff89966bfc49a1abb29ef6f08246335b110e001e09a9  spdlog-1.12.0.tar.gz
 sha256  a7241a379cb98d37788f82c2fc2e484c3ae85dae881fd3406f0637644850926f  LICENSE
diff --git a/package/spdlog/spdlog.mk b/package/spdlog/spdlog.mk
index 32a0265484..15a80edbd0 100644
--- a/package/spdlog/spdlog.mk
+++ b/package/spdlog/spdlog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPDLOG_VERSION = 1.11.0
+SPDLOG_VERSION = 1.12.0
 SPDLOG_SITE = $(call github,gabime,spdlog,v$(SPDLOG_VERSION))
 SPDLOG_LICENSE = MIT
 SPDLOG_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

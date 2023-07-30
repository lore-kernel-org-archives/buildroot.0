Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C0FC00528
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 17:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E980416BC;
	Sun, 30 Jul 2023 17:13:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E980416BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mPvwM78RssKB; Sun, 30 Jul 2023 17:13:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99362416D1;
	Sun, 30 Jul 2023 17:13:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99362416D1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB14F1BF3BC
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 17:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B597481761
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 17:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B597481761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SH9MDeJ6YUGf for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 17:13:24 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C81FC813BC
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 17:13:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C81FC813BC
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0D6A6A4C1077;
 Sun, 30 Jul 2023 19:12:33 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60884)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qQ9y4-00088q-2k;
 Sun, 30 Jul 2023 19:12:32 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 19:12:32 +0200
Message-Id: <20230730171232.3381097-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730171232.3381097-1-bernd@kuhls.net>
References: <20230730171232.3381097-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690737153;
 bh=UH1gB/jTcAGsComrBnfE1mT7MmjO8KNMbS3DfPOz4wo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rDyi+QHoIdOR1g4NTMOxqOz7FdyOtq4wbRIRDFA+++w18nZwoeA52MZsP4ZOtjgxj
 tVTHmGczfATczvcr1FLKDpr5YMBRs4HdoBQk+VKMKZpuDvWFSd9a5Hd+7UR5mluhoL
 +Dw7B/rXHInWAjferaYOV9SSESku5Rt2Jn5SRvRO6DeCwq3uLnMF2R4G0V1cqxR4oo
 eSHy3CJywQkG0fiyMzN9ScRH31f37xk6kqXHLxQEBZ1EHMKwREPRpE19mmpP8opGLD
 53cV3qUlE/NE70PY23GVBETCfNvLvinz3tiUsmcGP/GU6/8L+K6XuwHdrSbvoSE6LY
 UF0CoBVOFWTdQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=rDyi+QHo
Subject: [Buildroot] [PATCH 5/5] package/fmt: bump version to 10.0.0
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

Changelog: https://github.com/fmtlib/fmt/blob/master/ChangeLog.rst

Updated license hash due to upstream commit, no legal changes:
https://github.com/fmtlib/fmt/commit/48dfbcaa95f2043d29e3591ffd3090af4a5f33e2

This patch depends on bumping spdlog to version 1.12.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/fmt/fmt.hash | 4 ++--
 package/fmt/fmt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
index 65eeaa4ebe..279f071262 100644
--- a/package/fmt/fmt.hash
+++ b/package/fmt/fmt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cceb4cb9366e18a5742128cb3524ce5f50e88b476f1e54737a47ffdf4df4c996  fmt-9.1.0.zip
-sha256  825c9324e70f8c839c8ba910543dd4a7daee243b86ef960594c11381a19980b8  LICENSE.rst
+sha256  4943cb165f3f587f26da834d3056ee8733c397e024145ca7d2a8a96bb71ac281  fmt-10.0.0.zip
+sha256  07580f2a3b35709ce703d523f447b242f6dfec7582a8c0df102c7fa2849375f8  LICENSE.rst
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
index ed0703cbc9..f2c94b8231 100644
--- a/package/fmt/fmt.mk
+++ b/package/fmt/fmt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMT_VERSION = 9.1.0
+FMT_VERSION = 10.0.0
 FMT_SITE = https://github.com/fmtlib/fmt/releases/download/$(FMT_VERSION)
 FMT_SOURCE = fmt-$(FMT_VERSION).zip
 FMT_LICENSE = MIT with exception
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

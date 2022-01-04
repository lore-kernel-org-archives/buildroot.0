Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F093C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 13:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D23A78275C;
	Tue,  4 Jan 2022 13:34:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WXYmxFadHeBw; Tue,  4 Jan 2022 13:34:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27ED282725;
	Tue,  4 Jan 2022 13:34:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 927F31BF5F8
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 13:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8061060BE3
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 13:34:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XDKKv90R0KsT for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 13:34:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 86A5F60E64
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 13:34:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6C3EE183486; Tue,  4 Jan 2022 14:34:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1641303265; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=+nGyG+LKag6lQQPCGuw5hFkwX58jADkGJz4I87XxZBw=;
 b=c1yS7tJ0qZZ4Yz9/p70N1i3PpTrRz0Ijztf7FGhM4TnlY60iG2zxiehRUJZkNGgI3l8Zkp
 ZQATMiADQW+OWwrpnrH+PQDB7LOzynneazL1CDqNOpFVoW3i1fzXg7yn0WuVkW5sho7aQO
 C1CEHiOA2hjChVnZbY9fjKPzPqF9wRo=
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 14:34:03 +0100
Message-Id: <20220104133416.5185-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/json-for-modern-cpp: bump version to
 3.10.5
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

* Update License hash due to updated year

Fixes:
 - Make sure C++17 filesystem conversions are only used if the compiler supports it.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/json-for-modern-cpp/json-for-modern-cpp.hash | 4 ++--
 package/json-for-modern-cpp/json-for-modern-cpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.hash b/package/json-for-modern-cpp/json-for-modern-cpp.hash
index eb14d2fd6d..a193fa6d49 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.hash
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1155fd1a83049767360e9a120c43c578145db3204d2b309eba49fbbedd0f4ed3  json-3.10.4.tar.gz
-sha256  c983d69523377819db3c377b390d5644f5ec53bec9b7c4a0f1ed893bb743d045  LICENSE.MIT
+sha256  5daca6ca216495edf89d167f808d1d03c4a4d929cef7da5e10f135ae1540c7e4  json-3.10.5.tar.gz
+sha256  86b998c792894ccb911a1cb7994f7a9652894e7a094c0b5e45be2f553f45cf14  LICENSE.MIT
diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.mk b/package/json-for-modern-cpp/json-for-modern-cpp.mk
index 428473db5a..fd13ce1fd1 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.mk
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSON_FOR_MODERN_CPP_VERSION = 3.10.4
+JSON_FOR_MODERN_CPP_VERSION = 3.10.5
 JSON_FOR_MODERN_CPP_SOURCE = json-$(JSON_FOR_MODERN_CPP_VERSION).tar.gz
 JSON_FOR_MODERN_CPP_SITE = $(call github,nlohmann,json,v$(JSON_FOR_MODERN_CPP_VERSION))
 JSON_FOR_MODERN_CPP_LICENSE = MIT
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

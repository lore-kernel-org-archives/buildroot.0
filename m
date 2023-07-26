Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1464C001DF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 21:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25AE540BB3;
	Wed, 26 Jul 2023 21:15:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25AE540BB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xlBKoMNH8GNj; Wed, 26 Jul 2023 21:15:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CD1D4155E;
	Wed, 26 Jul 2023 21:15:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CD1D4155E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 576651BF423
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BB9840BCC
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:15:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BB9840BCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iljkP7V1Qy4a for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 21:15:46 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 381D640BB3
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 21:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 381D640BB3
Received: from fli4l.lan.fli4l (p54a1bcc1.dip0.t-ipconnect.de [84.161.188.193])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E5BF8A4C0BB8;
 Wed, 26 Jul 2023 23:15:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39774)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qOlqo-000828-2I;
 Wed, 26 Jul 2023 23:15:18 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 26 Jul 2023 23:15:18 +0200
Message-Id: <20230726211518.2205469-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230726211518.2205469-1-bernd@kuhls.net>
References: <20230726211518.2205469-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690406118;
 bh=iaikhPNf9sDBP63yG+n89do+HlHPahIEAlRjlPOIEEA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=maTcZnyoZezkUZaKGDOg287j7M3XPufJZaWjTvmi5TKpON4TvG65D8hj0sQFhNJgk
 9ISXC4r98IR5QiWOeu6ZgVmxDxmC9Gh9VIRO42w0rW5VLqUiHJ777pgE9uZGsGnEx4
 LRcwfJitbbfZFdIIdsq90FU7S5WvrDXzFhbzfiSqjoNpisLW10Lk4FJo4Oeqt/TQu1
 ovvQeJTGRddFx/HvJMmcW44JFW62ZcP+/DrbJopcm86UY30GtQsIbP1y+8dhmUovjA
 j6gAJ+SqM1mqJ1rRfy2EmCV0jUsxU6I/AUPzzOWD7pUpPvCbKALAvWEi3YdugJnA0F
 yVZrQdIVxavig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=maTcZnyo
Subject: [Buildroot] [PATCH 3/3] package/redis-plus-plus: bump version to
 1.3.10
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/sewenew/redis-plus-plus/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/redis-plus-plus/redis-plus-plus.hash | 2 +-
 package/redis-plus-plus/redis-plus-plus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis-plus-plus/redis-plus-plus.hash b/package/redis-plus-plus/redis-plus-plus.hash
index 93e58e2535..1d88365bc0 100644
--- a/package/redis-plus-plus/redis-plus-plus.hash
+++ b/package/redis-plus-plus/redis-plus-plus.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  a49a72fef26ed39d36a278fcc4e4d92822e111697b5992d8f26f70d16edc6c1f  redis-plus-plus-1.3.5.tar.gz
+sha256  85d9d9ff84c873c4a14bd28bee569a1f311285fad8d4f2fb0e472f65d4bb842a  redis-plus-plus-1.3.10.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/redis-plus-plus/redis-plus-plus.mk b/package/redis-plus-plus/redis-plus-plus.mk
index 4d1eb9361b..a286e2de33 100644
--- a/package/redis-plus-plus/redis-plus-plus.mk
+++ b/package/redis-plus-plus/redis-plus-plus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_PLUS_PLUS_VERSION = 1.3.5
+REDIS_PLUS_PLUS_VERSION = 1.3.10
 REDIS_PLUS_PLUS_SITE = $(call github,sewenew,redis-plus-plus,$(REDIS_PLUS_PLUS_VERSION))
 REDIS_PLUS_PLUS_LICENSE = Apache-2.0
 REDIS_PLUS_PLUS_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

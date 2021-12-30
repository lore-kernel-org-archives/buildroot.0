Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8434BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 09:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4F83405B2;
	Thu, 30 Dec 2021 09:40:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GbfCqbYW_WLu; Thu, 30 Dec 2021 09:40:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C33AC40530;
	Thu, 30 Dec 2021 09:40:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 236871BF346
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 09:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EF7040530
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 09:40:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uFyEsRAj3sHd for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 09:40:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B74C404B0
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 09:39:59 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id s1so49439454wrg.1
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 01:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=27Q1CtMnvtEHf/aRAE58yMQ8iONY5Txss/TtDdD0Jdg=;
 b=oqbe8Yk1KbcYxPuXfFg9RHMmVJH+MUQ7izJrPeNwUAQhhAzHm7pqAtzcvfgRSBTjE6
 oZMM0u8b5y133Eay9tWShvyfLZqo06c9l6rSMNRpW4AaknzxP9pYIy1/+5nqDha1id/l
 Rul5Ze+t1zU2vEHKk7O+X4jzrUEfFP2b5/hvdDh6ylJxTevSgrVZUJ6LzfXrdx8hW3Zu
 f8eHJ9oh0Bu7lX46RTQKQ5bbXJbWoke3zxMOI3qszYeXVqz9mmLAp4jO8+rbosSy1686
 F4frVdpFi8SOV8Hpkp7HXZVneXtzMFG2BrV/nFvlC2IT33N1+/2YVNkLFRu290Ixix3l
 tlIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=27Q1CtMnvtEHf/aRAE58yMQ8iONY5Txss/TtDdD0Jdg=;
 b=5+HJX0EUntOyOcVAtVssZl5SE+pW/+N5aVyYDQzn1/azPbVfMfD4Bi2d8ucx7HZt1h
 yCRZz7SGFoiE03ThAN6tYzxY5VUieQwmQGtF4VRaeu1ctGMnt936Z6LLLCL+uXB/eGut
 RYiGoU3Evp6Swd8Id/cwhZW6/mwMB4AoXwoXwURnfFdDMwU2eTYwALjrWWWBYhQRQm5c
 GU4ZskFvc+y5fo0HJCzHiwKDurPZNUoGpLSFnFsTC7cv5Dytj+KJo1o3g5i0OvlLg6Mz
 icTWYsfX1RuDpnmVka1xM9VpLGvNf/O0d4TTKVxAFj1jYAKpou7dWW9b4llIInUL0BQP
 1tqg==
X-Gm-Message-State: AOAM532p8WbwZt/Z3ufHraVGJONtUlToKk9IcQgyYgaFT3dialYl3D95
 qCKgnZ+rD2Aq59jiF9PGhp5TRKgk67s=
X-Google-Smtp-Source: ABdhPJzhLTbK+l9OAQZLnZ7vAxZPWfa0fneGpmwX8Rlq6IuQYUkV8Uy09OLlZ/5l+7S2We+71PUl0Q==
X-Received: by 2002:a05:6000:1ac9:: with SMTP id
 i9mr23679901wry.531.1640857198216; 
 Thu, 30 Dec 2021 01:39:58 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id l2sm23500494wru.83.2021.12.30.01.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 01:39:57 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 10:39:14 +0100
Message-Id: <20211230093914.1721137-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/libcli: bump to version 1.10.7
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
 Steve James <ste@junkomatic.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/dparrish/libcli/releases/tag/V1.10.5
https://github.com/dparrish/libcli/releases/tag/V1.10.6
https://github.com/dparrish/libcli/releases/tag/V1.10.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix tarball hash

 package/libcli/libcli.hash | 2 +-
 package/libcli/libcli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcli/libcli.hash b/package/libcli/libcli.hash
index a17a176fe5..a1a5459e9c 100644
--- a/package/libcli/libcli.hash
+++ b/package/libcli/libcli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  43efade6f3deb621e1e226b7854274a869fca57e12e74e61c5496d5dea7c445d  libcli-1.10.4.tar.gz
+sha256  179f78592f73492c22cc1b544b6f8cb0f6630a2f670430c118b8e084e6562e74  libcli-1.10.7.tar.gz
 sha256  376b54d4c5f4aa99421823fa4da93e3ab73096fce2400e89858632aa7da24a14  COPYING
diff --git a/package/libcli/libcli.mk b/package/libcli/libcli.mk
index 2dedc9d5df..a18daa911c 100644
--- a/package/libcli/libcli.mk
+++ b/package/libcli/libcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCLI_VERSION = 1.10.4
+LIBCLI_VERSION = 1.10.7
 LIBCLI_SITE = $(call github,dparrish,libcli,V$(LIBCLI_VERSION))
 LIBCLI_LICENSE = LGPL-2.1
 LIBCLI_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

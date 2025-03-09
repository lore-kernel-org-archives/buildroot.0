Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF84C28B2F
	for <buildroot@archiver.kernel.org>; Sun,  9 Mar 2025 16:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44499605D1;
	Sun,  9 Mar 2025 16:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JibUKm29q6_6; Sun,  9 Mar 2025 16:36:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 611336071B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 611336071B;
	Sun,  9 Mar 2025 16:36:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 564A6DC
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 16:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FAE56071C
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 16:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ERrpRoh-J_Es for <buildroot@buildroot.org>;
 Sun,  9 Mar 2025 16:36:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=114.111.35.38;
 helo=cvsmtppost29.nm.naver.com; envelope-from=dungeonlords789@naver.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 15B40605D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15B40605D1
Received: from cvsmtppost29.nm.naver.com (cvsmtppost29.nm.naver.com
 [114.111.35.38])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15B40605D1
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 16:36:53 +0000 (UTC)
X-Originating-IP: 125.132.232.68
Received: from cvsendbo013.nm ([10.112.18.56])
 by cvsmtppost29.nm.naver.com with ESMTP id 27Mh5cunRvaa3+QNxvBaxA
 for <buildroot@buildroot.org>; Sun, 09 Mar 2025 16:26:49 -0000
X-Session-ID: WIZBgI7zSaKt6qtEgw-kdw
X-Originating-IP: 125.132.232.68
X-Works-Send-Opt: E/YqjAJYjHmlKxu/FoJYKxgXKBwkx0eFjAJYKg==
X-Works-Smtp-Source: ZqKmFxudFqJZ+HmlKAU9+6E=
Received: from Linux.. ([125.132.232.68])
 by cvnsmtp002.nm.naver.com with ESMTP id WIZBgI7zSaKt6qtEgw-kdw
 for <multiple recipients>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 09 Mar 2025 16:26:49 -0000
From: Cherniaev Andrei <dungeonlords789@naver.com>
To: buildroot@buildroot.org
Cc: Cherniaev Andrei <dungeonlords789@naver.com>,
 Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 10 Mar 2025 01:26:12 +0900
Message-ID: <20250309162614.2549737-2-dungeonlords789@naver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250309162614.2549737-1-dungeonlords789@naver.com>
References: <20250309162614.2549737-1-dungeonlords789@naver.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=naver.com; s=s20171208; 
 t=1741537609; bh=7fzjRFjqCHp9NWLYt8Ro38d4QMJQy6tgID7s5Fcr8Jo=;
 h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
 X-Works-Security;
 b=oLLjZdyHclUDC5P+OIkQco6jxCYWoIhm37Xk7WRw5lVv1mCtiLF8EjwE7jn18s4RO
 LrzP1Eob8gHjbXzf275OL8nR/+EIOGErf+GKHYgf9/33rWNhNoO09j39bvxiY+TiHo
 If+2aD6RV+vmugGKUqvU71Ps8qnOiFPD93ZYWjbogluwjwmLO07CfssFdZvDevM0+J
 o+a4+ff2RjG0MdwmWuasZwEAC0qZZcm8px/rYiowtg6aqzkeU5//mndYCr0+lHBwE9
 aXmJMtTtkyR7ysilCfm83dUYW1T66evzu6gIjYMZuybkiNkfH4goQ+B6uxxqEX5oTf
 dFzcBXyXs2LpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=naver.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256
 header.s=s20171208 header.b=oLLjZdyH
Subject: [Buildroot] [PATCH 2/2] package/libopenh264: switch to meson
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/libopenh264/libopenh264.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libopenh264/libopenh264.mk b/package/libopenh264/libopenh264.mk
index e371e4cdc0..8f0a30cf5a 100644
--- a/package/libopenh264/libopenh264.mk
+++ b/package/libopenh264/libopenh264.mk
@@ -52,4 +52,4 @@ define LIBOPENH264_INSTALL_TARGET_CMDS
 		DESTDIR=$(TARGET_DIR) PREFIX=/usr install
 endef
 
-$(eval $(generic-package))
+$(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

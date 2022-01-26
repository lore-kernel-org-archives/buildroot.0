Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C56C433F5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 21:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DEC260FCD;
	Wed, 26 Jan 2022 21:02:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 38ttJd41FGGl; Wed, 26 Jan 2022 21:02:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E058160FC9;
	Wed, 26 Jan 2022 21:02:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 15AA11BF4D7
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0319D60FC5
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oNDXZbwWTxHo for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 21:02:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D824E60FC3
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 21:02:39 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 r2-20020a1c2b02000000b0034f7b261169so617906wmr.2
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 13:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gUiyigp4FxE8Ak7pbIYvNfRx81t+6sp3I9g5lsolLQA=;
 b=cFRSNEVa+9E/3gwPvj/cFFgm2F/2JJNfcCvwIfWPVpKp4VwKEqp8ifdhZ5vycvs+EG
 MRI5OWa1nJjDpVFibwoiPfqALrFjRmyGINYs5QBO0Bun6oEC7CcJUmMkbqO3F6tnBdeO
 wrI+BrCJZpox6OuV9tSvHRt1YFHS1oIAc4OjtJCzfHXGK35hOFW3XT3CFkRJTeF96kQC
 qDekc4Jtbw6+1oK/O4bzo8Y6CzdcLjDjjF+X7RHS7op7ENRti7S3HOrqnhgzc7fPWNFj
 v0NlLLI6sCupYQzUa6+8VvkAm2tYgWE/PbUSj2Nvu/KGnXCCX5yCxpC0JLHLlHLyQVRW
 Uuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gUiyigp4FxE8Ak7pbIYvNfRx81t+6sp3I9g5lsolLQA=;
 b=Oe4m0AraOXbunbb5osAXLZSD93Pl29ELyUfjYaVSFk39C+uol3b2xTYrPgwNlxsXsP
 nb9JkYWag6WOeIHk8f3OUzTCNQnYW5fA8duTjZpdA38wObJOwtJPpVsVE/BwaghGiNlD
 N6kgMuoiKc4DWUpSuRG9UtUbI5CNEkf40sR1nfWYl4H1bgJDEWwsZk32jrwNmPOL+O6G
 NPzEbOhyHLCwpIl4IYfMcI8VTtVmLd+XnUV3aDvTyPrmreZcvYz6ZDGgfaQ/bK3BQkMg
 B75RbjO+2K8csjkvvQWe7jlR7i/scTsiOQ0KhbHDcHYH5FXOG/rfjuVb40IR2dBaTLhi
 qLTA==
X-Gm-Message-State: AOAM533d6AkSYKq9iy2ZvEgL6QOpTGjGYJBm3t5T3eGt2C9xm25Bvum4
 L7GcJBrN5AHy37NRUDz3nO0UjzO5KhE=
X-Google-Smtp-Source: ABdhPJytVHj8/uVvGhRSASlBK4tL0wXuqd10PBD9PJOb4ar0CqjxYmdsi5FSPwM7Lg3s6DdW4O9Osw==
X-Received: by 2002:a05:600c:590:: with SMTP id
 o16mr8775723wmd.7.1643230957964; 
 Wed, 26 Jan 2022 13:02:37 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id f13sm5116884wmq.29.2022.01.26.13.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 13:02:34 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 22:00:39 +0100
Message-Id: <20220126210039.1535791-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/umtprd: bump to version 1.6.2
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

https://github.com/viveris/uMTP-Responder/blob/umtprd-1.6.2/Release-notes.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/umtprd/umtprd.hash | 4 ++--
 package/umtprd/umtprd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/umtprd/umtprd.hash b/package/umtprd/umtprd.hash
index 170837d84b..7cd75619ab 100644
--- a/package/umtprd/umtprd.hash
+++ b/package/umtprd/umtprd.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	cce45c7d3df0022fc013c79de21b1f11b1027d090aeb628669f08b0c20d2afdd	umtprd-1.3.10.tar.gz
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	LICENSE
+sha256  1de40511c1dd4618719cff2058dfe68a595f1b9284c80afa89d6d1a1c80aec29  umtprd-1.6.2.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/umtprd/umtprd.mk b/package/umtprd/umtprd.mk
index f1a4e66cff..c5e0ee512e 100644
--- a/package/umtprd/umtprd.mk
+++ b/package/umtprd/umtprd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UMTPRD_VERSION = 1.3.10
+UMTPRD_VERSION = 1.6.2
 UMTPRD_SITE = https://github.com/viveris/uMTP-Responder/archive
 UMTPRD_LICENSE = GPL-3.0+
 UMTPRD_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

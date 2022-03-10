Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026ABC433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 11:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0694418E9;
	Thu, 10 Mar 2022 11:42:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fyAbPyiygFag; Thu, 10 Mar 2022 11:42:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD0D3418E6;
	Thu, 10 Mar 2022 11:42:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A326B1BF868
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 11:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92B608438D
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 11:42:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xGmz2U5lp7GD for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 11:42:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8595384390
 for <buildroot@busybox.net>; Thu, 10 Mar 2022 11:42:18 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id p9so7464930wra.12
 for <buildroot@busybox.net>; Thu, 10 Mar 2022 03:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S4dczZ4OgM4V/eRMqAG6Mf3a7PIbkoWb6tGC2Dq/FJk=;
 b=nlpt2rffIcFt3K0gSRlSqU67zm5IpRgwQb6y1npnqC4iqwodZLz1IxicuMmWy+mb76
 TkM5aGIrVqIz2+pfk1/uLgagKgfrbF0d45wf2L3BraTBWYrIZbiCy5uhcBTTVYMQmx+Q
 TL6yjUJ1K9HBoEufqp0gS9XLy5wOBeLTIeH6Icjh4mW0pWSn6omhYuFeNmt7oD5Luvwt
 lQaDu0MIyWzMnJerM/X9ii3dFcD+kjWzagSzfLXAZun4HAsAKU1YF0KbHKKvQAP8/qyf
 zLvvQp2z3zKUlW2swLEEVCs1jCzurDqc3BrCsjH1pevVAWsBoWVSALna3GHZXecwj9IT
 qsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S4dczZ4OgM4V/eRMqAG6Mf3a7PIbkoWb6tGC2Dq/FJk=;
 b=SgKn1B1ohKcOq26eLH0rqGwG/tRzg3N3VYi9PYJhibkmZZHl5BLcefEyUv6mhAsuvA
 UxglNBskn2WUctYkYiFCgni3eZwLY+3d5acrlhrccOJSLj8GAk3WcbVgNSHR1qohoUKq
 GgW/+UtZkczyUdvv68y3FZ9EXDIKPjAOGwEmXsAjT9m4OF9nvbkQ7I5jycS2WMt3kCez
 obcjZEDIszQ8qBL5OXKOblrzxWy0KLRisGcejmcdif0DbXIc+a8kHuZia1k/dAWHgy5J
 6CSDpSpTVpv4vj6McKxzLh7BBET/GplIOevQIUFNkSuyHBQngkxfoynVfJMp7ned8JJz
 8MLQ==
X-Gm-Message-State: AOAM533VLIjI1s1LxwLVig6wbfzmHCm7gFc8u22qcEwlPTVx4djkbMXB
 G+XNS6vX9PrLxuzuelyZuuJgE5gk8ok=
X-Google-Smtp-Source: ABdhPJxfypv+NnDZ40AgcvJcdFKRbltJnwv9CeLEFDRZOv3M+AhTPWA6460fr4QfiPksHIxKEsXeeA==
X-Received: by 2002:adf:dc91:0:b0:1f0:728c:8faf with SMTP id
 r17-20020adfdc91000000b001f0728c8fafmr3283985wrj.287.1646912536774; 
 Thu, 10 Mar 2022 03:42:16 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c35cd00b00389e8aaad51sm321801wmq.12.2022.03.10.03.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:42:16 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Thu, 10 Mar 2022 12:42:11 +0100
Message-Id: <20220310114211.920001-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/pango: bump to version 1.50.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pango/pango.hash | 4 ++--
 package/pango/pango.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index a6c924a8c..319d9778c 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,5 +1,5 @@
-# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.50/pango-1.50.3.sha256sum
-sha256  4add05edf51c1fb375a1ccde7498914120e23cb280dd7395b1aeb441f1838a4c  pango-1.50.3.tar.xz
+# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.50/pango-1.50.5.sha256sum
+sha256  6d136872da6207fe88c5cd2c95c36bcaf4ed29402b854663a86cd7efe99b0cf5  pango-1.50.5.tar.xz
 
 # Locally computed
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 684407228..69ec5bb49 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PANGO_VERSION_MAJOR = 1.50
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).3
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).5
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

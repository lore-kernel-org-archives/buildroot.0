Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7918C678D4
	for <buildroot@archiver.kernel.org>; Thu,  2 Mar 2023 17:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AC2341B65;
	Thu,  2 Mar 2023 17:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AC2341B65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hP06en1GE77I; Thu,  2 Mar 2023 17:51:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5691A41B3B;
	Thu,  2 Mar 2023 17:51:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5691A41B3B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E5CE1BF387
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 17:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12E6D61388
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 17:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12E6D61388
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EsL288LgBjQH for <buildroot@lists.busybox.net>;
 Thu,  2 Mar 2023 17:51:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C5BD61385
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C5BD61385
 for <buildroot@buildroot.org>; Thu,  2 Mar 2023 17:51:13 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso2026530wmo.0
 for <buildroot@buildroot.org>; Thu, 02 Mar 2023 09:51:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677779470;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4Lp6mODIs+ed1SuAIvv6NGGSTh6Pdyowft+1qWV5ols=;
 b=WB7BZLJ8wQ2XHMOLsSj15nNqS0rn1Lyf24shc9/R3HwmjNy6NrU7em/ovh3tJ2URwy
 aVZ3faAQ+eMnUG0olXIPWuchtA+FbDUDFWDYpC1GdwLvifZMjRzkSzryyVod7u6Svy5N
 0I3XaiSjkET4dl0y0G99FamKi7sV4QpDG1feonpdJQTR46zu6Swn9UBUNTF/w0x8XZMl
 46m6D165g9hlIPLWiJCVCakYxC27DZlqZfZkXjXlsKyLbI+/AQaFyVFmbpS3eW7pDkU3
 Axbcpvs2KI2M5sRHCjddU51uPTFqh5d4LJLedAqo2dX+SbUeXVji2UfV33Jxjfu669Tw
 dvQg==
X-Gm-Message-State: AO0yUKXV97WlCfFrp4hqZQSuWk2McUUvsC975dHgSk5kVqovLGAwnABX
 /sqziuE9pfgxw4EnDzfFZ+XjM5r0l8I=
X-Google-Smtp-Source: AK7set9oNWWS7Zg9/LL4aWDFh1O3QLuO80fUVLZ53NEkQkGED4AxOkU8C+rTXsnWFsvgGr6avGhHGw==
X-Received: by 2002:a05:600c:3ac9:b0:3e7:6a59:d9d3 with SMTP id
 d9-20020a05600c3ac900b003e76a59d9d3mr7809551wms.37.1677779470465; 
 Thu, 02 Mar 2023 09:51:10 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f7-20020a05600c44c700b003e2232d0960sm207884wmo.23.2023.03.02.09.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 09:51:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  2 Mar 2023 18:51:07 +0100
Message-Id: <20230302175107.32479-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677779470;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4Lp6mODIs+ed1SuAIvv6NGGSTh6Pdyowft+1qWV5ols=;
 b=QxjvwJik+3cQLc5BJdncx/t3iw55xmZb2EcMuYLpSu+IoIpYNRzMHQMbjJPuZW1sGw
 35qFRcWIf5LWRm1RbrCKTRRavdb0VDKGXWulEfqXD5eJ5eoQCqYtnRXIVkaGIVBIz/EJ
 xmj8//c3ckvA9fva9uvQtlJ5xWWOh5xD21gUqKgLbjdnMkLhTzgq/Loey1BhFV9Zctkw
 P8fznxHopy7ECYeg/ADeJIIGriZW2ODvTJuxyDRlzUcKSnmfp97ecNMwmj+0nUYG1c4V
 qWSJF/xTVPaWyqCygUB1xZrQyeA3Nj4q8KFCAuWdZKy3vowT8driismOu5rpdSika01E
 2yJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QxjvwJik
Subject: [Buildroot] [PATCH 1/1] package/opus: force arm mode instead of
 Thumb mode
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure:

/tmp/cckXvlOO.s:352: Error: selected processor does not support `smull r6,ip,r5,r0' in Thumb mode

Fixes:
 - http://autobuild.buildroot.org/results/fdedcc8f68651ec34417d609b40effbac456c80d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opus/opus.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index 2fa929c7df..1372711038 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -12,6 +12,13 @@ OPUS_INSTALL_STAGING = YES
 
 OPUS_CFLAGS = $(TARGET_CFLAGS)
 
+# opus has some assembly function that is not present in Thumb mode:
+# Error: selected processor does not support `smull r6,ip,r5,r0' in Thumb mode
+# so, we desactivate Thumb mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+OPUS_CFLAGS += -marm
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 OPUS_CFLAGS += -O0
 endif
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

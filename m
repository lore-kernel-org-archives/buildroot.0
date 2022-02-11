Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3546FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 18:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C85E761C31;
	Fri, 11 Feb 2022 18:22:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IGd8Y6_KACxx; Fri, 11 Feb 2022 18:22:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C2C460B6A;
	Fri, 11 Feb 2022 18:22:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96D821BF36B
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 18:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8550082F57
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 18:22:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wHVnI04cI_c5 for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 18:22:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D452181A6F
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 18:22:16 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id u6so18195108lfc.3
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 10:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=1b8QzHlXVAadfIf72BCUe1SVHI770nnwEwaPMkksY20=;
 b=STqcdOk3oQseDey2TiIXDWzjkxGbzqkhYkSQyvzhJaKx4ZC3d1Ae9I7agCcV1jDnOZ
 jJ6LoP5kmiR245zqRy1kRMCWYqqWAfHXIuA5g+KtA3OUcYcYxOr8EI7FU7FjL1zX/MU1
 twUQPPE87qdmVGcDBDWUISKoi7D4oy5WtWlu5bYq7mois6FhrFPgtMbz2ixdF6IN+/v/
 qLe8pTR8ZRTPykceLpvvUD4XquEYBSmfq3LaB85QurmNFswf4wHZhv+5Rj43KU3i4807
 M6ghh/UbydEGkqA3uTuYA0Kxqp/ylJ7F14R4dxh+w9ZJDjVY7SFCDALoL5UGfdSxfRLw
 mL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=1b8QzHlXVAadfIf72BCUe1SVHI770nnwEwaPMkksY20=;
 b=uWOBq3DJisFY9KTVu+gktxRpdvKzJBVPFziDq9ZLZ6+vd98rYt4LlDwnBOJIHgBKjX
 h3Dx1/tHknh9h8RO5nGhn0Zz7kQ2FLgn2P9qTHobK3jBALghm0Idy70s0zj7/U+LtkD9
 mCHmh4skAUkue44iAUm9lVFp98iTSXZw+zvkb7PzCU22alg3X1TCzfffX9J0VOCXbj6A
 ThEXezUO4hTfnrQa98XOsypoNdboTkhEUkEAqr3BA2Zvw0QKasbrMEoihAeW6HxTBZgQ
 5CYb8wuztn8WzYlOpmt3axrj/dS0S9hm6O1zSWyQySd84U93XiU5W0J3bP33ir4rlfy/
 F+cA==
X-Gm-Message-State: AOAM5308JfhmAh9ulF++KQHkUqLws18+WQS50CCa50CSsvdyOsdGzL0V
 +VHVKWZi76q+7fAAIL2ISi+1KLn4hwz2zi6Hk/ynccB1k3VAnw==
X-Google-Smtp-Source: ABdhPJxLGTveXK8aw/Xp/ZUow0ZQCAirT5NgMQNef/hE2fZj7qyXvG5h/nOocIUBCJnDa8isAi9JT4h6mjxipoUV+y8=
X-Received: by 2002:a05:6512:280a:: with SMTP id
 cf10mr1954229lfb.619.1644603734308; 
 Fri, 11 Feb 2022 10:22:14 -0800 (PST)
MIME-Version: 1.0
References: <CAEXMXLSmFXY7jEVTuxtkq034drmG7nS_3c5D=B44M0Wt6U7rPA@mail.gmail.com>
In-Reply-To: <CAEXMXLSmFXY7jEVTuxtkq034drmG7nS_3c5D=B44M0Wt6U7rPA@mail.gmail.com>
From: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Date: Fri, 11 Feb 2022 18:22:03 +0000
Message-ID: <CAEXMXLTDvKwJk0twwv_fqXkZFBncW3V4EGoDOZi9jadKVzG-Zg@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] [PATCH] package/casync: fix zstd dependency to correct
 package name
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

Signed-off-by: Nuno Goncalves <nunojpg@gmail.com>
---
 package/casync/casync.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/casync/casync.mk b/package/casync/casync.mk
index d74cb1bfe8..bb9bd8ccac 100644
--- a/package/casync/casync.mk
+++ b/package/casync/casync.mk
@@ -40,8 +40,8 @@ else
 CASYNC_CONF_OPTS += -Dudev=false
 endif

-ifeq ($(BR2_PACKAGE_LIBZSTD),y)
-CASYNC_DEPENDENCIES += libzstd
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+CASYNC_DEPENDENCIES += zstd
 CASYNC_CONF_OPTS += -Dlibzstd=enabled
 else
 CASYNC_CONF_OPTS += -Dlibzstd=disabled
--
2.32.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

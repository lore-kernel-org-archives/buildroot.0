Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC25C433EF
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 06:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 048AA40366;
	Mon, 29 Nov 2021 06:45:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UjnGLUB9jz1a; Mon, 29 Nov 2021 06:45:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B5704018D;
	Mon, 29 Nov 2021 06:45:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0AFA01BF405
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 06:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC0D74018D
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 06:45:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2F87hrrRgS2X for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 06:45:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C74C400A6
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 06:45:37 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so11639819wmb.0
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 22:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l4xXiDnQBJ2+pyvZ9MTZ/7Wq/PCXb5I5JZc/pkGcuNo=;
 b=Ifbx7H62QIyazVCKNJvq8iJ9wTnEYoLVkiydiwn8fqENH8rE8yg7IwbVjxLIVsDonn
 /8gko0m53oqy2VoG2cAexxX3HjZMWYTbY37KNd0j/YXfKNVUvvUZVT/CtL3cIkTyU+Lw
 6lOYi5guKuOnupgWoiUNu9MKsZtER7IGO+ori8tvwU7gMm7jLhaX8sHWp+zGz38JgbMt
 lJ+wsLqNUr01otGN5ubHJ5aQfeyyTiGIDkEzl7xfchJiW37sFgEaXAc1zOdExhLMaPsX
 klBdLgku4PeCLptafEdkJf4LieOF4TPiMbo5cZ90RVVk5Oky41kOG0gQiBv9VcK/hOZR
 T6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l4xXiDnQBJ2+pyvZ9MTZ/7Wq/PCXb5I5JZc/pkGcuNo=;
 b=MH0iNVA6qLmvMXJMrtlYRRxGyRwNuUjLZDahbCE5BEZi0u5EDoTg+VtfhJU31lTglY
 MHK9kc0JlUUt8STfeRy8KHaGGpWmzYhR/TLRxwn0Qh02UJNyF+LzcEvw49EMZCECdwS3
 8zCfibA8PYM8lhTXr0QHRtGRN2hmTPhabp/BZrTFJKd2XYy18I+4o9+O1NyVOXuUlDGx
 eohRqrlgdzJ1cwsgc7ahA+EaqUKCKV81kAGJS0ZM8NuKgJxhnBIkWPTw59mf2zk7jgXF
 yK1E0Z/DXR1VnEL8lAi4zMSQP0vh4rHbd6Mmd4VxeGK0AQ6nO4DmjEYCBoo6QzCrP45t
 pClQ==
X-Gm-Message-State: AOAM5308w8UcePW8PTCo3l1NSytlB3NqUlsCLiStaEjnYL0+YWrip3wc
 ErpLOE7OJmWRapripwFAW7qfIh5T/hY=
X-Google-Smtp-Source: ABdhPJzOZhFxbHcWk/64XRbt4yBLfZuPHfisvAlKlWZSuvZ9/OEKUr9facYHv4iwV1D2xB+C3HGbOQ==
X-Received: by 2002:a05:600c:a42:: with SMTP id
 c2mr34774194wmq.154.1638168335075; 
 Sun, 28 Nov 2021 22:45:35 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id p2sm20703025wmq.23.2021.11.28.22.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 22:45:34 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 07:43:02 +0100
Message-Id: <20211129064302.2174763-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sdl_ttf: drop spurious space
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

Drop spurious space added by
fcb48a9a6568f09d2c246470de156299d9c5e846

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sdl_ttf/sdl_ttf.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/sdl_ttf/sdl_ttf.mk b/package/sdl_ttf/sdl_ttf.mk
index 254000443c..c396830d0e 100644
--- a/package/sdl_ttf/sdl_ttf.mk
+++ b/package/sdl_ttf/sdl_ttf.mk
@@ -18,5 +18,8 @@ SDL_TTF_CONF_OPTS = \
 	--with-freetype-prefix=$(STAGING_DIR)/usr \
 	--with-sdl-prefix=$(STAGING_DIR)/usr
 
-SDL_TTF_MAKE_OPTS = INCLUDES="-I$(STAGING_DIR)/usr/include/SDL"  LDFLAGS="-L$(STAGING_DIR)/usr/lib"
+SDL_TTF_MAKE_OPTS = \
+	INCLUDES="-I$(STAGING_DIR)/usr/include/SDL" \
+	LDFLAGS="-L$(STAGING_DIR)/usr/lib"
+
 $(eval $(autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

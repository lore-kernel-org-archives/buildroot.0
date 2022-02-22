Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A1DC433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 10:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CD5A405A6;
	Tue, 22 Feb 2022 10:22:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JzktwKGBRXxZ; Tue, 22 Feb 2022 10:22:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79B0E40155;
	Tue, 22 Feb 2022 10:22:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DBB3E1BF280
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5B39405A0
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:22:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQ63IEuAXW2L for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 10:22:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFE3940155
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 10:22:23 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id hw13so41160533ejc.9
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 02:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pe4oiWrgvD0r4eNz6eXtyyG/mCaORob8rficGuzePAo=;
 b=IMuMfnF5mCksQruPtzM7h8+aEXuuOXLnLV43FYZX3EzUoiWGXjZROrWBbxWTDqZhWY
 ePNSfezy2hYZC7MR2zEqt7FhyrNYKfpQ0DrV8quY8b6sWalFjObpbPG6Ntx/TvZTCkD2
 3E8v+X8Bnwna8AdyER+t+BrdnAtvIUmZucvrl8c4myZccN31eTYaO2uhNOPdvDjK6nQe
 fCAHfFWWvktR6dSAlPBxYCVMptym/dQU4v1GXW5Y1oqz49Wukdllyti1GpoIxMAJ/QDo
 W4SMJRqfk5mqzEuTTTNXVWw8YFHpQ1mA1EBXs18IGlOXZ58SJPcqFa4UeCy1rLKYLrlz
 c/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pe4oiWrgvD0r4eNz6eXtyyG/mCaORob8rficGuzePAo=;
 b=vOJxLpqFRJIlw3lUSca/gFtgamMI5DLIrb+Svr2JZht8ZkSoNqfy+LSDJK5bBPdrAi
 TRkpZhma9zd+8V8FlvnUTwM6iXTw9hqfN4k3uTWTRzMgQzi9g/GUYhDYHegAeLjO8XkN
 +szahA5TAxdCe5HoneruSdnMOwngCz5xpol2Y5RzfBCSBueNYP7NRsGR/dgf3yCGp7BM
 2H2KdqBGyfW9XLmMSqjvPPWT68qc8NL09PyGpIBgmBqEqXm+/d4U288TYFVviH1CvN1O
 vzP/lk2Sh0frRmO79Pr4tPv9IKnPVnN86pglqP7y6JK+1cxatEeikERT0MqyuM/bpihf
 77Og==
X-Gm-Message-State: AOAM532Ko78l0fcX1h9vT7qpb5WaG2hn9nUJUeYJMFrIn5Kdu/zXi4xq
 slfrLZ5AB37gXDADk1N4aGEGgiqOLiOWoQ==
X-Google-Smtp-Source: ABdhPJwA79e78eQYMrml8YcjYkdHD2XLsgEn6bLGKNXPXZ/pYiR29kihGv9iIqYch8YgvtMH4BvXsw==
X-Received: by 2002:a17:906:1f05:b0:6ce:69ef:5ef0 with SMTP id
 w5-20020a1709061f0500b006ce69ef5ef0mr19613850ejj.606.1645525342109; 
 Tue, 22 Feb 2022 02:22:22 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id c24sm6097032ejj.60.2022.02.22.02.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 02:22:21 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 11:22:04 +0100
Message-Id: <20220222102211.74573-2-nolange79@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220222102211.74573-1-nolange79@gmail.com>
References: <20220222102211.74573-1-nolange79@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/7] package/pkg-cmake.mk: use /run as
 runtime path
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
Cc: Norbert Lange <nolange79@gmail.com>, Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot prefers /run as runstate directory, make this the
default.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/pkg-cmake.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 3b1db35fb6..081960b5bf 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -90,6 +90,7 @@ define $(2)_CONFIGURE_CMDS
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
+		-DCMAKE_INSTALL_RUNSTATEDIR="/run" \
 		-DCMAKE_COLOR_MAKEFILE=OFF \
 		-DBUILD_DOC=OFF \
 		-DBUILD_DOCS=OFF \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF0AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 23:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B34A842D1;
	Mon, 21 Mar 2022 23:06:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u87bwdLEWC4O; Mon, 21 Mar 2022 23:06:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C027F842CA;
	Mon, 21 Mar 2022 23:06:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1DB5C1BF370
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 23:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07C174041C
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 23:06:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7n3t3bIyWxDY for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 23:06:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91BAA401B7
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 23:06:09 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r13so7637572wrr.9
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 16:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cgcmAYlVw9ThbdOrvAHhv8hhX8G+X0ScFBklh4KNZ4w=;
 b=OhPw/OP0zpUM125h8pClSGWzqF3TL1vpnClRyAXao6UYuxzOg3Yc5u+X6jarLsWJGT
 xAijt/464Ooc5L9vp5XmshMHIXy4Db8OhsQP0ALz66mzflxsPvhM8qnWwMmllyo6py1l
 QpKGllxUZ4PIhCMQ/XSnE7qLj+aWy1CDjQvJ+LErDleaJHhEaBloiCboo+mkeo9dFKrs
 oKDPbNWZ/iFqOIStfsaaqZmhMErsCRqakrmdrwd/7pyq0hlnno4Gzs8GdxoSg9VWXvGA
 D6Huo7SzHKzC3mFT3RQ00YhHVbGZPzFB0peDQPJEDwlA90LLnHULRCVXWTzpmeLgp65m
 7qDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cgcmAYlVw9ThbdOrvAHhv8hhX8G+X0ScFBklh4KNZ4w=;
 b=GYP7KsDMv+9V613b0vd7IAy0dI4kdmx+PtViSvrSN8Xp6MAFWZVYVA1yNPLHfIB4xx
 P7GK9+Saz6mWaVpvhWGyJUNhOZQPG5rCuZ1C2guMYrdCFjv8m/f5jX2hCwWGqS8g+Fxg
 svbwVQtx5ciecfAe8aRpSeedwxfHc4j97nfLgXoXD2yDVqjgZ5yl7q/nqEHNQDFitkew
 ufNfRyjJJmNytG+4V6ZlzqMWUsSGYaxv8MpiKEkTxPSj6Jx8jUHnCIJ2iwJB2qW4Ur1g
 eqiDoCA35D57wbFEUQfHPWgDaXZSr2KOLhhiNinJ7JxyyPb4YUdAFZVZFx74em+6Djr3
 1utA==
X-Gm-Message-State: AOAM530MYlwNevwbEW8MD24D589dLomTgxQrwuZoVSm1DnbGpRAiVWFc
 KMq+un+IF2ARanGbRquDGMAtyI2mLHE=
X-Google-Smtp-Source: ABdhPJxICWzwh6r5FMoc3P3fuDqLQBVk4/drSxiahI79OjVHWrqRYTaBVfpYjldTwnLuHWrAD20Jkg==
X-Received: by 2002:adf:dd8d:0:b0:203:f8c4:262 with SMTP id
 x13-20020adfdd8d000000b00203f8c40262mr13613581wrl.680.1647903967589; 
 Mon, 21 Mar 2022 16:06:07 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a05600001c400b00203fb5dcf29sm8444357wrx.40.2022.03.21.16.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 16:06:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 00:04:52 +0100
Message-Id: <20220321230452.1901382-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ola: fix host build
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-bison and host-flex are mandatory dependencies of host-ola since
the reintroduction of the package in commit
16ff948444c3978d63f483344a3d92d994c64312:

configure: error: bison not found, please install it

Fixes:
 - http://autobuild.buildroot.org/results/ac089629a58d55ec5d1aa83fd77bd487bc9d76de

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ola/ola.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 471ae8ed9b..cde90dbd5b 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -25,7 +25,7 @@ OLA_CONF_OPTS = \
 	--disable-unittests \
 	--with-ola-protoc-plugin=$(HOST_DIR)/usr/bin/ola_protoc_plugin
 
-HOST_OLA_DEPENDENCIES = host-util-linux host-protobuf
+HOST_OLA_DEPENDENCIES = host-util-linux host-protobuf host-bison host-flex
 
 # When building the host part, disable as much as possible to speed up
 # the configure step and avoid missing host dependencies.
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

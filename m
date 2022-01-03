Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5321C433EF
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 10:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64CB281322;
	Mon,  3 Jan 2022 10:44:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fLG9KmJUXlhl; Mon,  3 Jan 2022 10:44:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B179B81315;
	Mon,  3 Jan 2022 10:44:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A6001BF95E
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 10:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58F5081313
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 10:44:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5q9iPPQFN2QU for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 10:44:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C55281315
 for <buildroot@busybox.net>; Mon,  3 Jan 2022 10:44:04 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id bm14so134292902edb.5
 for <buildroot@busybox.net>; Mon, 03 Jan 2022 02:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9xWqdCf8jaX0zJ/yiaEtUD4xqZh8KxGI/ojHElo+R5A=;
 b=db0C/7f7lWcp8XP9YCaBBAS/b968ZJ+In3+zY/HAPLXQXYFsM0XEgQIAxW5LfdKnX3
 6BGD6SpmTy/ROfD1mdAjroOVeektZo4E2vAm36LTkP7hh2/ZKEKKXkqsVflGqqpwiDcj
 EAhbMAv+C1aCulBET3yL3LvI8sMQf8+3M55qVnmiqRd0mn46wEoqIf1I+IBHVC2BC2fM
 4mpaWNYB8dZ+2F68CsH035c0rFFwq1XNLrC5J3B+hIvcz9IuVtulIJwG/bJ8wWHTgE/Y
 PPQOa0+1A06GbLiz+2bfLhl31Z2c3dfnTY28GCWUf2DWjozql4vVettO1G5MhkrdEpn3
 wvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9xWqdCf8jaX0zJ/yiaEtUD4xqZh8KxGI/ojHElo+R5A=;
 b=Yejlzi9CBW1IGRzdQJJMTBGoVuv01464KIIV+9vChhFTzuR8UokU6IrbQPF8hFct93
 eKbLooC8qYIg01d7FZxtLt8Anm80VrBE+9PXiQcROchIeGQ4IQiEniaXpEuv7oQ/pljF
 JoEgNEq4KRL+3cH8arLl9CC4wVHGD4ao0/GdOr6wZPgzhsUm9zQJwIir+v2q3GyZO5hD
 gH6wHrREHKbpPCGSZjz+LnkViNyB5O18fVwZzDK6XU+akW/CmIGsKiNpD/HBbitAQHIF
 S9L3PIZgcVOBFp7KYCqY4dffcDzukrQ/yvoKOobqs6ch+y2uWVd+uWi2Di7kExzOg+VS
 W+rw==
X-Gm-Message-State: AOAM530yIIcQmQHFV1/IPPoqv6zSaO4NsJ7tRwJ+Oho08Rr3JfybNAg6
 hXKJQnm4BBxJ9+Ovucd91Z923at+Qzc=
X-Google-Smtp-Source: ABdhPJwwirRNqHdl7XRTUtuYrKstbPHcxVZkY1HEcsWNvH0NYBbGTb015ajV/4D8Dn4qET56DEqUtA==
X-Received: by 2002:aa7:d55a:: with SMTP id u26mr43434480edr.265.1641206643178; 
 Mon, 03 Jan 2022 02:44:03 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id d17sm10517866ejd.217.2022.01.03.02.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 02:44:02 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  3 Jan 2022 11:43:55 +0100
Message-Id: <20220103104355.16030-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/spi-tools: bump to version 1.0.1
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
 package/spi-tools/spi-tools.hash | 2 +-
 package/spi-tools/spi-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spi-tools/spi-tools.hash b/package/spi-tools/spi-tools.hash
index a1ef4c2b9..1595cd3d2 100644
--- a/package/spi-tools/spi-tools.hash
+++ b/package/spi-tools/spi-tools.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  5eb24670461dcf2c58471114dc69b5204dab1c0cc5053878f6de79503bd8cc9f  spi-tools-1.0.0.tar.gz
+sha256  81bb9f7218123f86c3644d92ad2c427343758df2143ee5da38e6f743f18714fd  spi-tools-1.0.1.tar.gz
 sha256  a01259a1b522cf0de95824f9860613b453153eebac468e96196d5d7dba84786c  LICENSE
diff --git a/package/spi-tools/spi-tools.mk b/package/spi-tools/spi-tools.mk
index 26d0dcf54..d623babf4 100644
--- a/package/spi-tools/spi-tools.mk
+++ b/package/spi-tools/spi-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPI_TOOLS_VERSION = 1.0.0
+SPI_TOOLS_VERSION = 1.0.1
 SPI_TOOLS_SITE = $(call github,cpb-,spi-tools,$(SPI_TOOLS_VERSION))
 # autoreconf must be run as specified in package documentation
 SPI_TOOLS_AUTORECONF = YES
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

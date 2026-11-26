Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FE5606A31C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 11:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jvkwbN0W;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=HWMQ0mDn
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01178408D1;
	Thu, 26 Nov 2026 11:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMis6-DVBZ6h; Thu, 26 Nov 2026 11:01:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2E6014084E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795690860;
	b=m+FExD8wDCGPOXbEpC59xl11rkaGffinw2t0ff8NI0Ahnc56ZtxUXG8/xNIf1bOFTuiG
	 LR9BiJx8W8vGsqIgs4iCD4scO64mbXp/ylAzZJq0AhD6bU1LZG8D6ZLBfVPIN+aa5bA8t
	 bjV1qstx6mlGbJ/etSJjPLHAHfuwWOE1IibviiHk6e2lJAqpQdh9G0i8RXieT1lIi7XwI
	 owOopDdexJbmxkuWSWXPUZxRjbXV1WkCyG3HsCtswno8UKH5Qi/JHQHku2effupSxhhUI
	 nySiNw1x6Lpfvpsg8HpvL277ecyiKbAly238A219Z40mX3r0h2+yyIucwF6cSFpnPGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795690860;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=pNT2a6VLtiq5hPki38EUb+5JeiDuQSo3hnheOtGRGa8=;
	b=owlV2CheLou6RcwkxvUgeBY9/1ELK5LLOPI4JXFMei/Fh0t2CmWeEI3QSB/6YRZrpS8u
	 zm+gcBtAFZ0lPqtfJbkLlirUDwrZJnuweFSw9YcoMm0V7EQlrX7TysKeMcUP8PTJBDi52
	 Tl9qQV9o4QaidgdmCKeY77sGEZS+VSaaonDHPavlXHkegV3Djzzs4+H1yOIPt6zKPMjkW
	 fTSh8m77IugNQd7/Xp7UZsHdZab3qFk8SVq0BXer1+Iw6c3Z7UkRuC1eRQIqFLZszlK/J
	 NVrMli/BNbbrapf37SwARv5rxg9TBhxfPJ/kYwZxxzPdfnSOHp5A4DiQ6Nr3B8ANraQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795690860;
	bh=pNT2a6VLtiq5hPki38EUb+5JeiDuQSo3hnheOtGRGa8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jvkwbN0WLxd67E02HIMJLUmaFNJdQnqePwPfMngwxhSIZDp1uPJd6Fq5HQSHnf30b
	 0togLrWhzuNeKl9K2m4ntOwEYiXWJwtjiRagfWw9TvyL8gM1kApGhwyXgNM0fDN8Jh
	 +kk+PD4meN7HFyA56f1C4eOPFI491/jPHfwOhbbDwujP7l+5melJaAZsJYn97i9J2c
	 x28nGIKQlRUKZWCXZZ6bkTChtZntdNfj8va8pKYTKc9FRMSkDOs8t3K8SdDOgfO9vf
	 svLgNO/ztrQZuqHQKEJxU+flN/lcN4fcPoO1R8LZd6CM4SiwZ5K7Wh15VlQAWBz5gn
	 mh2Z4neX5vhtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E6014084E;
	Thu, 26 Nov 2026 11:01:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 91E4D10B
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 11:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77F6E608E4
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 11:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKA12NheNqia for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 11:00:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5D82F608E0
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::531"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=HWMQ0mDn
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D82F608E0
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 11:00:54 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6aa77d4d968so936067a12.0
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 03:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795690852; x=1796295652;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aF5T5TThxfltESD+nZihPwuvjicCuYVrJz0fpPDgZqs=;
 b=HWMQ0mDnpLMOAr61KUbTl2Fzk0pUiWakbjJNjKg/qFj2RkDVzNjAyOc4vRGwlfVjqU
 Z5c7nV14QlBvXke9wqpIi3n5LN0HpoNlzus1/Hn7oLnpqtUlglfl6AzzMudlDz0fYqiZ
 kMxzjyoQyULfe/Jmc6tRKRGhSiJyjJB2YnMvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795690852; x=1796295652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=aF5T5TThxfltESD+nZihPwuvjicCuYVrJz0fpPDgZqs=;
 b=ziDkuZjNuMf8QBopuYJMGENAcXD58fmxBZ/X2WHPxMnVwYUAkFbdIRB3bXpIfvm2U/
 mDcRz2RlpF3mcOcbiwxwJex+A6OhU0B7qJLA7cWW6LCaqROOPMSBIPcp7dyawiebZowz
 4yfPHh+TqazvzrYbe3YSAibvNHSdnHxEY+ox/uHfTdnIhs+NJK0fXt0yUlU0BUjg3riu
 x7RU2v8F9pDqjZkTuY/6S3zXN26wgvunHtrhB3TlrmgvnW3r1T39u/s/Kz6/juvA3Bt6
 Rolffl9hl8ho6h1ZXVKWrH6c7R1km3G1rSPak4aDajMKC+eVfjCEKTt9dRhD9+YJ+Qag
 Aq9g==
X-Gm-Message-State: APuU4Z8RISR3wz5x/DNTyXItS+KhS5gCWdz/YxcjCNuTX5MkNiar9aHV
 sXKEJhMMoQhIf0hrlPVA2ucFuUCJnalCX4XaWJ8Z9sxOUuevYGXlPQwdGYtu7CNlBZa7pAsRorz
 sVHQZxdQ=
X-Gm-Gg: AZFdTZd0zbw6m5SJ5l5Q5oymV1yj5+0trGZgAgcKfng1pMPojrq7NJWIDE4xltpeWDz
 CAfXXLA0GM0OiUkposk+5D/7Y/8eh6+SjPKc4q0O85EsDm4HwjGjiFUVGwsqPqTl97YKn1p4H37
 N6r6QbPpDm0JEJl2gKd6yz6r2UkkVzwcVvLd22462kCkVO+pA2YUTraT/4qkKiuEFDI559RkfjF
 EU5WsNGo0bAN1MALL4BVIyYvlK7ANZamYvwY+Jo+PxtfunhgKrJzfTYRd8YqpBQvZIRvN2NjIK7
 2MG10GbUVaRQ39DjUCoiHtTuevgdTqRiT78QCEyPxMjFvNEEXe5veLw55uExpr6pQGTSk2xOumY
 1p/oPMki8u2KQRVTt22AyJBLMl4F2hMvoF7aYNmVeCRiJDUp06yo9avN46OODncg4Ljlp8KEajs
 GZxCsS4Ax1qAqnjGBAjPTczemLj5b8QExlWHNRiYuYbS7qYEv+RYbuSTWm/E1ourdjfaFlBG3DU
 NUlvLvNJgHL3xrwcmiNmbcMEdyoyK/Lje8pDb+3N0q/+NWyBYdM673GgYSOKEORnVXcpNqw95IY
 xpSvZzRC0lGbd7g0eU3iz+SLcnhsELREkW0A0faaLg3rsYNguGFmveR2A7+S1c/3HqaOZZ+/OVa
 rZojakPOA1sB6rGQC+ciMI3R/iRrK9IiPEmNbpZB1eIf1TGQ5oucRNV9OyK+zt2KTGpdCd5rYeJ
 g7OSAq5P338IZagUUawmvNKSM6BmPocx0GG7zVWTkl
X-Received: by 2002:a17:907:7081:b0:c40:5ee3:8694 with SMTP id
 a640c23a62f3a-c513a84b292mr1531043166b.4.1795690852128; 
 Thu, 26 Nov 2026 03:00:52 -0800 (PST)
Received: from localhost.net (212-57-59-66.xdsl.deanconnect.nl. [212.57.59.66])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513ae9dc7asm752067366b.41.2026.11.26.03.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 03:00:51 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Thu, 26 Nov 2026 12:00:26 +0100
Message-ID: <20261126110027.308073-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126110027.308073-1-adam.duskett@amarulasolutions.com>
References: <20261126110027.308073-1-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/openrc: drop ncurses dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since version 0.54, OpenRC no longer uses ncurses/termcap and instead
uses ANSI escape codes directly for color support.

https://github.com/OpenRC/openrc/blob/0.54/NEWS.md

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/openrc/Config.in | 1 -
 package/openrc/openrc.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/openrc/Config.in b/package/openrc/Config.in
index e1f004212b..c3ed2fa286 100644
--- a/package/openrc/Config.in
+++ b/package/openrc/Config.in
@@ -9,7 +9,6 @@ config BR2_PACKAGE_OPENRC
 	select BR2_PACKAGE_KMOD_TOOLS # runtime
 	select BR2_PACKAGE_LIBCAP # runtime
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
-	select BR2_PACKAGE_NCURSES
 	help
 	  Init that works on top of pid 1 (for example
 	  openrc-init). By default it does quite a lot on startup
diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 9cbc8f59fc..1af7175bdf 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -10,7 +10,7 @@ OPENRC_LICENSE = BSD-2-Clause
 OPENRC_LICENSE_FILES = LICENSE
 OPENRC_CPE_ID_VALID = YES
 
-OPENRC_DEPENDENCIES = libcap ncurses
+OPENRC_DEPENDENCIES = libcap
 
 OPENRC_CONF_OPTS = \
 	-Dpkgconfig=false \
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

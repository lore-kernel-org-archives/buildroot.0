Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BB8C531C9
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 09:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1870340A08;
	Sat, 25 Jul 2026 09:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O1fm_1mk2plu; Sat, 25 Jul 2026 09:30:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FE0B4072B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784971801;
	bh=mQy63+6Px7sCuMxufqMQHoBpcjFYv6s8J4rA+avFNpY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k5l76KzfupRgQyVvWQFpTfH4rMRUIWSmobYV5T2QRfaC/0uTAl3J64j8Qy5Aqi3WL
	 LFzFOq9SoSxvdsOu95Vbw90xUDhwvYwGb0tlPHiQvLIqRfu/GNs0+gC2VSvxKT/0Av
	 48qqOHCpUy6KrYI9Ax2ivaO/b2A1vTb5ga/TySQpbztdgqXYA6zI/RJLgBsjIzQjVy
	 pVBZ9z5nf7R6c/crRfj0SYoeIgnRsjyzQc39quNCf4LgA60pqK0iJIeHXA8YQv/g0w
	 VOel35ARfAIqC4jIDvE90i98XS1HW0xg051PCGnBH8+cZ2UgRNXMwpcG/IpuY1oZ85
	 rpcRjD48fhSkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FE0B4072B;
	Sat, 25 Jul 2026 09:30:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 968A2977
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 09:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93A5280D73
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 09:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-rdPqpZAHiv for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 09:29:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7378680D56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7378680D56
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7378680D56
 for <buildroot@busybox.net>; Sat, 25 Jul 2026 09:29:58 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-495437bb891so10956805e9.1
 for <buildroot@busybox.net>; Sat, 25 Jul 2026 02:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784971796; x=1785576596;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dGrAWzFzFu7a9XUam/Uai5AH/TNgWfeOKY7w9YZLVrw=;
 b=cWFsPPsSo+NPVpXsP8cvAndl5ayUOX9RJCIZlE+cRMfsMUYgTAnTMIJVqbIKxFfFC9
 m90yD6Ny0c8SJkkkiggDQos8IVENNOYj3EBCnOMw5v/b2SIyOamKa9nLQGDBdGFTc6Wr
 yMzv3lx3GurfeljYgC4nt7D0JH73fLYO89COObCH9Ucj07m8mA4iNSxltuepFiXn/KO7
 DNd1uY8ZIcWd+6QMIV+BlexArtAo/4wIAO/J74fwHX/sECf5vq/G3t+VxVS66D7nu6No
 0gplxhVfizIy3jD2rr2jQ8sj8QhneN10nmNZ0BZ7r9BBeRRAeV+H/0NyAhTZ7Fj2ZNWI
 zSCQ==
X-Gm-Message-State: AOJu0YwSop9iiAonS3CAIW+FWujyIWeax+dHkmGu9tofveMm9yYKHTP9
 yjsJPrb+kOZoemU5qCozbCCuMb33/HzD7b5LpGRRAIjrX3f/QVfJWYrQLt6diQ==
X-Gm-Gg: AR+sD10Zk4d6tknMZ62rpdsEyAvPtxSLmeFTD15nEAWdvHtvlZEmzkfuoBZvqep11FB
 pPXwACARjsmYP29pIPH1hh+obCrsCBfrIfOVxvepvUcMtEx/iza2b2VV69s6F+IespwdSbvUmb/
 PCFh3hh0C20IWONexwe9SvCwlpWjGGDXoMrjuMb0/01CE1ou3TUj30qsJAxKXwH/KvKtng4nxbW
 6wB8EvOHOOmiOwsauHJ5CmMxQpbJpakiW7YEoDjbLPVlIWfOZ8XSQfDpiteWR4J/WJlVq2vGKI5
 bcmjhrUzjVBxAIOzdYG8CsMd2SYVNP76xduGHeGXpuWZHV9dRUOj9g/Bu6RRNF+jVKakY06+QTc
 t6uW8co46RXQf99GP4Da6+bfjAy8iFAy3hd6Al7KOL20vJQDmBYjfgknNul3POV4KvZhWqYjwph
 L8Wz8yJZwTNmgxTqhTGh+bMCD/aDfQJ/lxyg==
X-Received: by 2002:a05:600c:4f09:b0:495:3a52:71b1 with SMTP id
 5b1f17b1804b1-496b5b438f3mr14877895e9.5.1784971796024; 
 Sat, 25 Jul 2026 02:29:56 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496b485f6a2sm66036375e9.4.2026.07.25.02.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2026 02:29:55 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Sat, 25 Jul 2026 11:29:52 +0200
Message-ID: <20260725092952.292677-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784971796; x=1785576596; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=dGrAWzFzFu7a9XUam/Uai5AH/TNgWfeOKY7w9YZLVrw=;
 b=LePBzOsgp7fQpI1Q6pXSKynbp3IuW5wVyNaEXm0oYfHa2WfZqgPmECW72uODav5TGH
 wB3j7CK89jszUdX00BfewxQyJcCXaIgytmXW4xmcyPZJp4Sm0UNNhyFB7OIWK4OBHfsg
 i/XHsjWHiDu9CDYy6poDbu7C/prIEeaKJvcPgLaSd4hr1XsRl/yNlC7hZmxUYi/UH8+b
 ZXVVdj17nAVyqB63VOeTU8s6jXpAoxJEiFwAiD1rAUVKFZuzT0tpG7uBseKxF6RWBMK8
 tfsYcJcIVjW1VDGJ3JxiFfKnnd3wo8Hixyh4pN6z9diFkfXnRvSzSo5PRMpQaHkSq0WT
 /MAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=LePBzOsg
Subject: [Buildroot] [PATCH] package/lua-dkjson: bump to version 2.10
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

homepage switches to https

readme.txt becomes readme.md

see changes on https://dkolf.de/dkjson-lua/

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/lua-dkjson/Config.in       | 2 +-
 package/lua-dkjson/lua-dkjson.hash | 4 ++--
 package/lua-dkjson/lua-dkjson.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lua-dkjson/Config.in b/package/lua-dkjson/Config.in
index e550fdfb8..9e02ae654 100644
--- a/package/lua-dkjson/Config.in
+++ b/package/lua-dkjson/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_LUA_DKJSON
 	  dkjson is written in Lua without any dependencies, but
 	  when LPeg is available dkjson can use it to speed up decoding.
 
-	  http://dkolf.de/dkjson-lua/
+	  https://dkolf.de/dkjson-lua/
diff --git a/package/lua-dkjson/lua-dkjson.hash b/package/lua-dkjson/lua-dkjson.hash
index 710879da0..f2ca354b5 100644
--- a/package/lua-dkjson/lua-dkjson.hash
+++ b/package/lua-dkjson/lua-dkjson.hash
@@ -1,5 +1,5 @@
 # computed by luarocks/buildroot
-sha256  3d8de09cd43a60a005ac769ee1cedc515952c892d63cba9ac925ed02afc98091  dkjson-2.8-1.src.rock
+sha256  41d6bd91e8ae0802f98b3685635dd03e14ad99ee3f3d6fa56d5ecc217623f60c  dkjson-2.10-1.src.rock
 
 # locally computed
-sha256  9c60064047b0f41092ee714d205b4b915f1da147fdf9afc4b3ee7bcf028a2238  dkjson-2.8/readme.txt
+sha256  5998e1e7bd6b53efff746d02aaedb9646ce9cf965ea54f1bc812b5e750222cfc  dkjson-2.10/readme.md
diff --git a/package/lua-dkjson/lua-dkjson.mk b/package/lua-dkjson/lua-dkjson.mk
index a148fea86..f41edf511 100644
--- a/package/lua-dkjson/lua-dkjson.mk
+++ b/package/lua-dkjson/lua-dkjson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LUA_DKJSON_VERSION = 2.8-1
+LUA_DKJSON_VERSION = 2.10-1
 LUA_DKJSON_NAME_UPSTREAM = dkjson
 LUA_DKJSON_LICENSE = MIT
-LUA_DKJSON_LICENSE_FILES = $(LUA_DKJSON_SUBDIR)/readme.txt
+LUA_DKJSON_LICENSE_FILES = $(LUA_DKJSON_SUBDIR)/readme.md
 
 $(eval $(luarocks-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

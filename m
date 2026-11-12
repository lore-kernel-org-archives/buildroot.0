Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38CE606A321
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 10:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=r5OBrVyi
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0AC881425;
	Thu, 12 Nov 2026 10:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P5sbJIMxdwlo; Thu, 12 Nov 2026 10:08:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BC6D781213
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794478109;
	b=Jbmn23IjtaUjxVIZv7pGuYmOQZYdsSKSiXQmGA4YJj0mmhsrqZwdYgG/OWdBK9G5iAty
	 iYu21hA3WsVH9NeI8z+xM3JSOlXIxLOReKy6RP75Qtr8ClrLHHnTT8bNO14bhqkSXLlAB
	 F5T1xTbEUE2mU7gsM5VCf+FPFErT5lraXEHI8J/iN/7Q1Rc3rz7XuJ5WQz8qMkYdzDvvI
	 qITW19hVD1+Jx0RH1K1gDaf5mc48lBDiOlfcfZ4NQ655NsBieyPW8AU/MoT+okKVtZ2lu
	 bEeELQJHofX37TaKnmufiUg0sIGoykSLL+evtX4DpykQ5wUhD3IVIgUeKooPvRdpmvA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794478109;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4j1brdhyN7+fUqT/R9Qtl8e83IZ3SF0aKc+cVECnhvA=;
	b=PIFwEa5IKLuj4bzTb304ebXikkri1gGHddUZW6UMaQZZtms8HC91tpPH6VL3tJIS2/Qe
	 4BNfBow/tcf872rjOgt28xBQTppoWaBcpbKxNcSnvEOPh57wK9Xzn0zfZzOtLV/AgQpXf
	 uX+Sel+nqS4kD8ZnR0pRBVuv7bYPf45wgEP29+yqFpggzv6j2UnJqsy4EOq1lt76UkiPJ
	 HYNMW99AZSq3IK5cQPnQzb1QW89Am2+5yCwvq8jpI7SBtMl4pASK4+Mla6oxkS+lALKsh
	 FxhteAHiESfdH8kHnok/smO5CWNbJl0q8TT1yeaxsKweZf9qUXPR9VZbF8uuF9uCLWw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794478109;
	bh=4j1brdhyN7+fUqT/R9Qtl8e83IZ3SF0aKc+cVECnhvA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=r5OBrVyimt5UOOqmgEEwlBVolLIXN/QcgsTWrlE0hAcg/zXHPdqzFFTNyrhUs269B
	 YbP936pxoxFoRt6jH7z8LLUzczvcrzmdbqo1znncGnEDK1+zRvrJElMbDaTrxz3qOZ
	 lgS7qP28lqSxNZ00VcLe3JcWrg/KIo70uFEIMcH8pUsBIsMQz8vCEpo//IGc0tWibw
	 D5VeS+UyatSJbFLzole+RB7S/lo9WUXUqSLE9N2gFdHxUkX4wh+vP4uQnqqSS8zVvE
	 zsUA9b/im02faFUpUNpjAu5SLKFlicFxsI08mPW4koPJtcSCLxxGtRK8nSVPJD8ljl
	 gJ4Fb456ZDj3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC6D781213;
	Thu, 12 Nov 2026 10:08:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19CEA2E5
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 10:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BF0A40498
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 10:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQ17Mtxl-AdE for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 10:08:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C73F440491
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C73F440491
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 10:08:25 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-c445c95d553so41634366b.1
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 02:08:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794478103; x=1795082903;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ENCslSdTJ+XNI/Sn5qJ11LvFyK+t2O2ak2Y2rQYWw2Q=;
 b=FJqHSZhhlc2yG6v4/vXqdA40oM7E995vqq7s4DXJsqFKBT2iRGPCkKCOjJLXRCt03X
 mF7m95a05u33rc6Q0ppRSHJanCDPFFsvgqvk6Vvy+TRWcbri73pimCI3wRwYZmGC3kX7
 y/jKTTO8JfrmHLfuUIjdrTrRNPmk+QLFS+YxsYHkXXzHIOa7nDEoP6G6okeSZP+QgKQR
 3Si/qOLerVL2YNGnPVfwChc8Vzvf02FgUNC5+zhFHlgH+93XdcNBNmXd2XIbmV1uZyb9
 kYL5KVWv0oS3yUk/SObhzoou8bZmHOHdOdcPhDfa75tLy7Yq/+KJRvo/RSgijX22wGaf
 rfGQ==
X-Gm-Message-State: APuU4Z/13sqUfHYxFkd8QgrNeTALVNZojd9R7qkb/HX5y5dkrHcV3Kb/
 czaFnCXt7uhLHB8Sf3hIECufaFChz+wk6EK+BUFi5h8f7QLpgiKuMKtwYVXVXw==
X-Gm-Gg: AYBFou2tFZIfP5yppV5+WznWllab9t8uyTZ8sub3xbljUUhJb1+w6z96l7cIVxYXIaD
 +oUZodZM9+ANHE+Gl4LVdPTr3MG5Hyz4BP5Ln1nVTULMqeK/Jn/wFFZ8Q7PPZJghN7dPAnMtTvI
 /ojxFRiM5NmMo1p1m2akucFjkQvyc3SZ1h9yEvRYGY3PPD2gns/2qU718RgMdYSePhfvvIlet/S
 RGIG+wShvtYHfsFKRcbMcjL9wbn5oR5fPwOx+LRFskOrhjEw17ZJW3+AOShBObZJSvc9A3UWsW7
 mupaWd91zi4DN/YzE7Zw/qb6INwrzn1kmLKGYFwcKNUDcBYR2Q0XNjZM0wuxNdk7SPp0B35UIXt
 efFONzF/G6G7nuJXKNLuskS24XNWOXNG2JeFttZPoyI2uckZH/dQwNOQqMQrOxifh2yajMyVz1b
 bv9+UpuDeFT8iBqn3w4WNQp7P6r+F0oQ87tYa0Lv6P/COb1uI25gZAduP6dENwBLwMZG4EfVEF8
 4MPICyGpJG+ZR6UMRKdBbDZr69RqmiEjGVHwiL1Zi+0h6reL+L9uDUsY0PSBh0Bltbmn5r8ZcHE
 BJbvXbSxIedWhI3KdnrF9xlsN/5gjnz7rf5Vzk6iwyg3M146rQGUIPyHFJQEYuvfgf0bIbogADe
 y0Qe3uBgdB5HUT0s=
X-Received: by 2002:a17:907:2d9e:b0:c4d:502c:976f with SMTP id
 a640c23a62f3a-c5066ccb007mr375573066b.40.1794478103078; 
 Thu, 12 Nov 2026 02:08:23 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c504a5bd8f2sm316900866b.45.2026.11.12.02.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 02:08:22 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu, 12 Nov 2026 11:08:22 +0100
Message-Id: <20261112100822.3298943-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/prboom: fix build with GCC 14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since autoconf 2.73, AC_PROG_CC enables C23 with -std=gnu23 when the
compiler accepts it, which GCC 14 does. As prboom is autoreconfigured,
it is then built in C23 mode, where false and true are keywords:

../../src/doomtype.h:48:15: error: expected identifier before 'false'
   48 | typedef enum {false, true} boolean;
      |               ^~~~~

Commit 2eb72e7666 ("package/prboom: fix build w/ gcc-15") already
forces -std=gnu18 to avoid this, but only for GCC >= 15, where C23 is
the default. Apply it from GCC 14 on. With -std=gnu18 in CFLAGS, the
configure C23 check fails and -std=gnu23 is no longer added.

This issue has been present since commit a6e8c07a330a
("package/autoconf: bump version to 2.73"), as autoconf 2.72 never
selected C23. It therefore affects 2026.08 and later. The 2026.05.x and
older maintenance branches still use autoconf 2.72 and are not
affected.

Fixes:
https://autobuild.buildroot.org/results/7d5050c54ba8319f0fd58336851121f5e127b1aa

Fixes: a6e8c07a330a389e9578d8f1110e41becac264d2 ("package/autoconf: bump version to 2.73")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/prboom/prboom.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/prboom/prboom.mk b/package/prboom/prboom.mk
index ab9ab09913..28a55badf6 100644
--- a/package/prboom/prboom.mk
+++ b/package/prboom/prboom.mk
@@ -18,7 +18,7 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 PRBOOM_CFLAGS += -O0
 endif
 
-ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_15),y)
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_14),y)
 PRBOOM_CFLAGS += -std=gnu18
 endif
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FCFC7EE23
	for <buildroot@archiver.kernel.org>; Sun, 28 May 2023 10:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1CD1409FE;
	Sun, 28 May 2023 10:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1CD1409FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PF-uEEitnYB1; Sun, 28 May 2023 10:13:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09B67408A5;
	Sun, 28 May 2023 10:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09B67408A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B0B5F1BF2B0
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 10:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AAA283BA4
 for <buildroot@lists.busybox.net>; Sun, 28 May 2023 10:12:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AAA283BA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MUfdqxnZvjDk for <buildroot@lists.busybox.net>;
 Sun, 28 May 2023 10:12:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C43283BA3
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C43283BA3
 for <buildroot@buildroot.org>; Sun, 28 May 2023 10:12:50 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f6d7abe9a4so15219975e9.2
 for <buildroot@buildroot.org>; Sun, 28 May 2023 03:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685268768; x=1687860768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q/r1MkM/tmuez5uXIPMBd5LgozQq+BjxE5gSOS9QZ4Q=;
 b=WwvjHuPiK2HDf582YvAlAlXI6dKU1O6vHaJ+8H6hQ+Z5oC00qUCCsDULJZiBArD2Az
 e7VfnE7LxoisSlZcegQ4OR9fyo7FgjqJdTT6AeueTcie9dGswyHgGVCq7KYR7MrzKwwI
 eH+O18ZFxRDW6PaZLYR881LlDeFdNp23duN5MfUpL2SQMWQKukyLe5vjrWWKPo23r99y
 nbPOb2WErmehHaroYXrp2Z0N+n4JrtOQvgzjHzroFtAu+0w6hwOOSrfYx4/bCXNZ+Tlo
 ufl+rXg9CPSbinV6vBdGGxhez02XZzthCodFEweXS/1+6byjiqep1owR3XLPHDLilbkb
 MRcw==
X-Gm-Message-State: AC+VfDzuRo9n46iBIL+P6ESptWaIoGp5qR0FiN5xPjTBUvMUnkum1TI1
 YevtMi0UiyR6Px54oT8SWsaKYviT0U0=
X-Google-Smtp-Source: ACHHUZ57otgyu+y+yAvJk1DNO++sN5s04xOkQE4vj9VSig8OQ6ivLZYCu/lrewMyVUXwD7Z+lmCjPg==
X-Received: by 2002:adf:fa47:0:b0:30a:e9cb:1a2e with SMTP id
 y7-20020adffa47000000b0030ae9cb1a2emr415555wrr.65.1685268767745; 
 Sun, 28 May 2023 03:12:47 -0700 (PDT)
Received: from atlas.home
 (2a01cb05945b7e0087f8ae3666c23a18.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:87f8:ae36:66c2:3a18])
 by smtp.gmail.com with ESMTPSA id
 d16-20020adff850000000b0030903d44dbcsm10305241wrq.33.2023.05.28.03.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 May 2023 03:12:47 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 May 2023 12:12:41 +0200
Message-Id: <20230528101241.67276-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230528101241.67276-1-romain.naour@gmail.com>
References: <20230528101241.67276-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685268768; x=1687860768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q/r1MkM/tmuez5uXIPMBd5LgozQq+BjxE5gSOS9QZ4Q=;
 b=Xk3qEmHPyO1y/3Ehqyv9sd0BsCnXCVG+fkw54DoOEjybm63nJlqN5GQg+d1c8iU5iY
 NQRJ2LPGzyLVkVNFjWGVdaK64M8YQ6pCXTgAMIS7HPoEIigv0fh2k2Sryz9I8ao4ofTZ
 oMc+sTEtsm5EWjnksG7ZiOAK9qMvKAs4qdgcNtxSP78m8ZKefyqLEPJtSVZs1Mj699pi
 V9FiG6ZuRtRjJDSsTzddO4Ik2pJgEWt5PvmeVk8yKX+2sNv6eP8Xm13gH6+VFpCTb4Wz
 dQaGLqEjpJGZlKj0ZvOQWQ7fN0CX1QTDnkNun1/lvX1vxlHq+ahTMKSNSsLEujYdpdJq
 CzYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Xk3qEmHP
Subject: [Buildroot] [PATCH 2/2] package/perl-http-message: add missing
 perl-clone dependency
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

perl-clone was added to perl-http-message v6.44 as mandatory
dependency by commit [1]. While updating to v6.44 [2] in
Buildroot the new dependency was forgotten.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819252
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819256

[1] https://github.com/libwww-perl/HTTP-Message/commit/6b89d6b2cce67b540ade87fc6fdf88cdede20b46
[2] 79e8aad721099eb05e60b449432136691275022f

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/perl-http-message/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl-http-message/Config.in b/package/perl-http-message/Config.in
index 82538cfce8..3c6849487a 100644
--- a/package/perl-http-message/Config.in
+++ b/package/perl-http-message/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_HTTP_MESSAGE
 	bool "perl-http-message"
+	select BR2_PACKAGE_PERL_CLONE # runtime
 	select BR2_PACKAGE_PERL_ENCODE_LOCALE # runtime
 	select BR2_PACKAGE_PERL_HTTP_DATE # runtime
 	select BR2_PACKAGE_PERL_IO_HTML # runtime
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

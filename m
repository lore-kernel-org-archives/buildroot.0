Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3334BECE579
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 16:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF07280F92;
	Mon,  9 Sep 2024 16:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qiLs4SJ0vfa; Mon,  9 Sep 2024 16:28:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AD0A80E36
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AD0A80E36;
	Mon,  9 Sep 2024 16:28:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E4481BF345
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5ED3B80C9C
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 16:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EFZfOucZXHuv for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 16:27:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 36B5380C7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36B5380C7D
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36B5380C7D
 for <buildroot@busybox.net>; Mon,  9 Sep 2024 16:27:55 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42cbc22e1c4so3886685e9.2
 for <buildroot@busybox.net>; Mon, 09 Sep 2024 09:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725899274; x=1726504074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b8enbi8JYmMqfIZg0y2NUFxLVLhaAw6ckFrhqG3vwi4=;
 b=HIZpXsXgT7eq2iP5AA20LYK6pd5sTnOJHFccOQG5X+wdqkfCh2CkybH6bjtR05E5fh
 /oWd6PW9nI/v+R2t3/wmaAA053ez27XfHxfUWS+YC1Jk0VqBAsQICxnAdyS/Dc3CqHzt
 SBpWlFCZX65fOitUD8l3NoYo9gA8w1l8OErNQ8wIJ+KtE0SguOIOWmofTdLbS7HbVvsK
 pcQTB4X0lpawLuD4M5gIn+b5tgH2Jv91tZrUq33i8Hh7CoeL3ZdbyFAMtv5ldPCfuC12
 l7HLVB/hUZOGe2NT6sJCPw7IhNIwUrvhoeQfj0c5q6uWJydcydHuOgE0DqCaeX7nLnhW
 uiHA==
X-Gm-Message-State: AOJu0Yxzuaa2Q8GMrrrz+vV/Uy60cQ1ZPiilM+bSGEgaWy00pB982ouV
 cqQ5G8tefw5feSPH/zbhvo6QFsy2koONvNY9Z3hLA4pREvyvo2+fQCGlKiYc/HeWlxiBC5NvtzZ
 j5Q==
X-Google-Smtp-Source: AGHT+IHIazMsFFfvZubeLeXJsI9fFadBMeTvqZce+A+jXxE6hIxnodBTtIq+reOEfCoUcPUJh9JCYg==
X-Received: by 2002:a05:600c:458c:b0:426:51dc:f6cd with SMTP id
 5b1f17b1804b1-42cae73d5b7mr52249185e9.18.1725899273164; 
 Mon, 09 Sep 2024 09:27:53 -0700 (PDT)
Received: from vm-2404.. (255.7.65.37.rev.sfr.net. [37.65.7.255])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ca0600651sm114500595e9.32.2024.09.09.09.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:27:52 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  9 Sep 2024 18:26:46 +0200
Message-ID: <20240909162703.3439481-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162703.3439481-1-francois.perrad@gadz.org>
References: <20240909162703.3439481-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1725899274; x=1726504074; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b8enbi8JYmMqfIZg0y2NUFxLVLhaAw6ckFrhqG3vwi4=;
 b=enKpVZ8ufZre5/0EOZB/lA3kXZFveklk+EQCSxSEa7HP9KaVOQ8nA+7gaD7Z/hsqhL
 8F2GhWhKrmXbim447WaFJnxZdi82GFcLIWOnv49/8/+xv0Rd1BsbNq+7VjbDfroL+Bbk
 gOVaDpU/vMf77XbYd2mMi7KfXI2GxOjga8RcDQPBcS234i495o9E+EJEqW87mDUh7z5c
 NbLzyj0m7biWrkrXa24kczEM988+G2Lam6avlpoClgQqq17LR8hGD6O1pkqCjt3GQY1d
 8ss8pnVj+B3Dp0Ohf7HfXcjQUZrnKkfwZVL5l6GupD26H8uF/rN0XBmEwJVACHcxFVpG
 PtzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=enKpVZ8u
Subject: [Buildroot] [PATCH 04/20] package/perl-devel-size: bump to version
 0.84
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
 package/perl-devel-size/perl-devel-size.hash | 6 +++---
 package/perl-devel-size/perl-devel-size.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-devel-size/perl-devel-size.hash b/package/perl-devel-size/perl-devel-size.hash
index c0fbcf29c..6a5d88af4 100644
--- a/package/perl-devel-size/perl-devel-size.hash
+++ b/package/perl-devel-size/perl-devel-size.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  0b5335d69402c75d5ab9978027ae2f66  Devel-Size-0.83.tar.gz
-sha256  757a67e0aa59ae103ea5ca092cbecc025644ebdc326731688ffab6f8823ef4b3  Devel-Size-0.83.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  4978c07f54a730b16a705e074d7685e3  Devel-Size-0.84.tar.gz
+sha256  db2e4d65f688dbf59273b5e82101ac3f1a66f665afb0594dce168b8650a4d0e4  Devel-Size-0.84.tar.gz
 
 # computed by scancpan
 sha256  fca4ebe3a1f329aa33a4d259c0a5b136a15a40b987c60c2dd6f1007bb01a1513  README
diff --git a/package/perl-devel-size/perl-devel-size.mk b/package/perl-devel-size/perl-devel-size.mk
index 9acc67c9e..85ee2483d 100644
--- a/package/perl-devel-size/perl-devel-size.mk
+++ b/package/perl-devel-size/perl-devel-size.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DEVEL_SIZE_VERSION = 0.83
+PERL_DEVEL_SIZE_VERSION = 0.84
 PERL_DEVEL_SIZE_SOURCE = Devel-Size-$(PERL_DEVEL_SIZE_VERSION).tar.gz
 PERL_DEVEL_SIZE_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NW/NWCLARK
 PERL_DEVEL_SIZE_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

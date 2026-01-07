Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B83D0D16E
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 20:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C0CD40A03;
	Wed,  7 Jan 2026 20:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lG2_okt3ik2y; Wed,  7 Jan 2026 20:00:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2BEC409CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767816029;
	bh=eBbhK0utQQ9s1qFF575J74kbKT5CMYwvJx13mmzAuhc=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=iOz16K7/Kq8hrM2GU5qsmbczu7UG6a8kVOSaG8uuI2FfOL5gGCU83SgOt2j42sjZ5
	 Qtw6q2ciRO53x6/ix1hM/tD0l7+oMwnf0zh1n2oGcFbFY6pipK1K7qIB6EBSOo2n6+
	 wr+kd08iFapQC8CYXUb8T8+nlHkGQUHwhK6WYIL/ikOhFOkv66+cvhTH8rjvYecwPk
	 4M0c/o5fFGl4f4b+d1OD17NGNgLjTkENK4BkYErRqq9HhB61q/qDq35z2gxj+ncO6y
	 K7V8PPYbo4UxzTuHggMFFPf63mPLiZbi4b0yzMhz3OzT8NTJkIBMoLvINCLmfLz6LQ
	 zztHCzAv/yt1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2BEC409CE;
	Wed,  7 Jan 2026 20:00:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EC179ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50C858220A
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7aYUpmwAj8wh for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 20:00:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 489B682219
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 489B682219
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 489B682219
 for <buildroot@busybox.net>; Wed,  7 Jan 2026 20:00:24 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47d63594f7eso15413005e9.0
 for <buildroot@busybox.net>; Wed, 07 Jan 2026 12:00:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767816022; x=1768420822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RZhfU8axcAaWJo3+bRr0iYHBHg8HZRu3wYV5ZydSERc=;
 b=May+fRXyKGwclLtJHTJHdnBGkfxkLgJNm621hUkw2SXkLwrvPFbxnEbUJD94QtZcK2
 wBh9Yo5txZMPxQOvLd9+ACI6zcj67sS16LXV4IZtbfqFHoy4/F8r/2yK21q5ZEnHUHc3
 tHQMgpniYRZU4OIAkmRC8c2ovKli0O82Otcmn6VsNy9mcymOzZP6JXU0wWyj32FqNofs
 Gd6QKBg9wtBmCvT819xC9+6MLW3GWcAjyGtudb3Rw6yQKXPeY9XOrphGVYJEL2CKUwPU
 i/gzT49qJIGL28ZKl6l7yRg1ylM7KwhV7xTnI64uH84MTUiM2fOfVVnZrzqN02kQ7uY7
 y5ZQ==
X-Gm-Message-State: AOJu0YzVsiESeS0SChAv8QlV9oNxQJsggMNEiJYKxU0d6K+XGvDvGWec
 533gpyGkpS/Ewkd1ZWVpuumTGWWXlGdmak7AvGCropqokqFFnrV1RWF3z2eT1EA+dCx250f1F6N
 NRTSISw==
X-Gm-Gg: AY/fxX5G8SHX9GLauS8WtFJf8QJ0d1MBaJaSstKH80WWpY4YURgZok4EOJRDh96sX0c
 w9lLgbL6e6v7B8oK3S6o+MBnzvUUaTOWYS64Ms1M1++OQQmYbh3TKSmTBDfT2OHh4Nq9L8r1bvZ
 RQFP9qTlocOQnm7uSGgvUNk5uBadH/FSB2Ybw9tQqmP3fjDZwKR6kc13rHY6KN9qWRzKndXQUcq
 1msfV0qB1d3ok3HJ+rEPP5IWZa+GlgkF6uK2u8Dgbq0Mprqnnbvkv5tmt/iPDD1cB81bFt7J26j
 FMEYUtCSt5RSM4jThTdjvAQuRM7m0pRfpR7rF2KvpwqHsJLSKB3QoqbIFNHj+xTGlEQxK8+ZfeY
 5LO+n+LgIP3w7rMo53eWb5ExhNAopA0XsaBCgWgrXle1kTkDf9IhKFriocwePfokfFs9bVzPfRC
 oe7k/d9MIxoRqM4IvWRTO0gFCw2m8/Oe1Xxdw=
X-Google-Smtp-Source: AGHT+IEt87pFUh3JgkOgootz6ZWIoMMweUMsgdU1BRmh4kjt8s3iitwWKA0OQxn7Heh2m9+arg51gQ==
X-Received: by 2002:a05:600c:4447:b0:477:3e0b:c0e3 with SMTP id
 5b1f17b1804b1-47d84b3b8b9mr44350165e9.32.1767816021710; 
 Wed, 07 Jan 2026 12:00:21 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8719e695sm18987435e9.17.2026.01.07.12.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 12:00:21 -0800 (PST)
To: buildroot@busybox.net
Date: Wed,  7 Jan 2026 20:59:52 +0100
Message-ID: <20260107200004.665611-5-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107200004.665611-1-francois.perrad@gadz.org>
References: <20260107200004.665611-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1767816022; x=1768420822; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RZhfU8axcAaWJo3+bRr0iYHBHg8HZRu3wYV5ZydSERc=;
 b=JSllSI8l3i8Ciw+noAWg1YQT1U85jNE70MsVmU4wN2MYiKYSYXT2/RpNzTgAhOtfYo
 v6pCzTRJJzZw6ptdwU3UROOpbSlZj5JG9mwjH+iTFAfBKUEzwUWnAeWLJOtKM4ULzSD2
 JfC3LBaQdo/tMIoV5nn4cvWbdEhHY5kAKR0D5DSMo2V7ycv70Q1YxGi7zJJLXSIk9RSF
 e1SYUQn1eQhiLGrCIAO/e257Tt8FI5fyWA5Yeyody3GyWMJjp/IuSK40avV0O9/Mj3pB
 x4K66IfWutMbUe9F6Vz/oxhHqAnQzp5MIiJ86aO0hUxHYz2S+2az2WcpkPcIanjscBVo
 osFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=JSllSI8l
Subject: [Buildroot] [PATCH 05/16] package/perl-mozilla-ca: bump to version
 20250602
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-mozilla-ca/perl-mozilla-ca.hash | 4 ++--
 package/perl-mozilla-ca/perl-mozilla-ca.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.hash b/package/perl-mozilla-ca/perl-mozilla-ca.hash
index 35bb158d1..bd396d1de 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.hash
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  dad624e6dce1d5f87dbb6268395df180  Mozilla-CA-20240924.tar.gz
-sha256  c4b1412bbc37dff8cf29af6f92cb47defbe90eebcbc29e407a98638f7a31bcd0  Mozilla-CA-20240924.tar.gz
+md5  c28848458e8ae2325e46b15a243f1918  Mozilla-CA-20250602.tar.gz
+sha256  adeac0752440b2da094e8036bab6c857e22172457658868f5ac364f0c7b35481  Mozilla-CA-20250602.tar.gz
 
 # computed by scancpan
 sha256  95cd63dae5c2bf6e7cf33435981614a36c85ef01fc7a02464e05e58a5355398e  README
diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.mk b/package/perl-mozilla-ca/perl-mozilla-ca.mk
index ce5664996..02b4cf3d5 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.mk
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOZILLA_CA_VERSION = 20240924
+PERL_MOZILLA_CA_VERSION = 20250602
 PERL_MOZILLA_CA_SOURCE = Mozilla-CA-$(PERL_MOZILLA_CA_VERSION).tar.gz
 PERL_MOZILLA_CA_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LW/LWP
 PERL_MOZILLA_CA_LICENSE = MPL-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

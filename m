Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB705606A326
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UCmNWYQC
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCE83817A7;
	Fri, 30 Oct 2026 15:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u7X4jGaRySnu; Fri, 30 Oct 2026 15:29:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C3743817B2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374158;
	b=BITcRL1tUpAtxr5rVuuZUYQmW10GCIK57dmQxsQBEkXulCcKhFd74W36OBZv+kjzteWo
	 4M0JfymmhU34seCkjDxWSsqjB2e5pK2oL3XrKdlx8u9YSQeP3/YmI87NyqSwbpKXKPq/M
	 kHuaEPOpAubVT7GF/ITRSe6mdYacoSpKUwLhePgLGkVwOk8cwy1rz7BiyIDbe59tkKOw1
	 sDBONjWvinXvptJK+6ZR0EuudeFQxSaKQmkOTXd0hztMdlivYf2AUwkTvVDRFsfJRztAK
	 ZKVVjXC/x8AKJ8xDBLZQ+OOZXX6QhmTGtdBIdSvUtT3ZMqSBAwfPA4xEogeZkuCR6Vg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374158;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ocUQo0QmB/4QefxQSxpiYMllVCYDT4fHiScNlKYTe/g=;
	b=rZcGc9u+tebmCZ0qCayU96DAumML6NiMWoSk+zlC7kgph8doADuyvH6CupxF4rW/j5dZ
	 r2wZWZU0QNvoUjOI9WIhyZ0Mwc1IdpHDUC7F07i1ojDn9NbCcgNI9isAA5hGIrUZc6b1e
	 8NA1cW+3tWQ5SDnotarZ2jGwIE4+w5e5Xe/PIJGQL3oYXjwWR2VxviejvpZ7/WG3fMM4o
	 vAJUSkN4PBk097NIiGaRmoMEJzAb8AE2oxIsBvkf5afuJY4Do4CZftWFtgxmpDwri1FN3
	 b4j2wBYHwCLXRIfwJ7we8f46sqs1z4JfVcXWEhYeJYXOIjaYTFVBnQzPqF4CSHwCycA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374158;
	bh=ocUQo0QmB/4QefxQSxpiYMllVCYDT4fHiScNlKYTe/g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UCmNWYQCOxkW55xtiVYWdKN/w3hMhYBwnGrS2H9VkVZZHaNbHJAf6QzYsNfjXWQ7/
	 53Ht8ghqs5oK5qAJpESHy+Rvj86nmAMw26ucQwTFKyPxvVfNFblMiBZL1kxXbu1TUv
	 cFNtwfwUfHjUSYmtYeJORXvbic5aoBdwS/zIloC+Ua3V0QywNg9E0BE2PqyczKvZQ3
	 XgkhsSTzBsXQHZnKaBgJJCm9AtepFxPWJtaqxJ/zAfDFqUsRY5jTjxnlCWbOoQpGJt
	 YYFrvynd3WZXkColtLAWQyfHWE6QA8RemtE7n9ObphT8ransHVfUGQDnGDE5W/5ROq
	 VvlXX0BJnOrMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3743817B2;
	Fri, 30 Oct 2026 15:29:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CE2BD38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E9A740CDE
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rH1WBgBImcHe for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:28:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6237540C64
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374104;
 b=kP5p6dfz9tuNppohmux8B8qF1MzoKMy+qMqLOohsQaCB0uX+sQCd2DjCEsraEl5wgQ5i
 c1ZwqPBSv5ccUgxtvVaNugNtO+Mu//FaviitFYfIi8sZAHHzfgyNnata9d+lGih4pOxvK
 FtDi2mSZJtGJyx9K/PRE31M4Jy0eSBhk5iYWbBDQaSYkB1DgsAMLSNcZWqpoteN+qNsa+
 /cOA92HfSwMkVx6UgnbATyNMyZZdp+umq2BR9xM9L5NwJXfYvl2ryjbDNLED2mB7V6vkn
 A5dTfGXBzZdawZpkURmm0rx4mLdVf6LQtrezYSqLUCxXCcBvWoXpBZj2k+L9OtCzYZQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374104;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=yS20+xctqatyqUsiu4vv2qLworxKtDef9iLP2nr0TnA=;
 b=EREZv1t+6tdwEuKTotb4Wja+UWLI1+nQgc+uGblrDrSP9dpDUgSqYIyRTkABWXvHpKUy
 wRB3LHkAHPe1wPmryBTBkMyhyMVsxJ3WMJT58phXYIeDEKiWKuUrr+pDyMWj9l2F5ftaq
 nfK0KUyn9PApkSXEPR826VOLJpraYjEvwfM2dCAyJnm3/gbhRVflNO2U574v9sa1SOnys
 v1Td+A673TJC2P5dTBcGf4jSu740uHDlQNtp873WK61VmYKOygdW0W++C/4gWpD7+s3PK
 6cR5E/Pym5PWDBjQVKj4BhCZMcoIIRTpj0oCrKZTtpREcUEVZsZ1haytICHbldpOu9g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SEewGYFE; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6237540C64
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:24 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-48dfaa3fa12so1172938f8f.0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374102; x=1793978902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yS20+xctqatyqUsiu4vv2qLworxKtDef9iLP2nr0TnA=;
 b=cFMXcgwVq54F6JbXsjqgZL/QGS+ADNWGLuwba04D4Eu+PBuYDJ9H7ETr64bxF+AHaG
 SITiZ9E0aQzGfxPrYWilJYkDTctxpH9cfbcXia2fXWpD/SalldyHYkZ7/4H0/7ZqdiCA
 i6knYLl2z+lL2Yuw7oXwkBzvVfu9dO2OGXV3rGct6TLhJSZKLLyO0GkMVklJgAYpRsTx
 jcZ1xvuIv5oxCMCgvtkC5rVi6b+u6Y03HKc0zHiFrxAv9Xc5j5ozOXTN3L7VE3vSIBc4
 N7qVGQvdi6YsZDvHf2LeCLWub5Tp45qsYIMO/BTd4MocugkYVr3x+dwE/2EKKdVGCOAi
 VzYQ==
X-Gm-Message-State: AFq9FYKyfqGH89evUVunQDjTC7ip6GDUH3Reaq3Ni1XMQQ+bJbLZauzK
 oYN6p5hHoQhSa9K8j2OQgflmpJImD6Kwl9otxxTESzzGWhdDZVUx9tcNzqY+Yxf24GwKht9e0M9
 X7o2dXWU=
X-Gm-Gg: AYBFou2iqLU5lxhdhlbfWoC9h8gxPGLUGCC5/nc77efXB18N+S0t6ITaMeFmiooyK6J
 QNOC0Ij9OXHMEkEX+9TrO2IHlas4aweMrkZ+ggOJu3Uok32y3Jz+hiXzD5dTqBVZWfIjDYSjLrx
 K+ohmaGT9HZjr5XZRP8t0v6jDk87pRyj/RUdOS9Oh9jBMZTpOvUedvG+wBMLbTULUQvM7pM3UKT
 8Hzv2w2ZuEE6fNjCyyWFRSZtczvZJf1XdnQq5yTB/HMzpkMI6ztuH1y9jASh5MbNhrja8f6CGn+
 qMoWMTOCqScajtXFdA6ip/R3qFSRPlP1n7AtpjEX/XHMtxtRiAl19jd2CBciBcDJf8ZNP+Nakqj
 A01P+mVhONtNBISI7UasU4plsmv/27X9hu4ujeqYYmXB2hfNc2vtV8iGnkdlxb6C7uTTKMzlFhH
 keYKz4FhAxy3+Od/Z+bAjLKl22NaUYCCP4ULMVmLJq9tlEsmSDy1ui9Nj1ySpIV18SZra5QIweg
 UOgcc7NxzD4QsjCS4LLBSqTHSPmvWxVpoXINQsgz8bvVGYV1BOV/xpx3kjmIhMiKrtWo1bqT43g
 6+nwN7dOxoU/fLYBJWphqnGH2kc0E1pBGRyh6KpvQsEispV8p0qt85Nf+V4LMvcUC6AwlWgDFQ=
 =
X-Received: by 2002:a05:6000:2283:b0:48e:7475:fe7b with SMTP id
 ffacd0b85a97d-48e7475fea6mr2755204f8f.6.1793374102208; 
 Fri, 30 Oct 2026 08:28:22 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b78a1dsm3706202f8f.24.2026.10.30.08.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:28:21 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:28:19 +0100
Message-ID: <20261030152821.1907282-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261022205205.3030927-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: security bump version
 to 3.14.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> https://www.python.org/downloads/release/python-3149/
> https://docs.python.org/release/3.14.9/whatsnew/changelog.html
> https://discuss.python.org/t/python-3-15-1-3-14-9-and-3-13-17-are-out/109595
> 
> Fixes CVE 2026-12345.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
>  package/python3/python3.hash | 4 ++--
>  package/python3/python3.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python3/python3.hash b/package/python3/python3.hash
> index ae4a00c319..20abfb573f 100644
> --- a/package/python3/python3.hash
> +++ b/package/python3/python3.hash
> @@ -1,4 +1,4 @@
> -# From https://www.python.org/downloads/release/python-3148/
> -sha256  c2215904f02b175596dc49351585104f4bc20341e1c47378b26a2c274360ce73  Python-3.14.8.tar.xz
> +# From https://www.python.org/downloads/release/python-3149/
> +sha256  e02d9ac21cebda6e46435369744a92c65cc7cd8669697694122cf97ffacd1e53  Python-3.14.9.tar.xz
>  # Locally computed
>  sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index b86453f145..1916982dfe 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  PYTHON3_VERSION_MAJOR = 3.14
> -PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).8
> +PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).9
>  PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
>  PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
>  PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

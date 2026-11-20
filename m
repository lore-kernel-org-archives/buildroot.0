Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10A7606A325
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 09:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qKlnoiI/
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D178C80E6F;
	Fri, 20 Nov 2026 09:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MCJ17OZsodQX; Fri, 20 Nov 2026 09:59:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0DC5C8135D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168799;
	b=QGSfxwhwBWdEy1DFCY9OqH8dZsuAyGyFwkrdMAIA1Vn0bVRgqvcjL3VKFEnbARarkMGV
	 OhR99tmy4Xks17ICMWxpAoORSTXjjJ0LvYZUQ2B+OfVHYdsYgAK59kTmMuSDajdW+P3Xc
	 xFDW9n3G/W07rCJ1RR8XysoG4oUOyxT6Y28Fz5DLE6Z3oaECOsC5UPYFYwyEUtpEAFf0O
	 53uG7APTVNHV+Kox23JqD/GFEHL/iLb1VMUPpbxnbuhJladSE+qa5QZ8LkHFBsrAVG7S0
	 /L1Iyp60I9RVFXuejc8B3rXkZOXVjxpcUkZmebI4QblpaQMuZwlboYpdZpT7YM6b6Qg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168799;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=cT7JZcacdN0JJdMM8wbKz8GLumgRbN9up5UloBn2AGI=;
	b=V6Qp7BAy9VKqlSoJ6IgzH9IhV5AP9zbdmtvO+O85ZDvgrGqZRe24orm/IuMgzO6vt1i+
	 crXdYnFHMrIztu6ZCno0CWWktb3NlS87KHbJoEoxBBi5XFQF9BZ26CFJ622iF9oCIe/Vp
	 pTNtGrESqDSUZP6LmObcPmniTvLkfICRtQDx2kQYelIStVTM5ygKIHsj3uxmQW0baUy3u
	 yS+sDrVJL5zntCR4qNLXFRYemB8XMh1zg+KELNl9KZ5gpDaFcvBpelmjp2OrBnXIZqUYP
	 9g4nd5wQlROzHJYgwhVmKjhwGMQaINTv1g8cHDVap5+PgiL+R1NpN9G9O2+5cx+ZSng==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168799;
	bh=cT7JZcacdN0JJdMM8wbKz8GLumgRbN9up5UloBn2AGI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qKlnoiI/shGnqbI5PMVfX4ak1dkyc1u1q0uZSNKiGLYtVKqcuSNksMh6Ig64tRSAp
	 180Ef09A8TTTKK5q1FS4u1IEWG8uJe4A4YyVoGviHGAjWupXaIKsxLzzXCRC/Eze7H
	 cf85MCIcycf/nATbSKLX4YtZ0TVh0x5lQTEE7K0e5Uc61TKUz6TpE0vxb0jTcjW4/z
	 /l87XRtx8/dsbzDZ5/fT60nGzHXFaeB/BURS/42utuFXoGWP/JaFoACVbUKuIuHsZ9
	 Z4fDWLB5vJEEBzaxhTxOB58GvgG/7PSKTXJTjdWEXQmQkhnDGs/7qEQPT9TiMlOJAW
	 givfx9VD+Caig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DC5C8135D;
	Fri, 20 Nov 2026 09:59:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BBA02E22
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD90A4020D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AGDotszbukPy for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 09:59:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 84B504016D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84B504016D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:56 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a35d5d4a20so6321805e9.2
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 01:59:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168794; x=1795773594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=wKPRt/LjaQmz8pYQ1RUwUl+QBRuBjqTpSfLgaFEXjF0=;
 b=EMtTMtx+IM9CfYdknd0NEXQ2fZKf2cMLC6goV8TQOfEOflp40U+yIk1iqQdG8S55OR
 I/+8ct2WUsTb5Ba/es3gXmYIBCxN/1KocPMKj3L/Mz84vjlNo9Kffr02+a9jBkXYv+f8
 d4cMQVOjj9rhWwX8/6XsyUmsYj/9XO6V0Rb7yzQMJ7250F+BOi+huLJszr9CDwCUWkXM
 t989pOI/57lgjZaqA75mNTKo23hg37U25xC6piN1Xrrs/GVhhC5vfeILvG4KixLqvHfU
 WK+VII8RuEa1OoFbQsjndcQDzTgy0aJYrWeB5UMHWOkZUTexpYdiaxdFStGDxIoWngbp
 dwpA==
X-Gm-Message-State: APuU4Z8OYFXZxhP4l0xXJ6B5pk9lZZSD4zb16Z49R7guq9XU01VmeLYU
 bIWaxTsnsnMjojcVqoCtFzfa34nKbMmoTak+/YyQV7NVdaOgy8nvhNMBHydFI3T9xLTJ47cu/dP
 MSFVs+zcROw==
X-Gm-Gg: AYBFou2YPX2d+I9ZuCIhGAB384UK9zt4Bfi2YXRGQhXcT8bIyMoGMqtkFq4I9HydT/j
 cFEIdTwurmPk6KKcyhQSnBTNh4Cpwqp1LuO/JNk1aSzp/LHfg2H3a18IVXKHGAQ60EO16h+FP58
 Yd/l1TH1jKpx03SNmmf0yVJ1aLf76zrnTp494lnIDUZKzH5E4Blkb3u4DKMwx2Q7rEVQp49/3We
 g+g5atU99bIq/P/TDhEPu3LLe27eFfb13p/oHwFMXy/pYP5Z7QBdkj/9rRt6tzk7I+/6+I9yP+H
 KfpCIxOU7qelUE7eSanZWuxebajybqJAAvLWJltkh2G2GfstrQt5nP9eUmUlzbOnktQaYJuhJjr
 KPnnryAU5KTcVckkdozXppJ7Xm5/05ztcUazETUBN0SNVKF5LFNwQhzDeLFir5P3J5d2vDpoR4G
 AFUJjCdgdwkYs13j8IY3dvmO5d3QHMHhnBr+MdU5lpdZKHVjJUtbM2+kQ0PuAMvBzCMSuqlJAvM
 nBzaTX0d+mN8IREr+Mi9dFhcSmYMyK4plj27fi66D0mU6x6JgmVDB6nH8aQzKOnSD+qbcblYCLM
 aBLlq0uZc9RwgIv75QVL+zz/Ec/pol7XnI3GZ+lJq7tj
X-Received: by 2002:a05:600c:8b83:b0:4a3:59c9:a747 with SMTP id
 5b1f17b1804b1-4bb8880642cmr55050255e9.17.1795168794478; 
 Fri, 20 Nov 2026 01:59:54 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884c3063sm73581465e9.15.2026.11.20.01.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 01:59:54 -0800 (PST)
To: buildroot@buildroot.org,
	Peter Seiderer <ps.report@gmx.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 10:59:49 +0100
Message-ID: <20261120095953.540753-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112191820.1758859-1-ps.report@gmx.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/apache: security bump version to
 2.4.71
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> - bump version to 2.4.71 (for details see [1])
> - fixes CVE-2026-119618, CVE-2026-109163, CVE-2026-106023
> 
> [1] https://archive.apache.org/dist/httpd/CHANGES_2.4.71
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/apache/apache.hash | 6 +++---
>  package/apache/apache.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/apache/apache.hash b/package/apache/apache.hash
> index 1de97a5873..23a61ff530 100644
> --- a/package/apache/apache.hash
> +++ b/package/apache/apache.hash
> @@ -1,5 +1,5 @@
> -# From https://archive.apache.org/dist/httpd/httpd-2.4.70.tar.bz2.{sha256,sha512}
> -sha256  1eefd7dc95836c5872894ce8e6a37f773d5a6764f0766869d39b8bcf0b1bafc3  httpd-2.4.70.tar.bz2
> -sha512  bcbbda8fba5a3e59d6a8b88551d401ff62f2df6bfbb5f6cfac9479ac1aa14a433d490a09e21ad164502a30bd747b43e67c7e43df4412f5dc40e1723a35e3398d  httpd-2.4.70.tar.bz2
> +# From https://archive.apache.org/dist/httpd/httpd-2.4.71.tar.bz2.{sha256,sha512}
> +sha256  2bc5da5a33c247341de082717d4ebcb5cb49e8b73a05b7fddf7d5d6dc2f8de62  httpd-2.4.71.tar.bz2
> +sha512  b0eca2692e7672226e9b80e21ad64d7eda48bd5f3a1b774e3719baaa8a38e618e0ba5a9ea4fd077db306699d6b77d4b122a1f5fdc330a105d29ce6fc96ed167e  httpd-2.4.70.tar.bz2
>  # Locally computed
>  sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
> index cee02f8d08..d6ba7fa4f5 100644
> --- a/package/apache/apache.mk
> +++ b/package/apache/apache.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -APACHE_VERSION = 2.4.70
> +APACHE_VERSION = 2.4.71
>  APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
>  APACHE_SITE = https://archive.apache.org/dist/httpd
>  APACHE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

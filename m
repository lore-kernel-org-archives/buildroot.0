Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15346606A326
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=N56cFK6e
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E342B81AF5;
	Fri, 30 Oct 2026 15:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vrzE93Faz_fg; Fri, 30 Oct 2026 15:29:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EB7EC81A92
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374182;
	b=H9Wb9ZuysW2v1wFEh/PWPYy2Digdx4zluUNESnej8HH+ZjeeXJ1SEb4f81I/f5NCbvfO
	 S88VeER5YYgXMB7vZWomrV4Msad+YHrNaEh6ZknzHMHr/ZWrdH7rosEiLJCNIZOsnnh64
	 LYe3HbbLq1+iLr4Z41xkFSBvrX5gK35PKBW9VS0GjWJ5wrWbx+8ow+fjB1+OtTMXgCckc
	 YFcppkvOCneHnbnMZLUPFPaHQvGj3bFq5s/1nMBdVVt06blRWh7npW01UlhtHJPJ83PWN
	 te9FkxIAtMU9rPvplHsV7OnDyWH9yojGqOUn+Orhrv0gxxqJif6KvzCKO4lBPZdpMjA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374182;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=p/s6ijRxt/jU0xFGSOT4Pe6UhYAAzxTe4Bs9CpZsgoc=;
	b=J7C0K5RjQNpCupOIw20dkVMkV2U0IVqkatKDWoFr31M2JWI/CaJ6woCywzRaOsNpa+JM
	 N0lpsDLZTsl3aK9vTJ+GOcXnBYnsBEupzUrbWZlfGKEVsV1H9uzzs5vGyshFLMaT9fd2T
	 718QNSvQg584aoqDmr5CprXsvPhxd+iOMB119qTC9RCroh4U3Kjuy3ICofFzShXDMlhOc
	 BJ5Xrjg7nH28Lapg2ZzG7f+OmneQqzBTuhZPM+l26mggpTJm6jyma/c6FyXl8PLF96lVB
	 aCj0hzoS7kDhVBHV3BW8lpUT1Ec8cwz+uAgQSklZLi/BMbPyd3s6WPRMSPKo1M3isvA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374182;
	bh=p/s6ijRxt/jU0xFGSOT4Pe6UhYAAzxTe4Bs9CpZsgoc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N56cFK6eiOuCKM1WdPLAwcM1qLPYUuFE67aVH4RHp6L9y5Yhs8NiqtEfF5XlsoNp1
	 vWbANQ7lUdUjKJqtqcypoNXvUcToBbh1gB6qpyoc3IBo40ARz7JtXGdBGVJCtW4uIB
	 s9OxQpkd8iGqOyEi4YMSnREbIvFOGd20ohP00KhzAbdBNru8xrGr5khUS1Ye56t2gJ
	 GQWpQKtEeXz9ulM7Pgo5tbefMLLRyLSXZKjD1hJFsI9HD0gKKEOFmFhEK1kkU5X3Zr
	 bfMkG9ciXCktsaFRS6J+Tsg64L0W2DMro9JHmViGZspVoWAeBQULF+5eaV8tKdfc5I
	 KCkHck8AZapfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB7EC81A92;
	Fri, 30 Oct 2026 15:29:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7363E235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F35A40D0F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cBIwgDtiHij0 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:29:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D8C4840CB4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374144;
 b=ceD9rURx8xKwk3hjEIXUSQmIwhNFlZmyjrlb1XniGltYROxcxfrgbIVNQP7dqxXwGzvd
 UIIA3Qc3ju3XoK4ulsLKmVnbAgh85YUhkysy7eswb7mNqRMU/18slbvUBPVnZQeqApQfT
 8Gz29s905lznKCjU9PBdG/buuZt/QYY/ADh8S//1SR4XEjF0/qlJgOOyP4TftgHsW2QkE
 6G60r8C3Q/iMr/Q5xB18Boy0poPsvHZV9kKkzNnpruFBFhs9XavAY3vn1g1QSqR4rBYPA
 2aop/WMiApb/Ya9sQbMhaFYWLHZJhBLQlVxYaY7DhCBxIFIOB/8faBPE5jy8hCNvpng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374144;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=mOGKCK44vlHZ9s/Bj6rylRvA2rXYBw7GG2LTqF+odPY=;
 b=B8ozGJIviwV2vsCopaSzhKo3KcH8EP+6jGTJ635ROIo+i7iVpWpLSudAb01eJ4pryyb2
 hBWw0MW0AKHCNlCg72uZh6DFcA8jKBZV561s0dKT51XZ0ZmZBMV47u4LLQrc1p3DWGehO
 85QKn3qITGeqTRHGrqC21gvd19v7+0UhqDmBDJWiGHffR5V1zQavvJ4MzX+qts0NrjOQm
 5ZuyoitUQXOOqtg9838vBvySwJlitb6+6EZli7wKMfVI+AuYsHDuHu/KzlqXogeK0NpCg
 v4UG6gxVLzGa3EwtV2RFwYE/ts9H0pQn7zuG7JYv5MeZAJOuZPG/7GBedh7UglpZFuA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JlCUKprm; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8C4840CB4
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:03 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-48b001cd92bso499111f8f.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374142; x=1793978942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mOGKCK44vlHZ9s/Bj6rylRvA2rXYBw7GG2LTqF+odPY=;
 b=CqTVbNyu5dv+5/IQ3nBLxsr6k/sw0MY8MSEaJyxRb9t4Y0XiTcMls0ikv7GLgHPpPL
 GkNwvelqGtF89Hiwem0A2DxMMZcFRzXJxkA1h60ztqa68ju/Mj4loLBgqga1WHakV8lT
 KT0hD7VlgutOXh8t6BQxnb3rwQctIho43dzbWbWXpkXvUi6yAVMYWF1Snojpz5L2F4y1
 SlLSi09N6Hnp9oQLlBNDH4/g1RG5XN1mc5BvIKPsmr2RzmUbHwFS/8e4RnQBu34WIeVz
 8A4fGdIhykGlICiTCsiLCc5IMyX+L7jLGg8U9g12A0LSfN4qK6F/3L/srNer6YFae2GI
 PGvQ==
X-Gm-Message-State: AFq9FYI99S4+y0qtRGTRZo6txGBvTdEVEvwWwh+lb/yRvY+opwbW1v/R
 nlgpiwA5Qprjl4Ri+owOekPf/Nh8AtfblV7URke/7snQmGFzxiZyb/YbJ20IHf4xC+t4aG6Az2/
 orHAx3C0=
X-Gm-Gg: AYBFou2invB2/sE+GsjiNoYzLwDgJYzK33p1ztykkhv90ka0I2J91unxFsJoiWQcCKh
 wYPoXkrwrB+nH5pn/EfIdB1ty2P05mLX+d489VwaKO09fKbOW+YHOp62Hf5+fQZrPz1+Zr7fYVC
 NdsxufZ/T1V6rAb30sSErfQgEGAxuIdJ1R+a1+2njsXU5zmSNM0Ko8+1ULoXEQXMLHDLNkLLYdq
 Ga5po7Jhmqhe7J9D2V/XhO4g9vZavrxJyh58rE2k9l72Ule8qLiVbsOXUZsP1RmeMp21I6wLk0Z
 fhpRWjAiYDRF0tMoVI6JfOQJIlZOcbeg5zff4gQueWBWHzymFkU9cLyEF9KBEdylIC/KhO5dNf9
 SsWE3uQTEXObDiUO7S21v3QfjJdEYm3fojwUWUCKXuP7aqQQICNAZoMrx/FgfMXL92qAyjuQ7bI
 SpbTVTwgATYdfoH2Wo3rhGFblfLTi55w/HSwwYanSIpR6AyRTtrc19cAq9mh4vK8unaQGUJ8j75
 UZLZahi6dQbryAMnS9U1cRk6r7rfWmvE8DgRiY0jmzix7RoDFORHlmB+j/rwpmIJxC55inorBoU
 h0nLuPJs0+GK6tRZDwRfgKm7riUJ5BuW1a6QCkDiOyAX/MwZjgeG8v1/VzrmdSg/tv+CSe+2yA=
 =
X-Received: by 2002:a05:6000:4710:b0:48e:eb5:4976 with SMTP id
 ffacd0b85a97d-48e6e306dedmr6152879f8f.53.1793374142033; 
 Fri, 30 Oct 2026 08:29:02 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71ba7168sm4038606f8f.55.2026.10.30.08.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:29:01 -0700 (PDT)
To: buildroot@buildroot.org,
	James Hilliard <james.hilliard1@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:28:59 +0100
Message-ID: <20261030152900.1907663-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023181818.920329-8-james.hilliard1@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/python-certifi: bump to version
 2026.10.23
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
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/python-certifi/python-certifi.hash | 4 ++--
>  package/python-certifi/python-certifi.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
> index a583c17bae..96b977a4e4 100644
> --- a/package/python-certifi/python-certifi.hash
> +++ b/package/python-certifi/python-certifi.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/certifi/json
> -md5  f64fcaadfe9a0ced492ccbfe88bc4a27  certifi-2026.10.19.tar.gz
> -sha256  035c1e85572b141bf1c3a3eff0e33a8eb74917522f2559075ff8d2fea780a1ae  certifi-2026.10.19.tar.gz
> +md5  9380cf82be7f2a74885ca68665b4b12b  certifi-2026.10.23.tar.gz
> +sha256  a9895e6e2758b371e0545e321a3a8fd1fcfd9829ada8824a936dfb16aaaf36cd  certifi-2026.10.23.tar.gz
>  # Locally computed sha256 checksums
>  sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
> diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
> index bdfb8ed12a..38fa5c8f22 100644
> --- a/package/python-certifi/python-certifi.mk
> +++ b/package/python-certifi/python-certifi.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_CERTIFI_VERSION = 2026.10.19
> +PYTHON_CERTIFI_VERSION = 2026.10.23
>  PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
> -PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/a6/bd/1436c50cc46699de0230fbaacc1d1de7bfec413176099949e9d5112e88f2
> +PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/fd/11/b524cbd9bbdaca58608e4cf4053fd463417549e1959fa8d3aa18319f9555
>  PYTHON_CERTIFI_SETUP_TYPE = setuptools
>  PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
>  PYTHON_CERTIFI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

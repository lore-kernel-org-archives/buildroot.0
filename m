Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C73606A322
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PHS7MiHg
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2CF281AC1;
	Fri, 30 Oct 2026 15:29:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VcCcIzxcy_rZ; Fri, 30 Oct 2026 15:29:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C8A4381A39
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374178;
	b=fIchjRhYLyqci8HcPGqO6dHuqz2D0AAV+yz4x8Tv4TWB6UW+x1EyRVqS23rn1cp0DA7Z
	 xvG3D133QEn7nd+eBEJ2LnGqE44bXnph+1loDVyFZZQcgpi/MOWhtOgY3YMm9uhKqSEC/
	 gs83naCtdJ+XnrsLLXeU/PdfBmPFMN7V+uMN2PP/i5i1HopEWqHydOf6Y/8XuUY6GcOPa
	 cgWrcgrjCDjJB0lkDvynKHuY+GC3Rr0XKAKkVfcULt/xU3D2zuWEN5ZF5mOqNLMxMLFdv
	 Ua62ptlFOPvEeZObuU41yPSe1+uZoDXe/jMnK4LK0yJYDTE28p2H9GAJHbyjvaBQ0TA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374178;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=kTeNVuwEJ7JWanciovt/VI97hVphNiuA1hstNzQ4YaI=;
	b=q4UkcouqzLRMyjUc8nUKAAX6QQwWzmQyYvjOjHV74XMYNOM+zqfL+6Qq0r6P8iESPV8N
	 hLs8PhATPJPJHIJWwfZKoGOYRxx1xEJ7bmTbuBIjWc4n/rEUJUXKo8G6Bo2zJDsP8VFSQ
	 qt74kcd3XuabIF2wFq4Vgo5voHwt89llbrpddnnDjmvrn9UWcOPDFubGzkNiCZWeZPSHe
	 kScm7Eo79X+JkoTF05JkyG9RFQGTHrXEbcS/4O/fHxTXpCqSIeaUyWiJEOgQzQX+xMogQ
	 BQfU7t0O8t3LTmw1LI3GpwKK7K0Sb3/YLwhgoWQDf4ibkppoEL+13DEIOh/7fZylAug==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374178;
	bh=kTeNVuwEJ7JWanciovt/VI97hVphNiuA1hstNzQ4YaI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PHS7MiHgDoSkFcjw9H4yYK9QjpCpufzq4Lptm18w9COAm3fQPU7i5ejro2Hr/VMD+
	 RMeHAqJkjiMhf0L34or2qXfpqQQcDzBOm3nV8I62l6iDqaPVBgmbSy8hkTHPP4P2ni
	 4tf5IU3i5jOWR99exf6ddZv4RYyPoz+WjZ9VHoNFTdGB61FIwR1wFLFyh/oimUiehg
	 +KmT+T/1fx6BFwwDkrAbLI7u6QFViTRV4kUQ9lTWNytcNRYgmSAJWtl5vstkWgMhiD
	 DN+xMcxk4lppSoUSWjTowQU/yMJEbNRvff+7dL3anSyNklFtGipbY89297EqbhH4GI
	 fV5dBUUaFb2Rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8A4381A39;
	Fri, 30 Oct 2026 15:29:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B515ED38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AF6940530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bY-0acDaa7vC for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:29:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8DFD740211
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374140;
 b=Ie/hz0KRPCBi5EJfCPzimNGqfaw2dQzn05oaZrF2EiTB9g70qsIkcAI/Do+zan1UjUy4
 owkwplBVVsQHaCFYGz3g3IECRHYsxTangJZzalYSP5YJ22vb9QTVPgWUOA3N69YGEqU0z
 CLp3YrJFwe4/64p3iR/FOBKlA3a0F8YGr8J63xfyz2vZSe2QlDZNfmr4aAt3cnSM28vxW
 NaqKMWWsJKXh09buSH5WBtteNyNlHgz5oDWu3loIstdgoUEyYIs4a5ZoycFoMgEkKkLCO
 kZL0o1gdQbp48NHyGhH21mF3BExQviTZv11h5t2wsJZdbXdwZdARozSudrEvGcJ3Obw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374140;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=x8LSCI7HnW//qiCHAWhFKSiDBfCmaccDGEXQkuSBiHA=;
 b=QLc22ByaWisPp/wmcI88y7e4CZoMounHE6bN15Hmey3xE09fQAYX+3DeRHD3o4e4Abq4
 3erQ8GwZt7saPX4wn09Is0EkYSPOCcTKP/lqEkfyACYZOcqf6Wi8d6ZgQGpakhu+GYoUc
 7Ylega5SHcC7OcMwffoiizoaSACqC8v+Gf9bZs9Vu4bYBHRrr1oihpMP0g1KKO1R2hGH4
 4++LsW4avxkQ7/j+9FS3u8ELWNPvEfBRTBHvZ6daHQ+ID9syxv5lyVpNnBLHVJapgDYGk
 Q99f5kf1wvqZnTeKECC8s/LA+z2lQY71c4CXBVDSIqhfb/4B3Tzk25npxF+M33BXbdw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=gHpl3vq7; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8DFD740211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:00 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a3517554f7so7257395e9.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374139; x=1793978939;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=x8LSCI7HnW//qiCHAWhFKSiDBfCmaccDGEXQkuSBiHA=;
 b=wFFKJ9bdNPE88zqa+Z3iQdaWPEho0D+rHyIZS4yXSJGV/SdAUKZaEkpZFIOHl67tGk
 num+dhY2CNPPwS24E9CqPUQilk2FK3kc5ACmoxuigSInHP0ifgezX0zJJNtKdqp/iOFH
 uyslTHUomSSfQEJpUtwwT1xH7oYIoRdoQ4zQfg1wh4+KEwt3U/oR9u6ozcQwENpXz7cI
 7s9b1MrWXKZO8bLcoMkb6mhY8w9pg8xicNZNRCkAVOr8hBL9tKuIBoCBssJEPOLApw0x
 d+0zcBdrUKfKFPehvKMrDYWJSX2KcWiySYPXtUZ+x8vjMcZz66fPuP1PhrdhBwwcZnp5
 qf9A==
X-Gm-Message-State: AFq9FYK9tzM+G1V5/ubHQMi5yiC7lG1zoeaYXjNJV6PwVbORsR3zCmsq
 CK6irHLFWtrku4+tjuAl8ghzZIt+s0G6+FpRfx7afNR68u5CtXYHAFiyYvr/Ya3A26bOIHtGcJN
 /KV6uE3w=
X-Gm-Gg: AYBFou0S2fUygEBJ+LllhrJU4QAIlx5057kYbDpgJtYaKLA9SN7VlYsCS0WV/PKryom
 ICVaSHd2fMo8E8AFPmRr8InrRCk34eurA22NX3BhS+HIjcWW/GliIV7n1BM3d8WFkHD5sbb+kq+
 dYIvkzT/NjbkpAj0dKRbo2JUUKnXPwWLqa/3dwNb1kaf0HHmaek98rDT/pWc8bn5+Dh2H7rZm82
 ijGDkIxaSQwQ81HkzY+R2GbMmPojT73n+iHgBdoTDP1KtFgOD/6f7hMmRi2KZc1nOvqZaDdfC4e
 CfxPWJCYa4XTjuETKB/6OWu4wTLh3so2aexDDlsNl5sbuZ3SRbXHdUQNb8spNJlUQf/jGq1PGec
 iY+NymH5BE2v0eQddHIVzM/Tb91TPsaXSqvTbuCJPEu4mKTgDXfau1MmYdxhirfitRaJnDr0jrl
 2aH/HvWHW2FCAxJ4w2jnhQr/NSe9uD/vOnLqlrHtswjS764Nqbg83b8ibxi/kvbuXmE0XEG31ca
 Dn7V5WMTVRk6TuZ2EsiARIv1zEriDi+vtS/iTrEf9Png4jQTA1njHhPSmCRJcywlVUM9GukavUG
 ueaQcCsf6N1Rxybdt+CYVxh8CbNVIq93PzYGwq4n0s64pwNDaUf9+4SOcoyvmq6eqvm5NMYN
X-Received: by 2002:a05:600c:698d:b0:4a2:994:575c with SMTP id
 5b1f17b1804b1-4ac185bcc4emr58541225e9.34.1793374138785; 
 Fri, 30 Oct 2026 08:28:58 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf751c2d2sm73008165e9.15.2026.10.30.08.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:28:58 -0700 (PDT)
To: buildroot@buildroot.org,
	James Hilliard <james.hilliard1@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:28:55 +0100
Message-ID: <20261030152857.1907631-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023181818.920329-5-james.hilliard1@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/python-brotli: bump to version 1.2.1
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
>  package/python-brotli/python-brotli.hash | 4 ++--
>  package/python-brotli/python-brotli.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-brotli/python-brotli.hash b/package/python-brotli/python-brotli.hash
> index ed8eea72eb..da2d58aa44 100644
> --- a/package/python-brotli/python-brotli.hash
> +++ b/package/python-brotli/python-brotli.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/brotli/json
> -md5  af164f216cba527bf6f24d09c9d3576b  brotli-1.2.0.tar.gz
> -sha256  e310f77e41941c13340a95976fe66a8a95b01e783d430eeaf7a2f87e0a57dd0a  brotli-1.2.0.tar.gz
> +md5  ac1e85a7466ee46d0ca594e041d7ca78  brotli-1.2.1.tar.gz
> +sha256  02b2f7b5a83485efe448a44ddf7983def05c3bb1dcf917d4f7154070260e13de  brotli-1.2.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  3d180008e36922a4e8daec11c34c7af264fed5962d07924aea928c38e8663c94  LICENSE
> diff --git a/package/python-brotli/python-brotli.mk b/package/python-brotli/python-brotli.mk
> index e2343a24b2..6f5e966a05 100644
> --- a/package/python-brotli/python-brotli.mk
> +++ b/package/python-brotli/python-brotli.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_BROTLI_VERSION = 1.2.0
> +PYTHON_BROTLI_VERSION = 1.2.1
>  PYTHON_BROTLI_SOURCE = brotli-$(PYTHON_BROTLI_VERSION).tar.gz
> -PYTHON_BROTLI_SITE = https://files.pythonhosted.org/packages/f7/16/c92ca344d646e71a43b8bb353f0a6490d7f6e06210f8554c8f874e454285
> +PYTHON_BROTLI_SITE = https://files.pythonhosted.org/packages/cf/81/1546c983678a9b4e77cb4718eaedd1b2caf24a6cdbf1eb8775938d22aff7
>  PYTHON_BROTLI_SETUP_TYPE = setuptools
>  PYTHON_BROTLI_LICENSE = MIT
>  PYTHON_BROTLI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

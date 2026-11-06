Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E0F606A32D
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mvYtDKo4
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB654813DB;
	Fri,  6 Nov 2026 16:09:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x2JgmtY5rb9j; Fri,  6 Nov 2026 16:09:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C866F8196E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981382;
	b=Ib0MDT1w+Fj/8eZ7jNNfH7A6TfVgKbcF9xip1YOVbtbfJhlcoWjErAZEUAJxBMXkP+2Q
	 JrwhdDa/4+MsqGrA1Jf6r/Xas28NiYNNlk9uL4EFpB2cP3loI1Vh5TDAbqrgL70Jy1y9X
	 hacmBmsRv+apYG/MiYHwJvQkQVm9RSaui9TijOmhXkZubr7XV98aEM+7615IxJi8hVN4e
	 XnvdFBpPHHcTFyqW2XK8yjKFJsWeMNOxSC17rBmfOYyCWK8IP7VKtiEpbTCpHn6oi5/Vr
	 qGgxPLWav4u8taiAkPLLlnvA4mJwoCOqSAvg2y3iKTzAhLStHE+DoiIpaRnK4kYSawg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981382;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Xv1LEJ//bkvCh0HsYkJGo8T5taInZ9xiWrWd2qHK04I=;
	b=ID6Jgy1wpsPqrGqNRrh9djzclqVfPdqZb+QfercKpBlw2jtYzEggiyImKW2XPWew4JMU
	 RgoQJklf86aMxcxXAVZpqDOeo5qH/DEcLyy9pBcKX56rQt0gtjFUVSVOPQ/uj3xRDxoZs
	 kfypnu/nx1wWaA2/NpXNtj5vPF4JBpouaw5e/72QdeMIpr8z47WYwjOVwLBcDmKoO7a8F
	 qkYh0EmYTvVM3u0e+jXjZkfLbkmRgeeY02s0EBGmXjPDKI+KDIWg3WbAdGmINSAOaZuxs
	 32v0yGD/w3hOuw15/e4nf0qxkl9kRMrz57rEB0Q1Bgv+dYMH2AiiDzrkUsHPDFytG+Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981382;
	bh=Xv1LEJ//bkvCh0HsYkJGo8T5taInZ9xiWrWd2qHK04I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mvYtDKo4DIusPsNYkoedxaf1QIjpD7Lvop9pn15OqKFGyiahJp78h0WUY4SMfkWY6
	 hMv2f2CpgFKSCUiQrQI5xJ4f03IWh0NNlOlYa+eu16z4HBogE8oL0yu+YjONyjkYLD
	 ELnXaseNEI3LrNkqfIdODuGaMl1BA1Oh56r1PIHdVQpTHhGkIM1Yz0+NoXHxPXxeSU
	 bK0eBnfMQytAV8yLKxxYRkM6WVZyjfYtxB5wjy8If6RYgdxXOsGR96I8IKSe79LxJe
	 brbuaQ2SXwe1pY/EY5CikdTMYqxT3tzVXysv7UKEvr1ZkPW2ebMIp4MVsPv8lwV7sY
	 71ugUyKyb7xwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C866F8196E;
	Fri,  6 Nov 2026 16:09:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A8804B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77DD06090C
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9GxIV2wOuQxn for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:09:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9ADB860A3F
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9ADB860A3F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:08 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-49318428d98so402009f8f.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:09:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981346; x=1794586146;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=D61K/bZQvveuqHw9E20Uhq3oqz3yZXY2+ZP8DcuEnC8=;
 b=ZtBq7sHRrn5WIAc91SJlndcBcvuIVpF16oZ8ZVriNqs5UWvmpbxfmlKMHwyiqH2q17
 etEAseXFEi49FExuKtYuCIAPiWUF4Eal+aYmc/Xh2Ms2Vp/VSyJXEyYC4q7rI6sZXGRF
 i8rHcBh/V4zNjWXn/b0QvXKwnjKjX5Yd7H5iOSi0shyVeQgGO60N3Wi2wbPJzXKSCgr/
 m38g0P822lmgvlorfo0ZYQNLCUAlbKiK0ySElqzxIYNVvKLCsshUqnUXvswU/Uqm45ZT
 ZRvyo3mkcovJk9z6thE0GwiQhVGmrGs3Lvgy9qdM4cfPY6dFKm6jzV74EvK8I+JNLzOh
 DsNA==
X-Gm-Message-State: APuU4Z/QjeC4jhhn/BVPIF7AHsS5WdieVHWPRiI44sfvhxuNCvL1Uwq1
 82xlqwxQM8pE9M2/QfjTdtEFEvaQ2oqBJmAkeDWpdQR6J9hTv9ocAgXkyXZIjtqwR6g8MUmVKED
 wBhOljw4=
X-Gm-Gg: AYBFou2LzBsjFdvfU1IetewUovgRSuav9G228ulq8BkY6aT7Ib67Pv0diCaBZG9vKCI
 ZPJigG7+4QcyVHGKNryqVJERQQhPMJAK2T2TklTzhJXSpPvLK10dyjIjJenzaEs5OExikAh0t8s
 Q8rKCZwig/DJ3wrola/OXWlQEmr7UFQ7vAXuWVgYYzric/lnRDPV470YOaDgCtDnKLlKKOxLAvr
 pj1J6AMQoIK7D8gro8h53eogDTCNO7mTVAdnxV69LsQMCEVoVayGhz9jL4IHS4lZc2/6iy4tY5/
 Qk1we0l1ScGiTl+FoEH01eVQ/3WTI1LWAb8Fhq0LBFvuuDX6eC2O1sVXeZN/2DKYdPJic5foJnn
 boBQFOIHiKxf8BfYhHbywStHPKhT3hcjFmQDUUADghE7ida0yP27gzM8GO5zN1LT850AqGBTvNm
 T4BnTCl0mW3b83Dn9zIKGGdGxXqq7ned2FegpGrEG6c1Yp/sOF27a5RqVz4dKQ4sUKKybqPrFyM
 7GI/603hYRQOVCYVL5ChEDRvfeg5EhkSg+tGfN7HauE5whPojJSzxMggljWPsKHSH+gwycFRe6A
 hot5bcoOjVok85fwt6CnKLNhVCEtaV4=
X-Received: by 2002:a05:6000:161f:b0:48e:5071:420 with SMTP id
 ffacd0b85a97d-49272d1bba0mr4044262f8f.2.1793981346267; 
 Fri, 06 Nov 2026 08:09:06 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d7cc6162sm4359424f8f.47.2026.11.06.08.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:09:05 -0800 (PST)
To: buildroot@buildroot.org,
	James Hilliard <james.hilliard1@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:09:03 +0100
Message-ID: <20261106160904.606987-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261019171854.734871-7-james.hilliard1@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/python-platformdirs: bump to
 version 4.13.5
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

Applied to 2026.08.x. Thanks

> ---
>  package/python-platformdirs/python-platformdirs.hash | 4 ++--
>  package/python-platformdirs/python-platformdirs.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
> index 4948b75cd2..641b1e62f9 100644
> --- a/package/python-platformdirs/python-platformdirs.hash
> +++ b/package/python-platformdirs/python-platformdirs.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/platformdirs/json
> -md5  528f5df1ebe17cd5fc2ba3ff1d11fb97  platformdirs-4.13.4.tar.gz
> -sha256  dd96496961684a7f42041923f842ec7494e09f5e87aded99117e1109cd40570e  platformdirs-4.13.4.tar.gz
> +md5  9df73f0389c5b7093ea0c73af181eb95  platformdirs-4.13.5.tar.gz
> +sha256  05831adf87d392760f4b5c3a0a95579ab5a10b18b9b9bd43680dcb47544788a0  platformdirs-4.13.5.tar.gz
>  # Locally computed sha256 checksums
>  sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
> diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
> index 2e543d68f7..55aae1e1af 100644
> --- a/package/python-platformdirs/python-platformdirs.mk
> +++ b/package/python-platformdirs/python-platformdirs.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PLATFORMDIRS_VERSION = 4.13.4
> +PYTHON_PLATFORMDIRS_VERSION = 4.13.5
>  PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
> -PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/b7/89/dfd269de936e76319cf27787d9eaaca513491f635d49b0fbe7cdb6d3bf6f
> +PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/58/e6/d0abbb256b44e6a05748c6942511ff67db8dbb068de0c35b24bf1b395b09
>  PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
>  PYTHON_PLATFORMDIRS_LICENSE = MIT
>  PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

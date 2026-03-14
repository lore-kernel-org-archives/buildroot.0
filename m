Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B0D10706CD
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 11:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92FDA810B4;
	Sat, 14 Mar 2026 11:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NHaTSbdAmAot; Sat, 14 Mar 2026 11:16:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7864810E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773487005;
	bh=/qdSJKknBveLj9TEFJ4ZVp+S5AGNBRFzH1R1aj4tqyA=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=rasCck4cHAX3n9aeev4HJ5xc1wtQRjJ9gvQ/HCOyMOSfvatlvkhGeAy1zryIK9hWR
	 JRrk6j/8uU/uOiD49uzd/v/NPPw/367iFAVXflWn2DOzjRLri5GlpW6CNbeC84OYeH
	 JVUTHQiXJPZCZyu1+GIvdpaViPRKI+Mf6JtUNIKTuKEE5wUH2MAvCUP/toXfSgNPHA
	 Zj+oxGHdMJRwajxi4f78rb1WUGuHsmYRZzvWYiSSpOaC8NgOPVBC1N/yCEiqQ8ePCq
	 vJPToCji5AjZSAfzEE6+ek5vEQyJsJL+Iw4IdCQ98J3B1N7OrDnwx8G0ljl2nnjJLv
	 a6qAKx8o+GdqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7864810E0;
	Sat, 14 Mar 2026 11:16:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 034A83C6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 11:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8E5F4019B
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 11:16:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xlPwsgzgnv-6 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 11:16:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4265840131
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4265840131
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4265840131
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 11:16:41 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mwwdl-1vhw9U2Ppj-00zVNL; Sat, 14
 Mar 2026 12:16:39 +0100
Message-ID: <b6f1c652-9325-4153-a2d2-e23dcbf3867e@gmx.de>
Date: Sat, 14 Mar 2026 13:16:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Flaviu Nistor <flaviu.nistor@gmail.com>, buildroot@buildroot.org
References: <20260314072049.267057-1-flaviu.nistor@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260314072049.267057-1-flaviu.nistor@gmail.com>
X-Provags-ID: V03:K1:EMPtqcIMcDu29UZNZ/8Ohz5zmCSlx+JwLKzg6ODIKsglEcYBEo9
 jWtQt6s6x4rN/EuFpWv78hkgUHFEM3RlsPNzerYb88n7p4nQqHroW4xrxxy3vSzaAj93MU1
 skMgkPM9xRY+YDWP/taKybBEGAJ5gYJ4LAu8+d82L+GPgenU51Fl3My3fDA1BC42cRijvvt
 9vcqjobqkoBUqYZ48Edyg==
UI-OutboundReport: notjunk:1;M01:P0:h/rVuRKE23I=;zgyoWxpZn4MTaGw1M0BIKdFaa+F
 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
 9bhOxblnE15+8k2MvfqFy84sGC3lp6r/w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1773486999; x=1774091799; i=fiona.klute@gmx.de;
 bh=gaDoyJQYQX6AQIGWaBHMTEpdiUdDdtrmBaEHmx+vKzc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=lcuJeQX21ZFbYbaBrI5fb/edm3WxIsDrBj5oKoH6lO8GwW5UjtxmJREfJ7jrLm1w
 DDdsJqcOWQgeLBJT4kobAgUYXsvPle3NR74Bo4fFAJjuk+7q4QfqFq4seJvtVvfeX
 kx278j5slNbCoXxqkbGJZOjfwpggiv1rraRUw+ClRPFWnoEgAasECA31SEeKNvFUf
 pthatOUkHwm943w0nGeqnvdXG27gMl66Qd34116hmyEPVPj9WmY210dmh+SkwHQes
 Sl2Avm6y+JBIGxWVkyxUwNFskB9p6tBdYsneWD6rcdq7g6DGj9vO2uQnbqSZCYWsX
 r3FMHI8actPl+/jUgg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=lcuJeQX2
Subject: Re: [Buildroot] [PATCH 1/1] package/python-rich: bump to version
 14.3.3
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 14.03.26 um 09:20 schrieb Flaviu Nistor:
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>

Reviewed-by: Fiona Klute <fiona.klute@gmx.de>

Thanks,
Fiona

> ---
>   package/python-rich/python-rich.hash | 4 ++--
>   package/python-rich/python-rich.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-rich/python-rich.hash b/package/python-rich/python-rich.hash
> index a4939b3c10..21fab25498 100644
> --- a/package/python-rich/python-rich.hash
> +++ b/package/python-rich/python-rich.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/rich/json
> -md5  4eb0893c8103200d58ad1980de396d57  rich-14.3.2.tar.gz
> -sha256  e712f11c1a562a11843306f5ed999475f09ac31ffb64281f73ab29ffdda8b3b8  rich-14.3.2.tar.gz
> +md5  0d1b254b0743669f2112332a08081809  rich-14.3.3.tar.gz
> +sha256  b8daa0b9e4eef54dd8cf7c86c03713f53241884e814f4e2f5fb342fe520f639b  rich-14.3.3.tar.gz
>   # Locally computed sha256 checksums
>   sha256  deed7c17a4318158190a3ea239cc879a5a50271cebb98ae7025f48fbe58dca15  LICENSE
> diff --git a/package/python-rich/python-rich.mk b/package/python-rich/python-rich.mk
> index 2dab5e574b..aabc3ea442 100644
> --- a/package/python-rich/python-rich.mk
> +++ b/package/python-rich/python-rich.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_RICH_VERSION = 14.3.2
> +PYTHON_RICH_VERSION = 14.3.3
>   PYTHON_RICH_SOURCE = rich-$(PYTHON_RICH_VERSION).tar.gz
> -PYTHON_RICH_SITE = https://files.pythonhosted.org/packages/74/99/a4cab2acbb884f80e558b0771e97e21e939c5dfb460f488d19df485e8298
> +PYTHON_RICH_SITE = https://files.pythonhosted.org/packages/b3/c6/f3b320c27991c46f43ee9d856302c70dc2d0fb2dba4842ff739d5f46b393
>   PYTHON_RICH_SETUP_TYPE = poetry
>   PYTHON_RICH_LICENSE = MIT
>   PYTHON_RICH_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

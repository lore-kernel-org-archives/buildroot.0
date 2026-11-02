Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A07606D81E
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 22:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JQBzzktZ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A51A40557;
	Mon,  2 Nov 2026 22:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5dm6SNXaq9IL; Mon,  2 Nov 2026 22:08:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 27E674055E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793657299;
	b=hwwiIIjx1QsiG6bqVchTRth5rV5gGzyYcgrBV3iMMMq85JL6FWzRVC1E035W8kLM84t/
	 I9VWyddi6nUZTlb+mN1sFZHGG/JvCic7FJpiWeupGnZcyyEQJaqz1lWZUQKurZ7PMo9mj
	 aSLj0wuhsr0GhOBgRXVZSBXcPX6dgGipKvfPj3Kh38hP2cXRADBsyMOEwJYHlifnS6e67
	 wa79G4JqsuJP51o7meDlR98ZMURBvszr7t4/4cvWK5al/DTBJJV4gHRxnTd1oetbaIWMl
	 qA0815n0KKLCTM4D3BR/H7Q2JcJv4DD1hRPxsfqBHRXFd9FQbQ/Oq3sXF3XfLJ6LRvg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793657299;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=aBNaQKj26vRkmc4je3ul065nLXUxqph3R16ZR4NG54w=;
	b=DOKTqntsUkpm4nHIQvNBrg//wbXGmtIhLIm+j+DBGXV83vf4w/hLY8iDabH8F/6SWpBE
	 c8iYRGOWfJ30kx7UYGBdG233JSxj+aD8Axp7AhRDCT8ue4rkX79yIgpOyJ/Uywn3k2MUG
	 edIP+TzFerbqLqqRzQR2xzY8obkf/d9xcVlcwshQqt6oh8vb733B6R+KZvlXDIoa65DPG
	 H1+i8DB14ZPMuaYHHYRrPlpiMOgb+MGn8zWaZD5wkhnWAtUJ6ROFhFmEl68184KP9DoIN
	 +e6bP6CARiJlmRbMh2wk+92XbGz5MGTqA8qIfVvfpvtmkmDBRva/UCi1xQnxIcBJHYA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793657299;
	bh=aBNaQKj26vRkmc4je3ul065nLXUxqph3R16ZR4NG54w=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=JQBzzktZXVUL9h3/1RECDKPjkD43kakGzgI6eQu6MpKMmtcm6a3kl4tvPvuyMr4aU
	 Y7XvI3pXZg8IqUVbFAidG5ZrCqKb1hwmh6Oj/KdpMVHAVwVvSPfYRUXea3/qQUnWls
	 +3bnExf5jRnxLYLKoSQkVK0jCA26d5ANkyS0a69M8dx6+5oUi+qSDHBvgRUoqva01F
	 C1huBXgTvkinBkx7Dh9G34ZLqTEO/TcD+5h8TeBf3XqwzF4h3oEuBtgLUMZ26CQ+Am
	 P2f2pf5c7UghH7ezYJuhB8Zx2NjgOfGaqmIMNhooDR2b2VJAma9f57d3xuv5yZPn/A
	 ziUQVmZicXsAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27E674055E;
	Mon,  2 Nov 2026 22:08:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 101104BC
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 22:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01C7480A86
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 22:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tx8mfm2LDVQM for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 22:08:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9D9D680A4A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793657297;
 b=CbK8dFHgqqwJJk96QpKPYwfnh/yUfs1OxQcWa/YAAyCVz8FbYpeidUchGThsr5x3dZLv
 AzGkBVPi88jRq5bbQZG7w1nAc4McM03+NMIpD/tx3g/q00vsOaehP20fMpr+5E5O/yCKQ
 dfW9BIhEYhkeEn6D0qWaY9Ec0amh4QClefEFu7UcjMRrjHcgNqk/6RPGrrlltFe4LxwK8
 nXlpPK0+Fa8OvKeaqtHevnHQRNw2PbgMj07MW7HubDfYMrZzkj0tDgO8Quzc6MbjvyKts
 fYoqRADRw8poDvGjoWoP2V+DC4bUvZeQ2hH1ndr3hAxUOKrFPRQXruT/j40p2nxx7Ug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793657297;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=hxlxG5WW/KATZ3Jd2mYEPnGh/1jZkBFYfxANbA7onFo=;
 b=lCHW1whxlmyrn/Yf2HzVglXYQRxAJ+ZMZ1YTGrsCRC0lRS+/VoOwutDMNQFJvW3kr/n1
 0KZU6BVt5v+3CWlwdBiuR42PkfuPHLQuguygwGSMqCDFxClX8OTYP2Go35cB9E2+kI8C9
 N/+bffw6ocTR5QFT5pGQP4EjMIgAeYXQ5//9YZWYViwjHTG6rpHZnXPMG+G37fj7oQcmL
 Vljue0I4KFh9Lfb7c57Js4BEKEVnmfsGlftFgzmxn6zJKhOxrXapB0OAnTn0plmbvx9eo
 moyof78Q7sBbiDpxcKdzU5IOPFF98rx+YMNKbUNsn6oT8MtwdTyfQx/wrZXzZ3+UgeA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=lk84B59s; 
 arc=none smtp.remote-ip=212.227.15.18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D9D680A4A
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 22:08:16 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLR1V-1x6kQh3qdP-00YYDr; Mon, 02
 Nov 2026 23:08:13 +0100
Message-ID: <493d97f1-3ce8-4431-a105-dd5038016931@gmx.de>
Date: Mon, 2 Nov 2026 23:08:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20261102201304.11851-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261102201304.11851-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:DPeaKLdQFnG7EXCgHkOMXPXhxLWdDkY+SWD7jHmZyVSn7dh8HzZ
 bSnoqtCKlD40qKe8Bj479C4Hh3Du0r1+Pv9D5OR0/YpltlZLxlls2dHjKYuEGs1hnHBQ5Zz
 Uy2Z2XXk/EeY3UFb0V55NMm5mG435SMSFWHRX/MQdIw43AVo1WnIj3Jv4mv3UWtxK0zQzNU
 vqhOTdm0snyBM2WdQLGRg==
UI-OutboundReport: notjunk:1;M01:P0:xFE2Cf8GUls=;uj+PcTOTRTDBT0gFMyZKUSk2BVp
 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
 BQrJHslvvYbs7/sLThrytYRmMDg==
Subject: Re: [Buildroot] [PATCH 1/1] {linux,
 linux-headers}: bump 7.2.x series
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 02.11.26 um 21:13 schrieb Bernd Kuhls:
> Update the latest kernel releases to:
>   - 7.2.14 -> 7.2.15
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thank you!

> ---
>   linux/{7.2.14 => 7.2.15}                 | 0
>   linux/from-6.17/linux.hash               | 2 +-
>   package/linux-headers/{7.2.14 => 7.2.15} | 0
>   package/linux-headers/Config.in.host     | 2 +-
>   4 files changed, 2 insertions(+), 2 deletions(-)
>   rename linux/{7.2.14 => 7.2.15} (100%)
>   rename package/linux-headers/{7.2.14 => 7.2.15} (100%)
> 
> diff --git a/linux/7.2.14 b/linux/7.2.15
> similarity index 100%
> rename from linux/7.2.14
> rename to linux/7.2.15
> diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
> index b39e09f55c..3eabe22c9c 100644
> --- a/linux/from-6.17/linux.hash
> +++ b/linux/from-6.17/linux.hash
> @@ -1,6 +1,6 @@
>   # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
>   sha256  fa595aad93734f829c963c2a90ef7c3673224fd7fdae7b49406e397cde2de231  linux-7.3.1.tar.xz
> -sha256  bb1b871ef95a8de10b3f7b7baf0e0d754abbf620f804b6caf860f226aa97647d  linux-7.2.14.tar.xz
> +sha256  d0f6b1d7324c937ccaeb5c4ca7084bfcf71db2edb3e2d3a31f0ad83a681809ab  linux-7.2.15.tar.xz
>   
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
>   sha256  3c2f44ef6acc021a7ad444d9a2e6ec1ef488ff09368793d0004a6080f69d621e  linux-6.18.60.tar.xz
> diff --git a/package/linux-headers/7.2.14 b/package/linux-headers/7.2.15
> similarity index 100%
> rename from package/linux-headers/7.2.14
> rename to package/linux-headers/7.2.15
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 0856a2a211..2080c909cf 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -488,7 +488,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
>   	default "6.6.161"	if BR2_KERNEL_HEADERS_6_6
>   	default "6.12.115"	if BR2_KERNEL_HEADERS_6_12
>   	default "6.18.60"	if BR2_KERNEL_HEADERS_6_18
> -	default "7.2.14"	if BR2_KERNEL_HEADERS_7_2
> +	default "7.2.15"	if BR2_KERNEL_HEADERS_7_2
>   	default "7.3.1"		if BR2_KERNEL_HEADERS_7_3
>   	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>   	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

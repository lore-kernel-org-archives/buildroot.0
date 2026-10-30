Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE8E606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 18:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JdQJnt7z
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06004811A9;
	Fri, 30 Oct 2026 18:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-luAWgAsi1S; Fri, 30 Oct 2026 18:39:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A069A8110F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793385551;
	b=KVdTcYnifVPjzsKB84UNdb0Q3mT4FY58PQYKwTdsj9NC/FfTuHlGss8RzYfNjl3ANSo3
	 PHyG5P/xK59FEoz0eIgv6MeLZcJ9B+3VTva/DFhR4CPrjMOzwO97inKCiG6sSsekErNZ5
	 0ynJq6IEIVbo5w700P6xyTs76GEX9e9/fntplB2c5tgty9MMACN6Z3frfeFnOtX2N9YPU
	 W4enVrem/mQLTqzDDBsRjIhztiSdFkNPUrWfZ3GrBBWDot0TrKiv+Is2D1ycVT6pyqqTe
	 VeEtPORoZV1WYhtriB52CA3i2PYssUBhFKQ0srOM/q2H1K20M+yMkJ96d8gk536nM3A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793385551;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=dCvC5weeuoNKCqA2zZPWziABgohFQ684KRWuacAyqyY=;
	b=SACo2jwMFui9YimsCWcgrWu3Mz6kOV4xZKz5tm7Fn1nzr6S62bCw8k0U/z+eN/Of0Cu+
	 B1mvaZfHjTWLsSuxbnJThJBg6MhFus5gN4VQWCNsSvLZ4pJlk3yztLtDjqXR+rpxR4kHk
	 XnvE3W/wfuZrWngqk5ywfe7YS/3DwGfYsbT4muSI1oosdNmtgnnnYeobzWBHy2p6byrj4
	 yeBulG0Gig1JsPEVjKj2+TPNxzfMm3d1AkvDH9qSHraE3PoqPZLzrl62Gfam70RjOqP9/
	 /MVaH7iC2EkVFl2nlYHVeZADNxbErvLAQZpA0I+futtKiauKgcU8Yv0nea5h8PqVA+g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793385551;
	bh=dCvC5weeuoNKCqA2zZPWziABgohFQ684KRWuacAyqyY=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=JdQJnt7zNNX7AF+GXYmC36e7iLstYdWmSguxJ4WhiY+L9RcQEOW0Xl/hvUzqnGMcy
	 DRah5aycAKb3ok2v93N0+pf2mV/mINVdZ7Cp5vqQQCaaqMIAIXYjo0VnUQITc+eFCK
	 HV+N1Kb60X9H4q7C7BtFHGxAO+N6QJjVUAg6DhByc5Hmbn0XnYuK5qLKIrz6hlRn2E
	 4kSgOsSFHc3WozntOrX6T3JOXHJ+lkakiKnXukbVwuXs5idhoynxNzdo5CgRM0uUsi
	 5s5IDcrZQ0enJbykpMJXSj8vr7CIOdGgGpp8KJhgdnvv5xN0eDMWszY24BCS1WknOc
	 BwzF1DyVspJfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A069A8110F;
	Fri, 30 Oct 2026 18:39:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6727B156
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 18:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 647F460A66
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 18:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DCUJnyLzKgPO for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 18:39:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 92D7A6079D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793385549;
 b=XmQoLCs2SuMN6z2Utr2xKl4m0Lk7v9oVP95MoadBHsQrvKwqq1KmW0dbZTDdPpQ9rTjE
 aD1wXaAlG3f23Snptli2GQlAoyryXgBf8LAMF8KvWdd3C7N/3FgF5s66Gg4lFbQ3OZq5w
 gPJk9UWHxpafh9LXm7J48YPzwfcowDw0KL4BykIYee+qY7M1dvj8TZkG9Gam3/iJ3VGEy
 4Hoalc1RCLDh0SO9A2ib4hm7SoJT/K5bKSNlQiE+CDL2c2olZno39H8rANYzN4Pky/6Wo
 L0HPBkFyfk/fArqQftocO5u5Cp3AIzD7gMsDwo/287ejE92BjXJS/m07TOZUXXLtwIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793385549;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=xFXqmZrEtefpFrjRSRUs0EUSq5j58Mdvjfch1KEE6EI=;
 b=Yf1fWyEL8Imc1pb+v0+UUHKMlcqd/QFOY9eM76HMp243tEQpzm+sRFig9IS4CKWDAaX4
 PJw2/YRIFsg05PvRtzxXjgBTclV9rf5xnffjBub6v9WjxRu6ARRKI5nFD/NqaErOy/6zS
 7D9ntz91hcBfJh2HhTEHlUFDg4oC6bThrtiWBNBOPVzbxjX4t65tIUQ5Ci/4vG8U9BMTi
 4CrjDkpgSumLeRefT0m3u1wJ2J1it8aypF+xxbc2PLgMgY4q+2f7EP2jVARQeeAwHaZS/
 WZAyQiaAfevfeo4fAjSE6cnzzMJHP1q6lMoD+5JY18AkXXi35j5HD+EN0vncQ5v99Xw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=lFjrD8fl; 
 arc=none smtp.remote-ip=212.227.15.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92D7A6079D
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 18:39:07 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEFvj-1xDCTF3ldF-00ADqq; Fri, 30
 Oct 2026 19:39:05 +0100
Message-ID: <8a55930c-2051-49c3-b3ac-2272b44d075a@gmx.de>
Date: Fri, 30 Oct 2026 19:39:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20261030182153.1377722-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261030182153.1377722-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:eoygfEI9XT71kv4rH7xr9rfNF9E8VRsBuwoor3rTgMX4IE1n/cm
 /qmmRqGPJ4rmBxFqezr6bszBbydidedLpSLj+9tGQ1ix7yC2N3V+qNgzdbcq8iD85TkZ0oW
 MoNuHxVkQt4qD44WQqPhHH80DIGm6Zc164ys6tXQhh/dCQAbnPqcbNXLc0Hmwzh6FJsNIwZ
 kMTfVHBTE//AGgowfpQ/g==
UI-OutboundReport: notjunk:1;M01:P0:WbziL46KTak=;GObyEGIPkB2KcYIX74BBNFERHHW
 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
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.3.x,
 7.2.x, 6.18.x, 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x series
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

Am 30.10.26 um 19:21 schrieb Bernd Kuhls:
> Update the latest kernel releases to:
>   - 7.3 -> 7.3.1
>   - 7.2.13 -> 7.2.14
>   - 6.18.59 -> 6.18.60
>   - 6.12.114 -> 6.12.115
>   - 6.6.160 -> 6.6.161
>   - 6.1.190 -> 6.1.191
>   - 5.15.223 -> 5.15.224
>   - 5.10.272 -> 5.10.273
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thank you!

> ---
>   linux/{5.10.272 => 5.10.273}                 |  0
>   linux/{5.15.223 => 5.15.224}                 |  0
>   linux/{6.1.190 => 6.1.191}                   |  0
>   linux/{6.12.114 => 6.12.115}                 |  0
>   linux/{6.18.59 => 6.18.60}                   |  0
>   linux/{6.6.160 => 6.6.161}                   |  0
>   linux/{7.2.13 => 7.2.14}                     |  0
>   linux/{7.3 => 7.3.1}                         |  0
>   linux/Config.in                              | 14 +++++++-------
>   linux/before-6.17/linux.hash                 | 10 +++++-----
>   linux/from-6.17/linux.hash                   |  6 +++---
>   package/linux-headers/{5.10.272 => 5.10.273} |  0
>   package/linux-headers/{5.15.223 => 5.15.224} |  0
>   package/linux-headers/{6.1.190 => 6.1.191}   |  0
>   package/linux-headers/{6.12.114 => 6.12.115} |  0
>   package/linux-headers/{6.18.59 => 6.18.60}   |  0
>   package/linux-headers/{6.6.160 => 6.6.161}   |  0
>   package/linux-headers/{7.2.13 => 7.2.14}     |  0
>   package/linux-headers/{7.3 => 7.3.1}         |  0
>   package/linux-headers/Config.in.host         | 16 ++++++++--------
>   20 files changed, 23 insertions(+), 23 deletions(-)
>   rename linux/{5.10.272 => 5.10.273} (100%)
>   rename linux/{5.15.223 => 5.15.224} (100%)
>   rename linux/{6.1.190 => 6.1.191} (100%)
>   rename linux/{6.12.114 => 6.12.115} (100%)
>   rename linux/{6.18.59 => 6.18.60} (100%)
>   rename linux/{6.6.160 => 6.6.161} (100%)
>   rename linux/{7.2.13 => 7.2.14} (100%)
>   rename linux/{7.3 => 7.3.1} (100%)
>   rename package/linux-headers/{5.10.272 => 5.10.273} (100%)
>   rename package/linux-headers/{5.15.223 => 5.15.224} (100%)
>   rename package/linux-headers/{6.1.190 => 6.1.191} (100%)
>   rename package/linux-headers/{6.12.114 => 6.12.115} (100%)
>   rename package/linux-headers/{6.18.59 => 6.18.60} (100%)
>   rename package/linux-headers/{6.6.160 => 6.6.161} (100%)
>   rename package/linux-headers/{7.2.13 => 7.2.14} (100%)
>   rename package/linux-headers/{7.3 => 7.3.1} (100%)
> 
> diff --git a/linux/5.10.272 b/linux/5.10.273
> similarity index 100%
> rename from linux/5.10.272
> rename to linux/5.10.273
> diff --git a/linux/5.15.223 b/linux/5.15.224
> similarity index 100%
> rename from linux/5.15.223
> rename to linux/5.15.224
> diff --git a/linux/6.1.190 b/linux/6.1.191
> similarity index 100%
> rename from linux/6.1.190
> rename to linux/6.1.191
> diff --git a/linux/6.12.114 b/linux/6.12.115
> similarity index 100%
> rename from linux/6.12.114
> rename to linux/6.12.115
> diff --git a/linux/6.18.59 b/linux/6.18.60
> similarity index 100%
> rename from linux/6.18.59
> rename to linux/6.18.60
> diff --git a/linux/6.6.160 b/linux/6.6.161
> similarity index 100%
> rename from linux/6.6.160
> rename to linux/6.6.161
> diff --git a/linux/7.2.13 b/linux/7.2.14
> similarity index 100%
> rename from linux/7.2.13
> rename to linux/7.2.14
> diff --git a/linux/7.3 b/linux/7.3.1
> similarity index 100%
> rename from linux/7.3
> rename to linux/7.3.1
> diff --git a/linux/Config.in b/linux/Config.in
> index c7f1db7b73..d192620e1f 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -182,13 +182,13 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
>   
>   config BR2_LINUX_KERNEL_VERSION
>   	string
> -	default "7.3" if BR2_LINUX_KERNEL_LATEST_VERSION
> -	default "6.18.59" if BR2_LINUX_KERNEL_LATEST_6_18
> -	default "6.12.114" if BR2_LINUX_KERNEL_LATEST_6_12
> -	default "6.6.160" if BR2_LINUX_KERNEL_LATEST_6_6
> -	default "6.1.190" if BR2_LINUX_KERNEL_LATEST_6_1
> -	default "5.15.223" if BR2_LINUX_KERNEL_LATEST_5_15
> -	default "5.10.272" if BR2_LINUX_KERNEL_LATEST_5_10
> +	default "7.3.1" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "6.18.60" if BR2_LINUX_KERNEL_LATEST_6_18
> +	default "6.12.115" if BR2_LINUX_KERNEL_LATEST_6_12
> +	default "6.6.161" if BR2_LINUX_KERNEL_LATEST_6_6
> +	default "6.1.191" if BR2_LINUX_KERNEL_LATEST_6_1
> +	default "5.15.224" if BR2_LINUX_KERNEL_LATEST_5_15
> +	default "5.10.273" if BR2_LINUX_KERNEL_LATEST_5_10
>   	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>   	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>   	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
> diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
> index 8be46f25a9..eb8307fe8f 100644
> --- a/linux/before-6.17/linux.hash
> +++ b/linux/before-6.17/linux.hash
> @@ -1,10 +1,10 @@
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  7a8589912bd7a8adb07fed074283652cf482a35facef8954554654f0154b4af3  linux-6.12.114.tar.xz
> -sha256  b24c40a9e2188695803358567edda51c4080176424a57dbefca45e5ac44ec225  linux-6.6.160.tar.xz
> -sha256  8aa50daca0412a3d0a61a87af3744f39773d40b3132635fb7bc9be652cdb7b0c  linux-6.1.190.tar.xz
> +sha256  0ec90fe4b20422b1b664b77e6d2dde22b40bd41e7eb2cad8ac8739a4749cb1bb  linux-6.12.115.tar.xz
> +sha256  7d34405be5cd4989b2a5e9cbefa798e3a175218901271e034af3fe4e840b71c6  linux-6.6.161.tar.xz
> +sha256  02f15b77d213e15607923832ef9382e2414ea90df6c007f15a910e139645c35d  linux-6.1.191.tar.xz
>   # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
> -sha256  c1faba89652ec4af585fb96131fdb70d99e891c2b368cbf6d9c1e5fb7f156c23  linux-5.15.223.tar.xz
> -sha256  e7e6e7db0fc009fa223ed10bb37be059042c463593f35f50b5c5cc4a70351614  linux-5.10.272.tar.xz
> +sha256  2757f8ad099cf77499ebab0896b5d31a467b74d5bb18c32b62da059d33b30711  linux-5.15.224.tar.xz
> +sha256  02ec2bcda2f6227fa69fd7a4e8cc04e6e948c9120932880663c6215b4632979d  linux-5.10.273.tar.xz
>   # Locally computed
>   sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
>   sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
> diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
> index 2f6ad625d7..b39e09f55c 100644
> --- a/linux/from-6.17/linux.hash
> +++ b/linux/from-6.17/linux.hash
> @@ -1,9 +1,9 @@
>   # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
> -sha256  87363c24f10e06321eb362765521094e94471f6bff8bce2d6b3e40f39f004953  linux-7.3.tar.xz
> -sha256  08e7b0c4f2dd1971f972da274b5e589a98989390ac56acd7a1a5af922363ea6c  linux-7.2.13.tar.xz
> +sha256  fa595aad93734f829c963c2a90ef7c3673224fd7fdae7b49406e397cde2de231  linux-7.3.1.tar.xz
> +sha256  bb1b871ef95a8de10b3f7b7baf0e0d754abbf620f804b6caf860f226aa97647d  linux-7.2.14.tar.xz
>   
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  53a55ac9863a5547e292b8e381d4e4c2240dd1127d5428a7c44dbc550be23963  linux-6.18.59.tar.xz
> +sha256  3c2f44ef6acc021a7ad444d9a2e6ec1ef488ff09368793d0004a6080f69d621e  linux-6.18.60.tar.xz
>   
>   # Licenses hashes
>   sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
> diff --git a/package/linux-headers/5.10.272 b/package/linux-headers/5.10.273
> similarity index 100%
> rename from package/linux-headers/5.10.272
> rename to package/linux-headers/5.10.273
> diff --git a/package/linux-headers/5.15.223 b/package/linux-headers/5.15.224
> similarity index 100%
> rename from package/linux-headers/5.15.223
> rename to package/linux-headers/5.15.224
> diff --git a/package/linux-headers/6.1.190 b/package/linux-headers/6.1.191
> similarity index 100%
> rename from package/linux-headers/6.1.190
> rename to package/linux-headers/6.1.191
> diff --git a/package/linux-headers/6.12.114 b/package/linux-headers/6.12.115
> similarity index 100%
> rename from package/linux-headers/6.12.114
> rename to package/linux-headers/6.12.115
> diff --git a/package/linux-headers/6.18.59 b/package/linux-headers/6.18.60
> similarity index 100%
> rename from package/linux-headers/6.18.59
> rename to package/linux-headers/6.18.60
> diff --git a/package/linux-headers/6.6.160 b/package/linux-headers/6.6.161
> similarity index 100%
> rename from package/linux-headers/6.6.160
> rename to package/linux-headers/6.6.161
> diff --git a/package/linux-headers/7.2.13 b/package/linux-headers/7.2.14
> similarity index 100%
> rename from package/linux-headers/7.2.13
> rename to package/linux-headers/7.2.14
> diff --git a/package/linux-headers/7.3 b/package/linux-headers/7.3.1
> similarity index 100%
> rename from package/linux-headers/7.3
> rename to package/linux-headers/7.3.1
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 100545ba6e..0856a2a211 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -482,14 +482,14 @@ endchoice
>   
>   config BR2_DEFAULT_KERNEL_HEADERS
>   	string
> -	default "5.10.272"	if BR2_KERNEL_HEADERS_5_10
> -	default "5.15.223"	if BR2_KERNEL_HEADERS_5_15
> -	default "6.1.190"	if BR2_KERNEL_HEADERS_6_1
> -	default "6.6.160"	if BR2_KERNEL_HEADERS_6_6
> -	default "6.12.114"	if BR2_KERNEL_HEADERS_6_12
> -	default "6.18.59"	if BR2_KERNEL_HEADERS_6_18
> -	default "7.2.13"	if BR2_KERNEL_HEADERS_7_2
> -	default "7.3"		if BR2_KERNEL_HEADERS_7_3
> +	default "5.10.273"	if BR2_KERNEL_HEADERS_5_10
> +	default "5.15.224"	if BR2_KERNEL_HEADERS_5_15
> +	default "6.1.191"	if BR2_KERNEL_HEADERS_6_1
> +	default "6.6.161"	if BR2_KERNEL_HEADERS_6_6
> +	default "6.12.115"	if BR2_KERNEL_HEADERS_6_12
> +	default "6.18.60"	if BR2_KERNEL_HEADERS_6_18
> +	default "7.2.14"	if BR2_KERNEL_HEADERS_7_2
> +	default "7.3.1"		if BR2_KERNEL_HEADERS_7_3
>   	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>   	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
>   	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

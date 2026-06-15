Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49338CD98CE
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 21:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 056C641B8D;
	Mon, 15 Jun 2026 21:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mHOEE28SNJR8; Mon, 15 Jun 2026 21:32:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D0C941B90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781559149;
	bh=tdCdaqCQVeXYZ6cAq/Yq38brV2rm9Vz1IkP+3Tv1w9c=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KFZym1j/7L9OwLFyvuF7aQYvdq+jyc5RKcKxNPRB4a0+sOnacHUXomLq1LPPS2DrV
	 iWYzbOBGNjwH+W7pbRIFIzfhtjD+NIClyV4q+WdIrv/tmB0xKuVdEM7s0Z3WGLFstp
	 FjBfNjKW/plquEtQRg3SeQqZUEXeOkclaz29KRG6rPc6fpiFOal+hoz+tz8tagkzwm
	 4AuUj00xlTSUPUIoXGblR/f0BpsniXvNbBAUIHydGSxNtlmaEAD/8kjel0MsyYukXt
	 66ZCTMts8W+AQOXRx04MXOH4O68XaPBmn/oIezTYBHgUfLa3j5dQb+fH6NCYxBhqHN
	 SXyfy5QMv2CfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D0C941B90;
	Mon, 15 Jun 2026 21:32:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 443BE2F3
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 21:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A294615E3
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 21:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DaYGGnNFqBsI for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 21:32:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 459DA615E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 459DA615E2
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 459DA615E2
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 21:32:26 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 1C6942C891D3;
 Mon, 15 Jun 2026 23:32:24 +0200 (CEST)
Message-ID: <36dd2cd2-ef7f-4878-9dfc-d303fd6bd279@bubu1.eu>
Date: Mon, 15 Jun 2026 23:32:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20260615211608.372629-1-bernd@kuhls.net>
 <20260615211608.372629-2-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260615211608.372629-2-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1781559144; bh=WGdH7RZNzpyZi/0/tRUZ4Ga2Fit87mgvjTgPKQ2/ocI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=NbuuarcWaOkyxodSH4P7UwYtLaJp1/ItFqy7VWHOKcvj3iuOCOdcHtulkwJDQHY6N
 TogfZTZLSvUM+DKKZ0erEUchy/SvHIhT9m61YNwknNSuEy2+UsTDoiFnindqXRUdC9
 MLaiJIm2mAKZUkTY5ltLioQYmR0ZfrD8MlwvLNnJtRo5CpuGh8sML8lhayZq5mdTbm
 gX7ZJdBNaD2gI52uFLWezRB5AvheyZKhC9XR4zgZVR0rM0N2AL4MRSntMckOyOLz8M
 1kWdu5q004YPer9vY8pnrfdmziesY9CqAnS6SvGY1Og6aoYdEXX44uhTAsTM+gjncU
 1496sMysxJCBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=NbuuarcW
Subject: Re: [Buildroot] [PATCH 2/2] package/usbutils: only needs libudev,
 not udev daemon
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,
one question below.

On 6/15/26 23:16, Bernd Kuhls wrote:
> From: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> libudev-zero version 1.0.4 added support for usb.ids with commit
> https://github.com/illiliti/libudev-zero/commit/2bebebc9e0444ec53afd7f1f37aa80ff6b95f5f7
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/787f089f803e70db0e0a91dd6cb4ed5f319cb280
> 
>   package/libudev-zero/Config.in | 2 ++
>   package/usbutils/Config.in     | 6 +++---
>   package/usbutils/usbutils.mk   | 2 +-
>   3 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libudev-zero/Config.in b/package/libudev-zero/Config.in
> index 41f1d762f1..92b56cfa10 100644
> --- a/package/libudev-zero/Config.in
> +++ b/package/libudev-zero/Config.in
> @@ -2,6 +2,8 @@ config BR2_PACKAGE_LIBUDEV_ZERO
>   	bool "libudev-zero"
>   	depends on !BR2_STATIC_LIBS
>   	select BR2_PACKAGE_HAS_LIBUDEV
> +	select BR2_PACKAGE_HWDATA if BR2_PACKAGE_USBUTILS # runtime
> +	select BR2_PACKAGE_HWDATA_USB_IDS if BR2_PACKAGE_USBUTILS

Is there a reason for putting these selects here into the libudev-zero 
config file instead of adding them into usb-utils?

>   	help
>   	  Daemonless replacement for libudev
 > [...]

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

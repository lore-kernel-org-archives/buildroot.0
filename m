Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16475C4829E
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 17:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8634400AA;
	Thu, 15 Feb 2024 17:24:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qETY-DoaTq3P; Thu, 15 Feb 2024 17:24:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB7FF400C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB7FF400C6;
	Thu, 15 Feb 2024 17:24:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB5091BF33D
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 17:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C936480B69
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 17:24:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DJRkK_n5l7J2 for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 17:24:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.117;
 helo=smtpcmd11117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DC55F80B55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC55F80B55
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC55F80B55
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 17:24:30 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id afRHrMCtLa6zwafTIrcsP5; Thu, 15 Feb 2024 18:24:28 +0100
Message-ID: <e8257733-2952-444f-8c79-d4a1af991037@benettiengineering.com>
Date: Thu, 15 Feb 2024 18:24:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Kilian Zinnecker <kilian.zinnecker@mail.de>, buildroot@buildroot.org
References: <20240214233028.1226645-1-kilian.zinnecker@mail.de>
 <20240214233028.1226645-2-kilian.zinnecker@mail.de>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240214233028.1226645-2-kilian.zinnecker@mail.de>
X-CMAE-Envelope: MS4xfKUkiemlR+RZmydvio6VR6V/6ztAnRFEwfYYIMOnYG8TofczzWc4h0RgZZSqhMhSP3KbRwI3Jij/UAnR5fNj2dkc0RDw9AW7je92K9nHgVbqpFYnCnuG
 EyZP3f+FJ7a0X0l3dEApco/t9wV+EplGbs3WXeF56Smg9Lv7plhwvxHs5iRwZIU94cpHnMGd4kvwP3vhejsw9uAntwaCihpKQ+vRQ20z7IvitmSyt51aBbBp
 WGDaeXbDxLZkz3sS4st38B5A6ym7FQoO/FATkMkhICnG8wNXlGvdqS0sCdoyhZMjQ9PB5E0M/jyplJXUzvSXhgeZi969WmEI/+RblqW9H54=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708017868; bh=U3QFFaYoV2zY8Y2cBpybUCOpGI0l2D/9meFPQUuXnXM=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Ks0TJ0MP3hGhDB9eNt+Kk+pXjwK7pmoFyi9VInzXfMmXuHkLNjcqrVNZu1ja7eihl
 LYI12FoCnQLL5BKKCHFUDS7FyPq3T7Avlk2+LaL/hMouLOg8zkNJ5CJHBP6BsZCK2Y
 MgMbm2UFGeA1lglgLjVpQzd/aJ2z8Z7jWZ12cRB/EgFTGtI9WAVDGcgmglaYmNwWQt
 yBm+wC2fPU9zgt02iSBAG924e/sGxhNxCBOn25//cViDElECq5pi4qUEpUhNJd3qvV
 CDSn3T5JeBhF3E45rQEU1gB/wx4kbH4LmSEjXmJlvzpKxUYmogNjRw6iTO1fwt3yX/
 bTqHggN43ZP7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Ks0TJ0MP
Subject: Re: [Buildroot] [PATCH v4 1/3] Fix alphabetical order of DEVELOPERS
 file entry
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Robert Nelson <robertcnelson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/02/24 00:30, Kilian Zinnecker wrote:
> Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> ---
>   DEVELOPERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 0d12c3abcb..b75a92739a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1896,8 +1896,8 @@ F:	package/libcamera/
>   N:	Kilian Zinnecker <kilian.zinnecker@mail.de>
>   F:	board/avnet/rzboard_v2l/
>   F:	board/radxa/rock5b/
> -F:	configs/rock5b_defconfig
>   F:	configs/avnet_rzboard_v2l_defconfig
> +F:	configs/rock5b_defconfig
>   F:	package/rockchip-rkbin/
>   
>   N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

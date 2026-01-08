Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93ADED1D48A
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 19:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63F828272A;
	Thu,  8 Jan 2026 19:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wv-8QCUWc1Ft; Thu,  8 Jan 2026 19:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 412A0826B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767902272;
	bh=Ospkwydy09FqGrxJufApmllw/vzVJ012Dvz81CCfKuk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s4FGpH4dqn1FswEetD625cLmW5eKw6o/7zhQ1FR3ZHyW9LFTw3HeLgqbG9TfKltbD
	 IrnvxOzGPOxRV3NV47q2qAteRoaoYHcIe9AgvaWjVNPlfUf4MAL/wUoJFYS11mhnsI
	 Eie75n63PHYt6onduRvtwP+79tjkN2DquSf6yZcIoWvTc/BMe7ZADOVWeicf7unWWK
	 i6/3v3rYCuc6F3vzVWi+AFePEHayjeh6wETawl0kAqoj7SvnXJaltKBR70EpgFbwWB
	 WiJW13wS4DQ1LOpGKs4JALvQjYCv79K+7kOx789gBZm/AIc5Xb69VFZHE78InMqd1z
	 6GGJ/mQ4ifL3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 412A0826B7;
	Thu,  8 Jan 2026 19:57:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B8574278
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 19:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F5C740351
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 19:57:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YXgpJ3cJ97LQ for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 19:57:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7AA79401EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AA79401EB
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7AA79401EB
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 19:57:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 931FA13F86A;
 Thu,  8 Jan 2026 20:57:40 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 08 Jan 2026 20:57:39 +0100
MIME-Version: 1.0
Date: Thu, 08 Jan 2026 20:57:39 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Bartosz Bilas <b.bilas@grinn-global.com>,
 Marleen Vos <marleen.vos@mind.be>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20260107194109.1842074-1-dario.binacchi@amarulasolutions.com>
References: <20260107194109.1842074-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <7e569511d93d3990d2c47bff2974e2a6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767902266;
 bh=o4P4GkLg19dpfOtDK5ah0jm9kUZs75A4Cde/QYWZHsA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Rf2rmDgzWqUVB1VGgZzMS0TAgn3DLphngfTtmsUIVeMaTSBJMwjDyFn+nT0lk6py+
 2pr92Seed7Biu4kzre9AtwQrxw5FVqnFjInEBN4FsnEI3P3dPJGtb+ct+z0jpHnDVh
 ooiB4slsZUVeyMGrcrX+domHqmcsccsDoIQDT1ojJgho7jmTCE2grZ3Xr1cen/bW6N
 1OjUgfNziiFo5BIJvXuh9S8SpeNe4rC9naiFfqV+uhVbbXjA9lw0ZlETCF0PsYRpIV
 BdBJ+CdxNV7QyT9LJq4BBDclJAe8mv5zU7mTlktKKYRiZ91FiNT+Y/ds0XCA0Hbbxn
 eVn+JpV8xknIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Rf2rmDgz
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32mp1*_dk*: bump Linux to
 6.12.63 and U-Boot to 2026.01
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 07/01/2026 20:41, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.12.63 and U-Boot to
> version 2026.01 for
> 
> - stm32mp135f_dk_defconfig
> - stm32mp157a_dk1_defconfig
> - stm32mp157c_dk2_defconfig
> 
> Tested on STM32MP157C-DK2 Discovery Board.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

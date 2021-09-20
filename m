Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A0DFC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 21:20:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F24F361166
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 21:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F24F361166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=xes-inc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9917460B3B;
	Mon, 20 Sep 2021 21:20:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fRsq2njjr2fb; Mon, 20 Sep 2021 21:20:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D797960B2C;
	Mon, 20 Sep 2021 21:20:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B22DF1BF3C6
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 21:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0F5C40591
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 21:19:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xes-inc.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HJfSSFWd-6HR for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 21:19:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8179140556
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 21:19:58 +0000 (UTC)
Received: from [10.52.16.113] (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id 3D37A20284;
 Mon, 20 Sep 2021 16:19:57 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
 t=1632172797; bh=1VvnXsMX3ztxE3jvLTOzgULR3G53rMWt7ponehEk2WY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=to8IRXCV5hP4tTFGOTMuJzRudBdvy139viDhjPgmjKsh7lVT0tKeEGu+TmY222wUn
 EbuXbMhgNPSlSegQKGk31DRoQ90wHBTgEqtagi50zXbXD0C6k6JlwZHsHAZnazUjbM
 QaiBeclWk4U5DdSx/CHLRA/qo7nrK8YIHvvkAZEk=
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20210920211328.17526-1-ps.report@gmx.net>
 <20210920211328.17526-2-ps.report@gmx.net>
From: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <03db0350-bfe4-40ec-c82d-4385fc726b27@xes-inc.com>
Date: Mon, 20 Sep 2021 16:19:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920211328.17526-2-ps.report@gmx.net>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH v1 2/4] package/rpi-firmware: bump version
 to 9f97081
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Martin Bark <martin@barkynet.com>, Arthur Courtel <arthur.courtel@smile.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Peter,

On 9/20/21 4:13 PM, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>   package/rpi-firmware/rpi-firmware.hash | 2 +-
>   package/rpi-firmware/rpi-firmware.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
> index 7127b2d824..d6243cb54c 100644
> --- a/package/rpi-firmware/rpi-firmware.hash
> +++ b/package/rpi-firmware/rpi-firmware.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  5eaff5da660d6ecd74bb2c927d7a1ba84b5e5c5582f02e65aec058af2ffe50f4  rpi-firmware-33e09977ff3b02967d191801e3361224455acb9d.tar.gz
> +sha256  60be376238b08b928f98a25ecf90172067c17ad1db543d813409ee6c54b13b07  rpi-firmware-9f9708199f8809ecf16119d0716375bee7b7d8d4.tar.gz
>   sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index 181650fa08..6a2bf05248 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RPI_FIRMWARE_VERSION = 33e09977ff3b02967d191801e3361224455acb9d
> +RPI_FIRMWARE_VERSION = 9f9708199f8809ecf16119d0716375bee7b7d8d4
There is a regression introduced with 
https://github.com/raspberrypi/firmware/commit/25e2b597ebfb2495eab4816a276758dcc6ea21f1
See here: https://github.com/raspberrypi/firmware/issues/1619
>   RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
>   RPI_FIRMWARE_LICENSE = BSD-3-Clause
>   RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom

-- 
Vincent Fazio
Embedded Software Engineer - ATS
Extreme Engineering Solutions, Inc
http://www.xes-inc.com

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

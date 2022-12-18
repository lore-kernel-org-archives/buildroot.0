Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5376FC4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 00:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF39B400D0;
	Sun, 18 Dec 2022 00:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF39B400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K6BFEJij7nQJ; Sun, 18 Dec 2022 00:48:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3FAE40003;
	Sun, 18 Dec 2022 00:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3FAE40003
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 37CB41BF847
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 00:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13210814B6
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 00:48:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13210814B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N2Orkc26Cd2F for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 00:48:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6138814B3
Received: from smtpdh17-2.aruba.it (smtpdh17-2.aruba.it [62.149.155.117])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6138814B3
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 00:48:12 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 6hqdpnp1itC456hqdp9cEh; Sun, 18 Dec 2022 01:48:11 +0100
Message-ID: <9fa2e177-74ae-7e6a-406b-6ba362478371@benettiengineering.com>
Date: Sun, 18 Dec 2022 01:48:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Christian Stewart <christian@paral.in>
References: <20221217232556.1609969-1-christian@paral.in>
 <cbc76ca1-a87e-7a2a-d06e-222d9c00a29e@benettiengineering.com>
 <CA+h8R2pLQd9pLeQq+hDMpdO34BBv0E=ToZCP7AB5A-qEp3HRhA@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CA+h8R2pLQd9pLeQq+hDMpdO34BBv0E=ToZCP7AB5A-qEp3HRhA@mail.gmail.com>
X-CMAE-Envelope: MS4xfGTgFkeiwVhaE3ah1cr4cI/WC6+AhGmC3TOxa/yA7X1BW9Uwxrfvw8s2B2KF2DhXJn4mBfPHiqqaMhrZvAp5wueNvs8RrkRtLQ4K9WT3NvE4b7IsdS3r
 c4LsCCDEUWzByChgp4am4sFGq/vkytlAnTNqhBvbxJDhILrmRbVKTmYaOG+5mKjxHVvE6DiaTz5T7tac6Qp6dd1qyDwDPA4nsmMAKi65GwtPHuEphO5Kyv32
 FuBvh3O1wIRp/dDiCXltg4Cle5yCw0/7i61t3JsvxEl5otS/GTkXofCRBsKABeoUZcxB6rFQEZpeChHuaLm8Bqd1gO1fbns1zxxng+vzYHw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1671324491; bh=n9HqitFFbYYb29TB766Fld4X0pE5UeCvh7c4IpQLxGo=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=nLLKeG81w63R5iF9kDXNxRZbA8ahnwrQNnYPS6UDjKepPmn4uY7+SLQytKm/eZjMF
 huuYGwzseJKgPMECEU3FqkwT4o6ewZo/noqeLKHXGQQuBS5wokMLje800tGS7Izylj
 bMq3gHZuuhgpZJZbVOjrmZjkEV8RYvhdW2da4oew3Rs6/LcW2PYoLAZ1J4V9/xm+jS
 +Yczzc/qkV1iX8s4UvySH9ede0eBFkWovWScfst1ACBgx5e2LHX7lHNhgz7TuemUwN
 iETWMMFm5Ane9mmUAulJ+4/fmxuQYr42nF2NUaxGE37PIUVUQLhRm+C8rzl/b9tkyL
 16Fevew+raZFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=nLLKeG81
Subject: Re: [Buildroot] [PATCH v3 1/1] package/rtl8821cu: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 18/12/22 01:44, Christian Stewart via buildroot wrote:
> Hi Giulio,
> 
> On Sat, Dec 17, 2022 at 4:38 PM Giulio Benetti
> <giulio.benetti@benettiengineering.com> wrote:
>> Check my pending patch as reference:
>> https://patchwork.ozlabs.org/project/buildroot/patch/20221213203236.171656-1-giulio.benetti@benettiengineering.com/
>> There I use CONFIG_PLATFORM_I386_PC=n but the approach is the same.
> 
> Thanks, that's much cleaner:
> 
> RTL8821CU_USER_EXTRA_CFLAGS = \
>      -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
>      -DCONFIG_IOCTL_CFG80211 \
>      -DRTW_USE_CFG80211_STA_EVENT \
>      -Wno-error
> 
> RTL8821CU_MODULE_MAKE_OPTS = \
Remember to add here:
	CONFIG_PLATFORM_GENERIC=n \
>      CONFIG_RTL8821CU=m \
>      KVER=$(LINUX_VERSION_PROBED) \
>      USER_EXTRA_CFLAGS="$(RTL8821CU_USER_EXTRA_CFLAGS)"
> 


-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

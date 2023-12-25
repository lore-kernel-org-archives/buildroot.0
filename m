Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86963C3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 08:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCA8E40327;
	Mon, 25 Dec 2023 08:03:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCA8E40327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MlkoDAZTuhLv; Mon, 25 Dec 2023 08:03:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDE2B405B7;
	Mon, 25 Dec 2023 08:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDE2B405B7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 472961BF3FD
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 08:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E56E4149D
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 08:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E56E4149D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nyDtnc5CzjG4 for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 08:03:53 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87C1C41499
 for <buildroot@buildroot.org>; Mon, 25 Dec 2023 08:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87C1C41499
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
 by mx.socionext.com with ESMTP; 25 Dec 2023 17:03:50 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
 by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id 796DD2059034;
 Mon, 25 Dec 2023 17:03:50 +0900 (JST)
Received: from kinkan2.css.socionext.com ([172.31.9.51]) by m-FILTER with
 ESMTP; Mon, 25 Dec 2023 17:03:50 +0900
Received: from [10.212.246.227] (unknown [10.212.246.227])
 by kinkan2.css.socionext.com (Postfix) with ESMTP id D840AB1D40;
 Mon, 25 Dec 2023 17:03:49 +0900 (JST)
Message-ID: <99165dd6-6252-468e-9b9a-d14dd49b898d@socionext.com>
Date: Mon, 25 Dec 2023 17:03:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20231220105623.192609-1-hayashi.kunihiko@socionext.com>
 <20231223152634.2f543c44@windsurf>
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <20231223152634.2f543c44@windsurf>
Subject: Re: [Buildroot] [PATCH 1/1] package/eudev: add sgx group for
 eudev-3.2.12
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Thank you for your comment.

On 2023/12/23 23:26, Thomas Petazzoni wrote:
> On Wed, 20 Dec 2023 19:56:23 +0900
> Kunihiko Hayashi <hayashi.kunihiko@socionext.com> wrote:
> 
>> The eudev has "sgx" group in 50-udev-default.rules as default
>> since commit 247724da450b.
>>
>> The group is defined by package/systemd [1], however, when
>> enabling BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y with
>> qemu_aarch64_virt_defconfig, the systemd isn't used and the following
>> warning occurs:
>>
>>      udevd[153]: specified group 'sgx' unknown
> 
> If I'm correct, this is due to those rules:
> 
> SUBSYSTEM=="misc", KERNEL=="sgx_enclave", GROUP="sgx", MODE="0660"
> SUBSYSTEM=="misc", KERNEL=="sgx_vepc", GROUP="sgx", MODE="0660"
> 
> why do these rules trigger on an AArch64 system? Isn't SGX an Intel
> thing?

As you said, aarch64 system doesn't trigger these rules.

It seems that eudev checks once whether each group defined by GROUP
exists in /etc/group, regardless of any conditions.

Thank you,

---
Best Regards
Kunihiko Hayashi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

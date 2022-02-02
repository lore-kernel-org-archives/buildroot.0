Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592DBC433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 22:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2F0A60AEB;
	Wed,  2 Feb 2022 22:11:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R75EmOvw-iHX; Wed,  2 Feb 2022 22:11:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E18EC60ADA;
	Wed,  2 Feb 2022 22:11:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C2F551BF5DE
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 22:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B126E83E80
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 22:11:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iNPDGadIavC0 for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 22:11:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A91383E79
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 22:11:07 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FNq7nTfy0kz4hFNqEnvOOl; Wed, 02 Feb 2022 23:11:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643839866; bh=mZe5+CHo0a1Y3OqHbdHNCz4njRef4+aJ86W4SWEh5ps=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=V7TXQ3vFVAM8d08cssl9/MCGptQSVQ85buQnp8IaMb906K88U0OgXyOKsHF4SlDGp
 q44A2YKmik7wjlKRtjV+CCGxwshDTXGv0zoQsHLN+kTPGn4LmYZdFL2dkU99Yg633r
 iPkKE9nWYDCNTv2Y5ZUDEn9+Dv3//n49elPo/5o6ouU8osgeJ+Rb+SGuRDA5hsTNWR
 A8+VfnKdgACNSoaivp0v4RGmsAqn4rDnwJGflJ2+At3X+fjYR/dEGeUesqTfqh8bdo
 Y2dymI5O8G3RaE3wcQswhuppZn5p5Lp3w5bNkJbrl/NIZ6FmTQgFlk+lX/3UhPfaCS
 oJDtsA3+fqaPw==
Message-ID: <7f7bc01d-adb2-9ee9-e54c-0ef6736c83a0@benettiengineering.com>
Date: Wed, 2 Feb 2022 23:10:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Peter Seiderer <ps.report@gmx.net>
References: <20220201232203.333403-1-giulio.benetti@benettiengineering.com>
 <20220201232203.333403-2-giulio.benetti@benettiengineering.com>
 <d6ff992c-a84c-d335-3ddb-2122f7c744dd@mind.be>
 <20220202214210.0a2483e6@gmx.net>
 <48ab9669-d467-a394-12a2-fd229f6229f0@benettiengineering.com>
 <20220202224046.1ccef19a@gmx.net>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220202224046.1ccef19a@gmx.net>
X-CMAE-Envelope: MS4wfAWcKzdtH+uVm9BjKaaOthmt34WJYw3KC39v5nBzgmX5FS/PLtkdqZmaPoEkImQrnvzBRm/hDr0FlVYyjljA4jbiUWk7crzA5brQmpBcDBOZTmHMcvDv
 iPWBNN2C207bp0lrjMuLwYPAphaQNU6S566d2/f2ZZ6QwfuScV2VO0xYY1DNTH6RAINgMATua4/HlQElRlqtfy/Ve5wz4QRshnaOYmZFlWL/gDgALJ6vAtjH
 p0aT8EO22zGX+LCkekAVLaPjVPHcgftxBF+YvBKLgByvhx0Mesu720TaeuPGdzjJEx2Z0StRye+vH+Xl5C/LaA==
Subject: Re: [Buildroot] [URGENT 1/1] package/util-linux: fix host build
 failure
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

Hi Peter,

On 02/02/22 22:40, Peter Seiderer wrote:
> Hello Giulio,
> 
> On Wed, 2 Feb 2022 22:09:22 +0100, Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Hi Peter,
>>
>> On 02/02/22 21:42, Peter Seiderer wrote:
>>> Hello Arnout, Giulio,
>>>
>>> On Wed, 2 Feb 2022 08:41:34 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:
>>>
>>>> On 02/02/2022 00:22, Giulio Benetti wrote:
>>>>> The UTIL_LINUX_FIX_DISK_UTILS_COMPILE workaround is needed for host
>>>>> building too. So let's add it to HOST_UTIL_LINUX_POST_PATCH_HOOKS.
>>>>> host-util-linux is used a lot, so this patch fixes a lot of future
>>>>> builds.
>>>>
>>>>     Darn, I tested that, both with and without BR2_PACKAGE_HOST_UTIL_LINUX set. I
>>>> don't understand what went wrong in my test...
>>>
>>> The raw support depends on the available toolchain headers, see e.g.
>>> package/util-linux/Config.in:
>>>
>>> 	config BR2_PACKAGE_UTIL_LINUX_RAW
>>> 	        bool "raw"
>>> 	        depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
>>> 	        help
>>> 	          Build a linux raw character device
>>>
>>> Or according to [1] '--disable-raw' for the host build should do
>>> the trick too...
>>
>> I was in hurry to produce the patch last night, so I went for the
>> fastest way. Can you give a try with --disable-raw and eventually submit
> 
> Thanks for taking care!

I've just sent a patch like you've suggested:
https://patchwork.ozlabs.org/project/buildroot/patch/20220202220538.2858380-1-giulio.benetti@benettiengineering.com/

>> the patch? That would save some time while building. Also because
>> host-util-linux is used a lot
> 
> Sorry, could not reproduce the host-build failure on my system, seems the
> toolchain is too up-to-date (openSUSE Tumbleweed - gcc-11.2.1) ;-)

For this situation you can use this docker:
docker pull registry.gitlab.com/buildroot.org/buildroot/base:20220105.2314

There gcc is version 10.2.1 and it's the official one used for 
build-testing buildroot defconfigs. You can find it also in 
buildroot/.gitlab-ci.yml

Can you give a go with that docker by reproducing the failure and then 
applying the latest patch?

That way you can give a Reviewed-by: or also a Tested-by: you

Thank you!
Kind regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

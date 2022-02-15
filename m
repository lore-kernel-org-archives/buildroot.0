Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEB4C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 02:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B6BB60D79;
	Tue, 15 Feb 2022 02:22:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJsN2gk6nKRs; Tue, 15 Feb 2022 02:22:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFC7760D51;
	Tue, 15 Feb 2022 02:22:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4EDC71BF324
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 02:22:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A6C460D51
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 02:22:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VKYzZRPWwxKU for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 02:22:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4091060B77
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 02:22:16 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JnTqn9Nb1XmFAJnTqn8ve0; Tue, 15 Feb 2022 03:22:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644891735; bh=U77dq1u8Pint0LYjchkYXd8Zrux2BqyeGAS9aRArc6U=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=kb6jmIBA+I4LSmZ/9Jwt12y97gdnhshEooWKple06AHAMFAnaKXrL5WPVMPgpc7Aq
 EAdVP3+e9oEGwkqMdCo7Sag49oetmDe1aoRGJ4qF1fAuwwGHk5+itUnsvEi3WewOx6
 Wl7FSlVXMHxt/4Flo1bY6SLg8Bq9oFMbjuP2tNvhYMFKXeXXGenOLyg9fMq76RB+YS
 l19uLgI08xqGkrLhsEjCmiF+5PBa1Dx7K0Ijw/ijxqvG7nbQdtZx1kcY1SW9/w0kCf
 frQOiXGOHFOYSC3aiAXe1OvzZKLjJiZgAd3ZlSdiNsLLFZAgGp/Sw7ZTeIwiOEjCyN
 KK0TcZDZi03tA==
Message-ID: <9907aa64-1f54-cbf4-074a-a73c2233ab97@benettiengineering.com>
Date: Tue, 15 Feb 2022 03:22:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Yu Chien Peter Lin <peterlin@andestech.com>
References: <20220125054956.27492-1-peterlin@andestech.com>
 <20220125054956.27492-3-peterlin@andestech.com>
 <674c1c83-4bcf-3740-8f79-184c1a86cda3@benettiengineering.com>
 <YgsMQNqzcR1uCli1@APC323>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <YgsMQNqzcR1uCli1@APC323>
X-CMAE-Envelope: MS4wfIvSMsJZ7XV6wlBFqUUdRyaqIj1zkSprTQJiJY6Q/lSndaInkJT4jYd9YwKt64/JEkRtJCFD3otHOHNcmgmMnhxy0jBfEgoZeS6T812AS/w2hx3mFEbZ
 kGsMYJKX/1XTACP6A53KJQ+sQV1Ix4chPviEsawHDFYBdY6vJK+flX2C1hsnYSKP+VipErqOUZvcbjqLtefeh8h+iiBbY+e/VIJeV6orG4K7hzpvLDfybquO
 w1mOeZZZrBmNkQM7txXwQk8EpLdVae1vbdAQrpGyMXw=
Subject: Re: [Buildroot] [PATCH v2 3/3] DEVELOPERS: add Yu-Chien Lin to
 board/andes
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
Cc: alankao@andestech.com, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 15/02/22 03:13, Yu Chien Peter Lin wrote:
> Hi Giulio,
> 
> Thanks for your comments.
> 
>> On Thu, Feb 10, 2022 at 12:39:07AM +0100, Giulio Benetti wrote:
>>> Hi Peter,
>>>
>>> I review it now,
>>>
>>> On 25/01/22 06:49, Yu Chien Peter Lin wrote:
>>>> This patch provides defconfig and basic support for the Andes
>>>> 45 series RISC-V architecture.
>>>>
>>>> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
>>>> Signed-off-by: Alan Kao <alankao@andestech.com>
>> ...
>>>>    create mode 100644 board/andes/ae350/patches/opensbi/0001-Disable-PIC-explicitly-for-assembling.patch
>>>>    create mode 100644 board/andes/ae350/patches/opensbi/0002-Enable-cache-for-opensbi-jump-mode.patch
>>>>    create mode 100644 board/andes/ae350/patches/uboot/0001-Fix-mmc-no-partition-table-error.patch
>>>>    create mode 100644 board/andes/ae350/patches/uboot/0002-Prevent-fw_dynamic-from-relocation.patch
>>>>    create mode 100644 board/andes/ae350/patches/uboot/0003-Fix-u-boot-proper-booting-issue.patch
>>>>    create mode 100644 board/andes/ae350/patches/uboot/0004-Enable-printing-OpenSBI-boot-logo.patch
>>>
>>> Would it be possible for you to upstream these patches? I mean, do you
>>> maintain the uboot, opensbi repositories so you can do that?
>>> If yes it would be great having no patches at all here.
> 
> We have a plan to upstream some of them if the patch is platform specific.

This sounds good

> I'll remove them when the u-boot bumps to the future version.

That's ok

>>>> index 0000000000..5e5d70ab25
>>>> --- /dev/null
>>>> +++ b/board/andes/ae350/ae350.dts
>> ...
>>> It's a bit out of topic, but with this .dts ^^^ you define and entire
>>> SoC+board, shouldn't it be like a .dtsi file for SoC and a .dts file for
>>> board?
> 
> We would like to remain in this form until new board is available. Thanks.

Ok, with some new board on the horizon it makes sense to me.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73262C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 00:54:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A88C60EE5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 00:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A88C60EE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4543E8291C;
	Sun, 19 Sep 2021 00:54:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1dMB2y2LnZ0u; Sun, 19 Sep 2021 00:54:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95B81827AF;
	Sun, 19 Sep 2021 00:54:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E5E81BF966
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 00:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DB8E823C6
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 00:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id os7gBPl81GNQ for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 00:53:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2265081B26
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 00:53:58 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.207.86])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Rl5gm8AXuIR3HRl5hmIc0x; Sun, 19 Sep 2021 02:53:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1632012837; bh=C6I6Z7XnUrvFGsVdI2CA8TLTQ6n4MrG7FrQliQQYrGk=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=gZs+8obV5ro/9178f0MoE2GCh8JbMaS4fUJ97HIilidq9cSqEhxlDpV6QTPMjXGni
 wZZute1ljjd3Q0rFvS0KryS8DVy9iTUEn0KTUUW9j5X8uhIrHpJZ4CWF9YqHY/QvXI
 +n+7QVXFyhZnZHgRlVB2Pb2pdGsYafiTpup5AGuNVv7dbVEzG5SZaJfYGOvxkGQreB
 cJB/A1xZyxEKHKm/6FtptcxLYeM/NSAFASmayT+iWuvw5wBC1sjCvQufHZVy8NFfkk
 N9IEhB1dC7Ja/zStXnBuqqBrzGoZY/O+DN4o3Mf4L2nrzVgAKkxc0rCVRo6KIRAHnb
 Yvtror+RfGioA==
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210914221053.265590-1-giulio.benetti@benettiengineering.com>
 <20210918124739.GN1053080@scaer>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <8d151c55-9804-65da-d556-70dbd2eac3a9@benettiengineering.com>
Date: Sun, 19 Sep 2021 02:53:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210918124739.GN1053080@scaer>
Content-Language: en-US
X-CMAE-Envelope: MS4wfFNSHoJyheKKCxBLFiorlqvgunctuWtS0Ax7I8nf3B11ViFlf5BjI8FrsiNiVjO+My3d7QcSqa57kDX+Xl3s3UmM+s7WeQzMsoWgoNMQ2jRAuj4tqj8Y
 cgjyQhcbEtdEcUtyJ+6IucPRq4RxQYeb/fBfXdQBx0xHbTAGZNeaKX2QjclRcNFBk6IEmnmau6h/ylvmNz3JzBDoJsOg8h3f4QXlxtxNGZXwzT7O1mkguhzE
 Sx2+vm6+RDDi2q90rylybeiI2PIXsR9F8HqFoNEgn2EQWnEhcw4tG3mmqdos3GLT0mCL2Y4AyS+gEIBqH4zg9w==
Subject: Re: [Buildroot] [PATCH] package/mesa3d: fix build on m68k
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi Yann,

On 9/18/21 2:47 PM, Yann E. MORIN wrote:
> Giulio, All,
> 
> On 2021-09-15 00:10 +0200, Giulio Benetti spake thusly:
>> To build mesa3d for m68k we need to pass -mlong-jump-table-offsets CFLAG
>> since 'switch' blocks are pretty wide and lead to build failure. This way
>> 'switch' blocks will have a 32-bit addressing by default instead of the
>> standard 16-bit.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/60c4653c2a93125edbdd0beb43cd47301643464a/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/mesa3d/mesa3d.mk | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
>> index 54b50f684f..809a7d8e88 100644
>> --- a/package/mesa3d/mesa3d.mk
>> +++ b/package/mesa3d/mesa3d.mk
>> @@ -259,4 +259,13 @@ else
>>   MESA3D_CONF_OPTS += -Dzstd=disabled
>>   endif
>>   
>> +MESA3D_CFLAGS = $(TARGET_CFLAGS)
>> +
>> +# m68k needs 32-bit offsets in switch tables to build
>> +ifeq ($(BR2_m68k),y)
>> +MESA3D_CFLAGS += -mlong-jump-table-offsets
> 
> That option has only been added to gcc-7 [0] [1], which makes gcc >= 7 a
> pre-requisite for m68k, while mesa3d currently has no such requirement.
> Maybe add something like:
> 
>      depends on !BR2_m68k || BR2_TOOLCHAIN_GCC_AT_LEAST_7
> 
> Then it should be propagated to the few packages that select mesa3d;
> 
>      package/intel-mediadriver/
>          -> not needed, already depends on x86_64, so implies !m68k
> 
>      package/x11r7/xdriver_xf86-video-imx-viv/
>          -> this should not be needed either, because imx is an ARM, but
>             xdriver_xf86-video-imx-viv is missing a depends on BR2_arm
>             (although the comments do have that dependency). However, it
>             depends on other imx related packages, and they depend on
>             either arm or aarch64, so that implies !m68k.
> 
> So, no need to propagate the new dependency.
> 
> [0] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57583#c15
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57583#c16

Thank you for reviewing and pointing me this, I didn't think about CFLAG 
availability through version.

Just submitted v2.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Regards,
> Yann E. MORIN.
> 
>> +endif
>> +
>> +MESA3D_CONF_OPTS += -DCMAKE_C_FLAGS="$(MESA3D_CFLAGS)"
>> +
>>   $(eval $(meson-package))
>> -- 
>> 2.25.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@lists.buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

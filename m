Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7995ECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 19:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42AFE83F4C;
	Sun, 11 Sep 2022 19:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42AFE83F4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PhgXZXDswLm0; Sun, 11 Sep 2022 19:19:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 697E983F2D;
	Sun, 11 Sep 2022 19:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 697E983F2D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 027431BF591
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 19:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1D7B40241
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 19:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1D7B40241
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X0qkaotGzp_T for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 19:19:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4887400C6
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4887400C6
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 19:19:35 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.22.4])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XSUPoeSugMW5FXSUQoxPs4; Sun, 11 Sep 2022 21:19:34 +0200
Message-ID: <5a597da6-8f7d-5516-91a6-6905db764b00@benettiengineering.com>
Date: Sun, 11 Sep 2022 21:19:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220909221559.1417171-1-giulio.benetti@benettiengineering.com>
 <20220911191742.GG898622@scaer>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220911191742.GG898622@scaer>
X-CMAE-Envelope: MS4xfLE5h+4P1jjJb70Yay3q/2otzGANVw8FLkz+h6smHHSqtiRn+S4gTuls83YxfTLhHMBWNzYOGx7GVdFA8fXLYYmP88N5C5bR91VCWepYwvxxdxNe8+Sj
 iq6R8dZusuaPibRXUS6eS26g+P7X1r7hJuMJa0kcEqsrTk5VSn60eruA8gmlH+TB8MDpzFMg6MlilrZOM92OaZIjwULDatIWPzCjEWmA2tC64XjmFxEo4hEX
 tPCQWy2fYDvGXstJeIKedQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1662923974; bh=TF/W9iJFaOP6Yf9RZscyPocdq9Y2xtdZhp3yKUmjBmk=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=SxkhFn7ucSzZ6n7bQuEtQEUDX14s+nVSStgH6w7QaL3l0AqjK81MmAIbSY4cOyojJ
 eea8BPUEWTBjSM6rHMYSiIikWPJ4qriZb+57lKjb83rN/UpYAGtxlchq43z0XTxOZO
 1DmIc+JVqAwoDFOHRYFHkYOe+1PJ4VJzkL4E83T1iYxYfg5GIn+WW3NQ2n4Ysufsf+
 GkMf4WDJHqZyTnQ178PvlAD1LMGVL5DCXD6Y5qa6TVzB3BwD5p4lLZhWLbMQV55Vqw
 LkEtdItdlPFx2cvYFOlZJvul0LhILFxvXg1+J/CXl1ZPBiWgf4fCQc+y5EjTpEiUAr
 tQ4DKTp4J0L0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=SxkhFn7u
Subject: Re: [Buildroot] [PATCH] package/sox: work around gcc bug 68485
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 11/09/22 21:17, Yann E. MORIN wrote:
> Giulio, All,
> 
> On 2022-09-10 00:15 +0200, Giulio Benetti spake thusly:
>> With Microblaze Gcc version <= 12.x the build fails due to gcc bug 68485:
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. The bug show up when
>> building sox with optimization but not when building with -O0. To work
>> around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_68458=y, we force using -O0.
> 
> Given your feedback on my review, I have amended the commit log into a
> form that looks (at least to me) more appropriate. Please review it and
> yell if I made a mistake.

It sounds very good.

Thank you!
-- 
Giulio Benetti
Benetti Engineering sas

> Applied to master, thanks.
> 
> Regards,
> Yann E. MORIN.
> 
>> Fixes:
>> http://autobuild.buildroot.net/results/ac4/ac4fbd55529ac7b4e635a11766f842cd25a833a1/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/sox/sox.mk | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/package/sox/sox.mk b/package/sox/sox.mk
>> index 1896437ad4..d0329bf50d 100644
>> --- a/package/sox/sox.mk
>> +++ b/package/sox/sox.mk
>> @@ -26,6 +26,14 @@ SOX_CONF_OPTS = \
>>   	--with-distro="Buildroot" \
>>   	--disable-stack-protector
>>   
>> +SOX_CFLAGS = $(TARGET_CFLAGS)
>> +
>> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
>> +SOX_CFLAGS += -O0
>> +endif
>> +
>> +SOX_CONF_ENV += CFLAGS="$(SOX_CFLAGS)"
>> +
>>   ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
>>   SOX_DEPENDENCIES += alsa-lib
>>   SOX_CONF_OPTS += --enable-alsa
>> -- 
>> 2.34.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

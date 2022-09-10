Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D01ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 10 Sep 2022 14:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72C5083F34;
	Sat, 10 Sep 2022 14:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72C5083F34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id efMQeX2CuKjV; Sat, 10 Sep 2022 14:29:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 711D883F25;
	Sat, 10 Sep 2022 14:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 711D883F25
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 576961BF3C1
 for <buildroot@lists.busybox.net>; Sat, 10 Sep 2022 14:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4009B4050C
 for <buildroot@lists.busybox.net>; Sat, 10 Sep 2022 14:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4009B4050C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0kc69I_5XWYF for <buildroot@lists.busybox.net>;
 Sat, 10 Sep 2022 14:29:54 +0000 (UTC)
X-Greylist: delayed 00:07:04 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C6814010C
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C6814010C
 for <buildroot@buildroot.org>; Sat, 10 Sep 2022 14:29:53 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.28.15])
 by Aruba Outgoing Smtp  with ESMTPSA
 id X1NfoDLJ0eVWJX1NfoKQ8g; Sat, 10 Sep 2022 16:22:47 +0200
Message-ID: <1fb3d72b-f7b1-e965-06fd-1d5e6c9d3b31@benettiengineering.com>
Date: Sat, 10 Sep 2022 16:22:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220909221559.1417171-1-giulio.benetti@benettiengineering.com>
 <20220910070548.GD264214@scaer>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220910070548.GD264214@scaer>
X-CMAE-Envelope: MS4xfGrEsIWBQqsWuDNweYm/fvkSUd3yISUiH2VGKzJjEj3o/UzjGLI5mLH13FyjdSsINTStsY+hewb2kXZhY0rh/lgdP3PODIJdUcpv9xQC2ZyziNagbbId
 LiS8riRqCduoSTGAnRdHFMgkfgFznFGuRQbrLhItGairPxDsmUQc/wWfsqV0vpsvJMCL7vSU8z4gOJT46TcNn1pf9y/h+msWB6aBs7LUFK4TtG82bqyr8nXg
 rTyplP28mQQFUUhBCIM5ig==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1662819767; bh=d11ni0+TIknShnUj0ri9+yUHBQkO9B/rxLfCXpnadVI=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Bpo5zPaYCW37k3P9sldvJM6Aysey7yKUWAR8ILh7k9wqezBUGqe2SbeUORgZaKlTM
 55W8qWmvKluhjwuLOzDI+9toXbiWWxYXMAH2XEFG/xA8wBCb9f6hShggaBNPK1etNT
 UyPmCSIHlFPJTgKCIBsUmyUSG4O7s180DywEXHOWlnZSLPw1RSHAOftAbpLVCY7sFB
 4fwMZ436T5ScBpZ8aNcWCV08+jF5iBEsq6rZn/S8QpwzfQ29FWcvhfWhu0QpbQVehE
 fRLn1D6DHO8f5tguqQmsBI/p5jtikB5O05/8GTTAH8Dg07cU12O6YubzZFNzJ+L5uL
 v0hPaEfE68ifA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Bpo5zPaY
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

On 10/09/22 09:05, Yann E. MORIN wrote:
> Giulio, All,
> 
> On 2022-09-10 00:15 +0200, Giulio Benetti spake thusly:
>> With Microblaze Gcc version <= 12.x the build fails due to gcc bug 68485:
> 
> Since the latest gcc versin is 12.x, then "gcc <= 12.x" actually means
> all versions of gcc, no?

Yes, it's only I'd prefer to keep track of the status of the bug in
commit log if possible for orienting on future bug status.

>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. The bug show up when
>> building sox with optimization but not when building with -O0. To work
>> around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_68458=y, we force using -O0.
>>
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
> 
> Since you said the bug only appears for microblaze, gcc <= 12, and this
> specific gcc bug, then shouldn't all three conditions be used?
> (excluding gcc version because of my earlier comment):
> 
>      ifeq ($(BR2_microblaze)$(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),yy)
> 
> I.e. there is no reason to penalise other architectures, since only
> micrbolaze is impacted by that bug.

Yes, but this is already achieved by BR2_TOOLCHAIN_HAS_GCC_BUG_68485
because in toolchain/Config.in it:
default y if BR2_microblaze

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

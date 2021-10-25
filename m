Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F4AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:59:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 063D26103C
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 063D26103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D082A80CAA;
	Mon, 25 Oct 2021 18:59:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MPzN08V37uVI; Mon, 25 Oct 2021 18:59:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C24180C1E;
	Mon, 25 Oct 2021 18:59:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EFEC81BF20D
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E006F60847
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:59:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lGwJrUQonVNM for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 18:59:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2D3460737
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 18:59:28 +0000 (UTC)
Received: from [192.168.153.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id f5BumpXa0qi9if5BumuAOS; Mon, 25 Oct 2021 20:59:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1635188366; bh=Ms8OAqtOqu9qhclvHShwk5I4X4aEzYliMjWofW13Cok=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=YXtQDXgbcjlQfGKq/1OaHAbMClVujXSsS1ih5VkRYMbDndQCuHOAsrlHsjDX10DvB
 dVT1ygCyFDz6IfJ9NpAPwE+N1IClaYzp56K2p8gD54IkRhHfSMWlCEVDATXXdyIUt5
 b6UlEakY26sTVpxpbNslEUz39CEIi4fKj1TteWHQIJh2hpiANxgbO8QG/A5q8JmnZX
 wVT4WNIxl6sR1sqqKSWjN6elNLj8BvmPhRj70P2DYZdzrgDgL2a2lnw1c+qPpgUov+
 NZNUZwJSmOPzsQLbBLnhdOwvJWLFNhbCfJNgvHvx6qDDYSZrM+z/m7WBKPsyuVkOQV
 Wd2alOOjzDvqQ==
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20211010224220.1111960-1-giulio.benetti@benettiengineering.com>
 <782a9bea-cf76-3123-a700-761749f2d34a@mind.be>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <9d1fad97-2d56-6fc0-a1d0-1f113cbe2e9b@benettiengineering.com>
Date: Mon, 25 Oct 2021 20:59:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <782a9bea-cf76-3123-a700-761749f2d34a@mind.be>
Content-Language: en-US
X-CMAE-Envelope: MS4wfDS41jWDFaR1vd0ojOhwJATwtnxOYXE0R0bNOB1/Ea3+mbBcTAIJ18/vyUdMiGLo+YMSZqNSZjVvIdQMZ1QEqEiv3AFv+NjjBdo8YfM4mYonfBvdscCs
 o9ymI8M7Alf5sKV/X1/lfI44nUmw0X1+Pici8W68gk6C+QUqSTAWkyLnbGOK9p5h47iobky5STbLpO1pOb2hxxoqW++WSQRKb3WyXUNNprvqZ+emuW++FEHt
 TgBZLgq5DZ8Lwb0FsrC0xi/iGpR1414UlnQb8L1766rjfjoXfGcR4xszccWm4vIn
Subject: Re: [Buildroot] [PATCH] package/gqrx: add missing reverse
 dependency for gnuradio
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/25/21 8:54 PM, Arnout Vandecappelle wrote:
> 
> 
> On 11/10/2021 00:42, Giulio Benetti wrote:
>> gnuradio suffers from gcc bug 43744 but gqrx that depends on it doesn't
>> take into account the gcc bug. So let's add it as:
>> 'depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744 # gnuradio'
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>    package/gqrx/Config.in | 4 +++-
>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
>> index 60942c36c8..9faa50603e 100644
>> --- a/package/gqrx/Config.in
>> +++ b/package/gqrx/Config.in
>> @@ -8,7 +8,8 @@ comment "gqrx needs a toolchain w/ C++, threads, wchar, dynamic library"
>>    comment "gqrx needs qt5"
>>    	depends on !BR2_PACKAGE_QT5
>>    
>> -comment "gqrx needs a toolchain not affected by GCC bug 64735"
>> +comment "gqrx needs a toolchain not affected by GCC bug 43744 and 64735"
>> +	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_43744 # gnuradio
>>    	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> 
>    This should have been an or instead of an and.

Aah, yes, sorry and thank you for fixing

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

>    Committed with that fixed, thanks.
> 
>    Regards,
>    Arnout
> 
>>    
>>    config BR2_PACKAGE_GQRX
>> @@ -21,6 +22,7 @@ config BR2_PACKAGE_GQRX
>>    	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
>>    	depends on BR2_PACKAGE_QT5
>>    	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # gnuradio -> boost-atomic
>> +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744 # gnuradio
>>    	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # gnuradio
>>    	select BR2_PACKAGE_BOOST
>>    	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
>>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

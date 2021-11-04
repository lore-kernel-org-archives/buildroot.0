Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 159A8C433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 14:55:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BFBB610FC
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 14:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2BFBB610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDA7D8188B;
	Thu,  4 Nov 2021 14:55:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2caC9HmX_DF3; Thu,  4 Nov 2021 14:55:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 407F780F87;
	Thu,  4 Nov 2021 14:55:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E170A1BF5F6
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 14:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0935405BA
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 14:55:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ALTXBVTs9vzT for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 14:55:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D7CC405B9
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 14:55:36 +0000 (UTC)
Received: from [192.168.153.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ie9OmOdBHsfk3ie9OmFwhw; Thu, 04 Nov 2021 15:55:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636037734; bh=GmzAFGR91HEYZ7wkRbDIwZdtdNtj2teYeeoUwrgybuM=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=PKdX2nTqh1T3z4j6oyiR85ZvZ2CERjwZN48SeKjVmOSl7Zi/yFTr3jmYkN52BIhH5
 yibQaMM5HxB/zxlF7n6Z3VAsrkPfkrETb5QZSwSDaKNes/lPLT80z3qOOnJ4qcr0IJ
 yzIgLyci4ymuI+kKHsiS6JG+Ha6xycB3Xfqo8TtYU3/HVKnxoT+Yi8G+aZheOmGBaw
 BfCC5Feu6EHeMQjs0ugrLz9/vxLYCwRDvN1gVb2OLdKi7syBQM/PZ3ASqRx/rzZoQS
 ZrbOuISarvDzMZnb4s41V6rceBROtmIHGzrw0ewLkC2XLxrvFQ68U7TNrZLWTy8KMr
 92EhLR+l0+38w==
To: stsp <stsp2@yandex.ru>, buildroot@buildroot.org
References: <3c3603ba-5719-fec9-9bb3-7b0f3967fc9f@yandex.ru>
 <b379b067-4456-324c-f768-2f6eac1b155c@yandex.ru>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <1180b9a6-7a4b-853b-a61e-0f853cdb5ef8@benettiengineering.com>
Date: Thu, 4 Nov 2021 15:55:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b379b067-4456-324c-f768-2f6eac1b155c@yandex.ru>
Content-Language: en-US
X-CMAE-Envelope: MS4wfFUQSR4e1W3uIDho68n67QbrgrRjiLwCB5HSwSszc3rq7nOo1QyImBHDvpG3i/tEuScMNn67ElfDxdiSj3TE9dPyN2bKYfiHs2WnpBoWr6MEzVyNlKZm
 Whl801HH7G7RCTNRd/vmo+6mM8k3WfpGQ0QtZuZUbU4/VsbP2GbmiDbTy9T8aVVDypbDHi6sH1+oQergtWFC7uE/Gk5/czTJ13vrStfzWEy8Tkip7NU8yDYH
Subject: Re: [Buildroot] generic code with i7 bootlin toolchain?
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On 11/4/21 11:02 AM, stsp wrote:
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
>> Unfortunately some package(I would say many) has theirself a broken way to correctly pass external C/CXX/LDFLAGS.
>> Usually they internally override some flag that makes null what we pass or worse they completely ignore them by using hard coded flags.
>> To fix this specific problem we should go through every package and fix the package build system itself(a huge work).
> I initially thought the same way.
> But it seems to be after some more
> investigation the other way:
> $ file
> /home/stas/src/fdpp-buildroot/buildroot/output/host/bin/x86_64-linux-gcc
> /home/stas/src/fdpp-buildroot/buildroot/output/host/bin/x86_64-linux-gcc:
> symbolic link to toolchain-wrapper
> $ file
> /home/stas/src/fdpp-buildroot/buildroot/output/host/bin/toolchain-wrapper
> /home/stas/src/fdpp-buildroot/buildroot/output/host/bin/toolchain-wrapper:
> ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked,
> interpreter /lib64/ld-linux-x86-64.so.2,
> BuildID[sha1]=965fad722d4737f4373924e5b37b0973c0cd5f46, for GNU/Linux
> 3.2.0, stripped
> 
> So it looks like buildroot creates
> the toolchain-wrapper binary as
> a replacement of gcc, and that
> binary would invoke gcc (and
> perhaps ccache too) with the
> needed flags.

Yes

> So such scheme should resist to
> the "bad" packages you mention
> because it doesn't rely on them
> handling CFLAGS correctly.
> There might be some other explanation
> to the problem I see.

No, it doesn't resist to the "bad" packages. Try to imagine an 
auto-tools package where you can pass CFLAGS, but in Makefile.in you 
find out that it does come check and it append something like "-O2" and 
instead you want "-O0", but this way you will end up having CFLAGS="... 
-O0 -O2". This overrides the optimization flag, so this doesn't solve 
the problem.

> Thinking more about this - maybe
> libgcc or some other lib from the
> bootlin toolchain is over-optimized?
> In that case I should ask at bootlin
> perhaps instead...

I don't see how it could help, also what you mean with over-optimized? 
Do you mean that -Os on building Bootlin toolchain could lead to the 
toolchain to fail in some way?

> Please CC me the replies if possible.

This is what I do, I "Answer to all" including the ML.

Anyway here I think we're losing the focus of the previous e-mail that 
you can't build for AMD. Can you provide the exact CPU model you're 
buildling for?

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

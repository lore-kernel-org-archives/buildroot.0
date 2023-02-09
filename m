Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577B8C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 14:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1F728219E;
	Thu,  9 Feb 2023 14:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1F728219E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZA1GWKzXK3ez; Thu,  9 Feb 2023 14:45:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1514B8219A;
	Thu,  9 Feb 2023 14:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1514B8219A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 244FB1BF36E
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 14:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F254960B10
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 14:45:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F254960B10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5J017FDmQdYl for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 14:45:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0973C60BAC
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0973C60BAC
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 14:45:48 +0000 (UTC)
Received: from [172.25.4.108] ([151.79.164.54])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Q8BFp74LGniHoQ8BFpbHUF; Thu, 09 Feb 2023 15:45:45 +0100
Message-ID: <548774bf-1542-e749-4c0b-200041d0a6b3@benettiengineering.com>
Date: Thu, 9 Feb 2023 15:45:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230209004823.3698203-1-giulio.benetti@benettiengineering.com>
 <20230209085419.29494fbb@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230209085419.29494fbb@windsurf>
X-CMAE-Envelope: MS4xfAM4KweXTtXFQHXPxstl/zwbF1ufyOe4IIvd6OPlwMEgf94LmqwS1KjHJ18WnkEJIMHe2GHyUdkj6Hlvw2E9dhKbyMZvi8O7mkKI/A0sm2fZqvbez3QI
 jPK82giiQXSZyvtysLS4M9+1bqv3NBI08RrWyGJHx1+Carw+1H4CiZqVZ61IfTM8TXUk4kOl6MrndHjXxY9leOTA5NLk6wbWUdghQRhn+q9Wmh0dHQjA6tkT
 sPUuLwn21ciYJJiaCTevDgUjKiv2W/XMCPBfCFOVEf61XCVWFQr2yfDSXMbIYLLD
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1675953945; bh=6rZeozNcGyC+uqV+qL4noZvko0pYTdeMI+pTp+qKTBM=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=IhFtd3n2Nej9JMgfPPPUWQWbKe0bIaLaVZrsUEdfmgzTEEaujH8svGYfsUvox6ONQ
 oOf86hzVkvRrQNOz85cNYUBNETFznhRD3qA3RUfdo77ZurD78Ioi7jfcQXv1Miy+lT
 PAP+dMwWYGwEyxPHHcY7WgaaU5QYWTuy0+kO0rJTG7RqBxczfdNjwexK91axvK+2wf
 H7Q+bFSKx77agtOx/JJ7h1wZeWCVPiXBheBPWy/LOyluuff7/a2vlVs2J6jvaEfBDx
 aQR1bCo/ZuIz3rODgql22gMmjAdH2wzhth5TuQWPnOcAnjy2G3UGiDCWzk79OnxigQ
 GoqaHyrKyJD6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=IhFtd3n2
Subject: Re: [Buildroot] [PATCH] arch: move global and rename variable
 BR2_PACKAGE_Z3_ARCH_SUPPORTS
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 09/02/23 08:54, Thomas Petazzoni via buildroot wrote:
> Subject:
> Re: [Buildroot] [PATCH] arch: move global and rename variable 
> BR2_PACKAGE_Z3_ARCH_SUPPORTS
> From:
> Thomas Petazzoni via buildroot <buildroot@buildroot.org>
> Date:
> 09/02/23, 08:54
> 
> To:
> Giulio Benetti <giulio.benetti@benettiengineering.com>
> CC:
> Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
> 
> 
> On Thu,  9 Feb 2023 01:48:23 +0100
> Giulio Benetti<giulio.benetti@benettiengineering.com>  wrote:
> 
>> Package quickjs fails to build on architectures that don't support full
>> float rounding. To support all kind of float rounding FE_DOWNWARD,
>> FE_TONEAREST, FE_TOWARDZERO, FE_UPWARD must be defined in fenv.h.
>> Since package z3 locally implements this check let's make it global,
>> rename it to be generic and use it for both package quickjs and z3.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/0b6/0b67381e3643c134c92cbcd1c5dc258fd760cd7e/
>> http://autobuild.buildroot.net/results/cf2/cf249a82c83d3c8503205f4c3c5859dd9d52afdf/
>> http://autobuild.buildroot.net/results/9b3/9b37c6c55a5b468657af26ef9b57d4fe24d8fde2/
>> http://autobuild.buildroot.net/results/4f1/4f13cf7d353260c6b8934dbdcf267bea884b356b/
>>
>> Signed-off-by: Giulio Benetti<giulio.benetti@benettiengineering.com>
> Apparently
> https://patchwork.ozlabs.org/project/buildroot/patch/20221216221934.465323-1-ju.o@free.fr/
> would also need the same thing.

Yes, it requires it too once it is applied. I can modify my patch if you 
apply the swipl one before. No problem.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

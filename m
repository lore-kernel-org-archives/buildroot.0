Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F47C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 12:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01D6C83FAD;
	Fri, 29 Jul 2022 12:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01D6C83FAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iO3PMzyCBmTN; Fri, 29 Jul 2022 12:29:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20ECA83FA8;
	Fri, 29 Jul 2022 12:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20ECA83FA8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 01BCE1BF3F9
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 12:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D868083FA8
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 12:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D868083FA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jVIOktuHROfm for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 12:29:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47D8283F6D
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47D8283F6D
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 12:29:55 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HP7po312dbMeiHP7poNlyu; Fri, 29 Jul 2022 14:29:53 +0200
Message-ID: <b24dfe19-b57b-23fc-8822-3fd87d2b0e05@benettiengineering.com>
Date: Fri, 29 Jul 2022 14:29:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220729121055.168510-1-giulio.benetti@benettiengineering.com>
 <20220729141205.2bde03b3@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220729141205.2bde03b3@windsurf>
X-CMAE-Envelope: MS4xfPjzS/Std+Pp7bnSQLu2oZEJMkeaSYqcgaog3+SpmT1RkjTwunzwieARenlo86/t8XgJ8f6vCsiUWlsok6izU+VzSYljsU6nL5Wbc2ZGOMYqVYnymSa7
 wLjkLZR3GNc1r1UGzfBA36Ftym4gPm7p7GHtQUQJ4Ta4cH48f4+05AkWwO1M6CB5til7Pay0kTdPe+9fXFPLI8mgKX7hrMJ3jF3v+RNGUfNeJSvH2eI3yeou
 ZD3DTFrCVtq8HCIKWQyyxGi9USCcJRKRekb9zKcJ97R0kpyOr1/lFYZsVADw8rmqa0iZ+5l7xN35QtPCGRZMnqesP8hK0i3jiRh+DHwP9mH4CPTCoiomA7IL
 3NLkw6e/
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659097793; bh=x5vMbntr+Y4z1SYLij2XjbuZscxZOGnLaCmh5XFHlfM=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Ic+dJyQMS3BVtF5zOpF5bTlUTvOLAyQ+ogIyxtePPNbBjf4/rjzLWyhohlKn2MJ5u
 aj0kciDHZCiXBHeCqcj+6kBly/QmDasyfLEJwKoyHstsvukI2DsS9SpKCcjYfwfT10
 PK5LDY5ObucURk0oZktyxY14iaO6DafPL+WbkDv3WGEpmxPRj881rfvJdw6XIHXzBc
 hMs2pvV7kM0yZndurndlZH2hMrWrhtd9JykcfZQJNvJneLGp6w+DXtFRTaqEcqhFfw
 LbsY8jbwFdb5ayDvBQ6g0drWTNsuhkafpyeOPM4Om9ocxPi2Gv1JozreRSwXNTOAtA
 lOEKV2viJd8uA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Ic+dJyQM
Subject: Re: [Buildroot] [PATCH 1/2] toolchain/Config.in: update gcc version
 for gcc bug 68485
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 29/07/22 14:12, Thomas Petazzoni via buildroot wrote:
> On Fri, 29 Jul 2022 14:10:54 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>>   # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. This bug still
>> -# exists in gcc 9.x
>> +# exists in gcc 11.x
> 
> What about the recently introduced gcc 12.x ? :-)

You're right, gcc 12.x is still affected, do you want me to re-send?

-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

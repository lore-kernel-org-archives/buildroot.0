Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501F6C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 19:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC81340465;
	Thu,  8 Dec 2022 19:45:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC81340465
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eGBfnF754kaH; Thu,  8 Dec 2022 19:45:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 135EE40396;
	Thu,  8 Dec 2022 19:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 135EE40396
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6AFD01BF2F0
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 19:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DB41401B7
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 19:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DB41401B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sc7Z1TVYfzeR for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 19:45:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EF7D403E9
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EF7D403E9
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 19:45:16 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.87.80])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 3MpXp523xQipd3MpXpiTZv; Thu, 08 Dec 2022 20:45:15 +0100
Message-ID: <40e258f5-e92a-362c-4540-650b9ed8504a@benettiengineering.com>
Date: Thu, 8 Dec 2022 20:45:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Sergey Matyukevich <geomatsi@gmail.com>
References: <20221208174057.687435-1-giulio.benetti@benettiengineering.com>
 <Y5Iw9tj1ivJtQ7xb@curiosity>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <Y5Iw9tj1ivJtQ7xb@curiosity>
X-CMAE-Envelope: MS4xfDGpc9ixbmVHK6IcDoA7y0r7kJZV8vKrzutmT+SXA/+ksmbPouW+iyZ37llZv2bOPH/kLO3xz8F9lDNK/qyNWH7mvfJ2AJHmVhyw1jrzDElO+FaucKx6
 qHPiBa8nTh9H6eSsaN88AvVM0psYT7bQz1yFkMAjxi/ZhG6jmPDwms+/tYRVcXYOqM9A6p7PO00mTT0Nh1LEocTXb7DFYgphbrkyr2DIXBsZaVbt5mBMLIh3
 Ht5DXYSzn6PSpJNRla1a6g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1670528715; bh=Yd4KZYTAy9aqKbW9a+nAzaUEKgSy+z3aodTa5PgzFw4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Yj2jpL9Y5FWH4Tb5oPHzDGV/bwNW4GnDfe/5a+5bDaCNk6NyYUwKwrnQfLEjIALn7
 +LaAJn5MJ3GBNnyKt8/+7kmsklcWnp1jQVOlLq48LxyFQbZTNAYcLqmkM3QQxF9tot
 fh9Ye+gGal577HE0XKnqZCF75FTPnW/G08vIrXF8leKB5f7hBuaE7FsUU8qjIom2aI
 +PBGGE+ovee31xEGzNMmTInDX+ger0ZxpL1/4Oyyf7wEbRJwPgNjnDmIFvrWLNGGdI
 h1kgYLOW31zGRVi07z5XyyLuWFnpU3yBuNeMvgzocfqhRVfCPR+plTsVY0oB3zeGU+
 xXnsKCq45egxQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Yj2jpL9Y
Subject: Re: [Buildroot] [PATCH] package/xr819-xradio: fix build failure
 with Linux 6.0
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

On 08/12/22 19:46, Sergey Matyukevich wrote:
>> Bump to latest version to fix build failure with Linux 6.0.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/xr819-xradio/xr819-xradio.hash | 2 +-
>>   package/xr819-xradio/xr819-xradio.mk   | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> Could you please add references to autobuild reports.
> I have at least the following ones in my mailbox:
> 
> - http://autobuild.buildroot.net/results/434c1d2a5104090366519278314bf750324d3710/
> - http://autobuild.buildroot.net/results/002cbbce02db8ccfc6e8f4eff8998f75615745a9/
> - http://autobuild.buildroot.net/results/738eebd1e2480592100d92a80e801e01bfd32d9c/

Oops, thank you Sergey. I've forgotten to add it.

> Regards,
> Sergey
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

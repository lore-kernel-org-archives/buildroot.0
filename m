Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16B4C433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 08:56:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D52E611AD
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 08:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D52E611AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C06B6074F;
	Tue,  9 Nov 2021 08:56:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RRWWelKQ8K17; Tue,  9 Nov 2021 08:56:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 805C760732;
	Tue,  9 Nov 2021 08:56:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E57E1BF868
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 08:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89FF7402FE
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 08:56:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3qAoYJsAgzop for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 08:56:11 +0000 (UTC)
X-Greylist: delayed 00:07:05 by SQLgrey-1.8.0
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp2.osuosl.org (Postfix) with ESMTP id 327ED402F1
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 08:56:10 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kMoSmxrgCyoivkMoSmN17N; Tue, 09 Nov 2021 09:49:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636447744; bh=bJG/2Y5KKY93a9QpJQesW9IxC8pSVKKG3jArDRfIhUg=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=XF8gDjl7qcb+MT7zhuuJiQ15a9hw4X9MUFBbulh0PUmExu+hRQxgxI2i5YVf4/om5
 eKAQCeZy9MSAvwBdjiKZbRkyA9AOZUsmucVRK+4IWWfndYJmvDfAjxgE4IHVuw0VgG
 ie4qlzTIj/BvhKdMFE4Os6NuST5H7tbDc2sacHXJLcZ6RGj3c6xGnYUe67lqNVf3vR
 hneiTkxN6Kw5hb3rOaHItDsqpXq04nY0BfooElSTaKq+rJtqj+2qvJRe35yLnrd8/S
 JamqRd+heOl65a8kg0KOpUy5hPpZ7MvKgtDx063Txu+4Lla8NLKJlCPEVQ3ElqLess
 PqOTebhouFJ4w==
To: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
References: <20211108230520.4007148-1-giulio.benetti@benettiengineering.com>
 <20211108230520.4007148-8-giulio.benetti@benettiengineering.com>
 <eea83befc9a6f40dad4efa7a4ae019de@walle.cc>
 <03f9ad1a-21d0-a5ef-d563-86e1446d8545@grenoble.cnrs.fr>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <0815dcf4-bab0-bcb3-2084-44c876499f88@benettiengineering.com>
Date: Tue, 9 Nov 2021 09:49:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <03f9ad1a-21d0-a5ef-d563-86e1446d8545@grenoble.cnrs.fr>
Content-Language: en-US
X-CMAE-Envelope: MS4wfNESdKkr3HDPYbQgVSM3h6/ijRE9iONOM55yGdj4pPAJY1p+o8ngla4vr4EpAieefu4Zr6PvycqKSOqdqLJ/0QuIBUxlEJfdvqMuhAjbGmpTnW9P8f8p
 6Doqph23zIsQGJ7pCq50/Y5eNeXCKC3uc6lwuwoHR8VJdX4Dkd1E1ZcWra1Kg+/fsNHVy6FmMLdAmrcjDcE1VO7J8FG41rJVPZ76gKTBCv1Ay4oNxvSjiwr4
 blPEXyj2C5Ug5nlWfnxE9Q==
Subject: Re: [Buildroot] [PATCH 7/7] board/kontron/smarc-sal28/genimage.cfg:
 fix option suffix
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

Hi Edgar,

On 11/9/21 9:26 AM, Edgar Bonet wrote:
> Hello!
> 
> Michael Walle wrote:
>> There is no "K" prefix in si units. Stictly speaking there is no "KB";
>> there is a "kB" or a "KiB".
> 
> Although not a de jure standard, quite a few Linux tools have adopted
> the following convention:
> 
>      1 KB = 1000 B (i.e. 1 kB)
>      1 K  = 1024 B (i.e. 1 KiB)

+1

> Here is an excerpt from man losetup:
> 
>      The  size  and  offset  arguments may be followed by the
>      multiplicative suffixes KiB (=1024), MiB (=1024*1024), and so on
>      for  GiB,  TiB,  PiB, EiB,  ZiB and YiB (the "iB" is optional,
>      e.g., "K" has the same meaning as "KiB") or the suffixes KB
>      (=1000), MB (=1000*1000), and  so  on  for GB, TB, PB, EB, ZB
>      and YB.

This is a good description

> Given that this is a common Linux convention, "offset = 4K" makes it
> clearer that these are KiB ("offset = 4KiB" would be still clearer if
> supported).

Thank you
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Regards,
> 
> Edgar.
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

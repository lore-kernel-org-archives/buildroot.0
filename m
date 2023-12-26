Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CCDC46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 21:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5406409F8;
	Tue, 26 Dec 2023 21:28:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5406409F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bjjyDHLgP38d; Tue, 26 Dec 2023 21:28:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEE88409F9;
	Tue, 26 Dec 2023 21:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEE88409F9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27E471BF20F
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 21:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09DC741759
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 21:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09DC741759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K7CCJoMruAcn for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 21:28:06 +0000 (UTC)
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A8FA4175E
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 21:28:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A8FA4175E
Received: from [192.168.50.163] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id IEy2rROUk2IzBIEy2rFC10; Tue, 26 Dec 2023 22:28:02 +0100
Message-ID: <cb4f8256-50a9-4ddd-9bcd-3075ebb0d42e@benettiengineering.com>
Date: Tue, 26 Dec 2023 22:28:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20231202015123.2609353-1-giulio.benetti@benettiengineering.com>
 <20231224121121.401724a3@windsurf>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20231224121121.401724a3@windsurf>
X-CMAE-Envelope: MS4xfKpNREaGspEfFmxSWhjFerLHmq7/RfSfrXxdKdm176LgvwRd0tYIjtV/ZmhBU+ZJd4s1WQJ1bvtiPAN4Y83FTGrpdYq/2juL0ZlmpLYDOyS/tDqlLec0
 yQX7OwTnNW6WUx0P0uChX12kPtxrcbS6EwEz7x4sTbqiHp1p5MhD5mVepVnCRjMFfuGqvpso4Gp8fJfxn15RRR7pS9bRku7Pkd+F+SRYXvWW8+dpJuOXJP8M
 C4uj4dhjOlqghaGSBeAXk3UR28JCLaVZvAgaK/ngET9nVVZH45DX1x6mT7ANSJSdU7Ghpk1mCrp+zD5kS3QX29V9gCb4Tg0LiMlmbryF5fI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1703626082; bh=o6BKUTjVMbJWnCI35WovNk3LpuDYizW8fOEYibsy8aU=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=QMNfHJgqiFFTUuOdlaBIrUj+mhRgsRNj4gTO1IhR8p1cR9inzRnB6mF/ruDtE9it8
 r3HvIB0pxe91vp/Ylzj36JtrBJJV54/JVB7WoYUCSVg6quyGPHMd6ImgIB1JNZS1ku
 tuijlSRNP0u6g/IdRaLaSJw4hc9kSFpba+JTkjyNnZDLAluUXiFPlQSJYChUS99S8p
 8Aw9PbvPub4VWQmr4a8sf04Z6FfdoKWXw2+NPItlYFxPvuTE4wpeyTYgxO1tWheq0a
 4y/p8oVXrJSLQu93ey+XFXCSHePjDc3e8O4NTdIC9IYWh02V6BD5FCQauw2HwCeycV
 Llndb0/QITqfQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=QMNfHJgq
Subject: Re: [Buildroot] [PATCH] package/swugenerator: add missing
 dependencies
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
Cc: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On 24/12/23 12:11, Thomas Petazzoni wrote:
> Hello Giulio,
> 
> On Sat,  2 Dec 2023 02:51:23 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
>>
>> At the moment swugenerator package lacks host-openssl, host-gzip and
>> host-zstd. All their final executables like openssl, gzip and zstd
>> can be used by swugenerator if the correct flag is passed so let's
>> add these missing dependencies.
> 
> Could you clarify whether these are runtime dependencies? If there are
> build time dependencies, do we see build failures in the autobuilders?

I haven't thought about it. They are runtime dependencies, so we can't
see failure in the autobuilders.

>> diff --git a/package/swugenerator/swugenerator.mk b/package/swugenerator/swugenerator.mk
>> index f4ead1d229..141a6a96c5 100644
>> --- a/package/swugenerator/swugenerator.mk
>> +++ b/package/swugenerator/swugenerator.mk
>> @@ -9,6 +9,6 @@ SWUGENERATOR_SITE = $(call github,sbabic,swugenerator,v$(SWUGENERATOR_VERSION))
>>   SWUGENERATOR_LICENSE = GPL-3.0
>>   SWUGENERATOR_LICENSE_FILES = LICENSE
>>   HOST_SWUGENERATOR_SETUP_TYPE = setuptools
>> -HOST_SWUGENERATOR_DEPENDENCIES = host-python-libconf
>> +HOST_SWUGENERATOR_DEPENDENCIES = host-gzip host-openssl host-python-libconf
> 
> In your commit log, you mention host-zstd being needed, but you don't
> add it to the dependencies here. Could you clarify this as well?

Ah right, I simply need to add host-zstd because swugenerator can use
gzip or zstd at runtime.

Thank you for reviewing.

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

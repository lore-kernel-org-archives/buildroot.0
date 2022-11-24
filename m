Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC49AC43219
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 20:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C68140AA8;
	Thu, 24 Nov 2022 20:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C68140AA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sLEhHy-zRCAU; Thu, 24 Nov 2022 20:59:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D892405F9;
	Thu, 24 Nov 2022 20:59:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D892405F9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 433701BF20B
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 20:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B9D881E74
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 20:59:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B9D881E74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1pewpcfPsOfL for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 20:59:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A130081E4F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A130081E4F
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 20:59:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.6])
 by smtp2-g21.free.fr (Postfix) with ESMTP id 4554C2003CC;
 Thu, 24 Nov 2022 21:59:07 +0100 (CET)
Received: from [37.171.166.93]
	by webmail.free.fr
MIME-Version: 1.0
Date: Thu, 24 Nov 2022 21:59:07 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20221123151715.4a454fed@windsurf>
References: <20221122215557.789750-1-ju.o@free.fr>
 <20221123151715.4a454fed@windsurf>
Message-ID: <9763033b48c01a0c1869b9fffae775d8@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1669323547;
 bh=tZDRRtbC0a/PpAMCj0x5XSWzm+YY4F8tvzeijV7sGt8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GCMYvZe1+f54Lqg2y9DYullJS8adZe9nr+kNwWmp+xMh/JWA+dN1/BoiLLYLb+V90
 Jb/zXBSsJbtX0rWuJgQOCrUquAQZbgaOazuUNpo1Z5KbVu6q1OrssEz3dyitHZfXUm
 Vkz+JzerGPnEQ3X32MejJG6Q8ZRy680ZwzpF6g9OZn5/YMPOSe5rejaswtmD0puf30
 EW0VRNZa8qllyRVGB6xTn8YOo+KPdlZpzW2nCOrMswS0hx/UxwjsJUJrcOd/6ESnGt
 gM8kIv9RsJk000NkF84TwYPPpzPeKRB6OFTR1ZwdlN2xmky199cwcaJg8NkwezACYl
 dM2GAhapblK6A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GCMYvZe1
Subject: Re: [Buildroot] [PATCH next 1/2] package/highway: new package
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

Hi Thomas,

On 23/11/2022 15:17, Thomas Petazzoni wrote:
> Hello Julien,
> 
> On Tue, 22 Nov 2022 22:55:56 +0100
> Julien Olivain <ju.o@free.fr> wrote:
> 
>> diff --git a/package/highway/Config.in b/package/highway/Config.in
>> new file mode 100644
>> index 0000000000..f9a0bc910c
>> --- /dev/null
>> +++ b/package/highway/Config.in
>> @@ -0,0 +1,42 @@
>> +config BR2_PACKAGE_HIGHWAY_ARCH_SUPPORTS
>> +	bool
>> +	# Supports all BR architectures by default, with few exceptions
>> +	default y
>> +	# Armv7 support is only with fpv4, see:
>> +	# https://github.com/google/highway/blob/1.0.1/CMakeLists.txt#L221
>> +	depends on !BR2_arm || BR2_ARM_FPU_VFPV4
> 
> Hm, I suppose if it works on other weird architectures, it must have a
> non-optimized version, that could work on ARM platforms that do not
> have a VFPv4 ?

You are right! There is apparently an issue in the package on
detection of arm without VFPv4. I initially wrote this package recipe
for highway-1.0.1. I then updated it to 1.0.2 which seems to have
relaxed some restrictions (incl. RISC-V 32bit). I'll investigate how
those limitations can be removed and send an updated version of this
patch.

>> +ifeq ($(BR2_ARM_FPU_VFPV4),y)
>> +HIGHWAY_CONF_OPTS += -DHWY_CMAKE_ARM7=ON
>> +else
>> +HIGHWAY_CONF_OPTS += -DHWY_CMAKE_ARM7=OFF
>> +endif
> 
> So even with -DHWY_CMAKE_ARM7=OFF, it doesn't work for ARMv5, or ARMv7
> without VFPv4 ?
> 
>> diff --git a/support/testing/tests/package/test_highway.py 
>> b/support/testing/tests/package/test_highway.py
> 
> Runtime tests coming together with the new package: excellent!

Yes, this test infra is fun! If I manage to remove the arch
limitations discussed above, I'll also rewrite this test to use the
default armv5 config...

> Thomas

Thanks for the review!
Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

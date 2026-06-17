Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BDCCD98F0
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 11:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C908C847CA;
	Wed, 17 Jun 2026 11:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vf3eVGtVUBbf; Wed, 17 Jun 2026 11:54:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAEA1847DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781697266;
	bh=tDJNpU6+aduR28RkyUc9q4lF5XSKTbVbP+wOjWUVOII=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=iLFmhF0+oRYvR0vqGEswMj92c5UVIN2xX+ZaSqe0/uuVyMD6KtR5/bphz1i6usYYy
	 SbxJ3L3CUi+3QwshstQ+XFpuZJWpiKKTCjJumVupf4l4k8F5AsmwaZF61ZIX5U3gj0
	 dsMFVX3boZiurph+qodCSrPzNhrVGcwakmURLO0LaxW7REz28cwOYZ8Ke2yWCX1laO
	 vFKs3B6vpRK4/TXGvQUoIGEEozl5AAPA7N8evGwQvwWK3ZyNknMekMngh9fJxZv7Mq
	 63bT7nxpagYDodYiPvszVJSk/U4Aaw8oPBmxObgXmIer+NS+M3KdSUlFnNyVKhfRiC
	 D1TBCn7czj1jQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAEA1847DB;
	Wed, 17 Jun 2026 11:54:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 51FA2D8
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 11:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FFA3847DB
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 11:54:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JdQWYPHV9KJN for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 11:54:24 +0000 (UTC)
X-Greylist: delayed 474 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 17 Jun 2026 11:54:23 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB365847CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB365847CA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB365847CA
 for <buildroot@uclibc.org>; Wed, 17 Jun 2026 11:54:23 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 44F532C847C0;
 Wed, 17 Jun 2026 13:46:26 +0200 (CEST)
Message-ID: <e11abd2b-af99-4c06-9f62-7bc1b68dd303@bubu1.eu>
Date: Wed, 17 Jun 2026 13:46:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@uclibc.org
References: <20260615211608.372629-1-bernd@kuhls.net>
 <20260615211608.372629-2-bernd@kuhls.net>
 <36dd2cd2-ef7f-4878-9dfc-d303fd6bd279__46984.2816515424$1781559163$gmane$org@bubu1.eu>
 <pan$192b$b482f28$6a2ab23c$e5df11fa@ID-313208.user.individual.net>
Content-Language: en-US
In-Reply-To: <pan$192b$b482f28$6a2ab23c$e5df11fa@ID-313208.user.individual.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1781696786; bh=gO72BCAb2gDDjThPTli2mv4hkMPgN3gRUchegd6dvfg=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=RF/frtWTd17+DJ0MXYppkLwb2mXHbB1xQWPqe7d2Axx1wRVCt/kFU2NlmXUzjZcG2
 igYDnLfJD9vBZov+DgNWlrPIUdGjYKvRTum7BEOMY0v4KD33hOjqJyTJJCGDdKHYSq
 9JLVkEkk3OLmb3aiQ5f9llKI0eoSJ7ZCYoFge17T3zDOoZtznrCOnb8c71VO1+ICmG
 zdz+kqr8aMhbV97HhL7V4/dLEJPaWTCKAhMjdrO/qNBT46xxNchyImqh2o0FhP9xg2
 dYgV1mP0v80BgabiF7JeIBJyBzYyvLHzfYikawhkpL++vq3PJWmYXoWG0DQcy7G0JT
 4NWIYwUzfjnHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=RF/frtWT
Subject: Re: [Buildroot] [PATCH 2/2] package/usbutils: only needs libudev,
 not udev daemon
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

thanks for the explanation. Series applied to master with one change, 
see below.

On 6/16/26 07:14, Bernd Kuhls wrote:
> Am Mon, 15 Jun 2026 23:32:23 +0200 schrieb Marcus Hoffmann via buildroot:
> 
>>> --- a/package/libudev-zero/Config.in
>>> +++ b/package/libudev-zero/Config.in
>>> @@ -2,6 +2,8 @@ config BR2_PACKAGE_LIBUDEV_ZERO
>>>    	bool "libudev-zero"
>>>    	depends on !BR2_STATIC_LIBS
>>>    	select BR2_PACKAGE_HAS_LIBUDEV
>>> +	select BR2_PACKAGE_HWDATA if BR2_PACKAGE_USBUTILS # runtime
>>> +	select BR2_PACKAGE_HWDATA_USB_IDS if BR2_PACKAGE_USBUTILS
>>
>> Is there a reason for putting these selects here into the libudev-zero
>> config file instead of adding them into usb-utils?
> 
> Hi Marcus,
> 
> both ways are possible but I opted for selecting the minimum set of
> packages because usbutils makes use of the hwdata package only when used
> with libudev-zero.

I moved these to usbutils when applying. It should have the same effect 
but I find it slightly less confusing to have the dependencies stated in 
the tool the user is actually selecting.>
> usbutils does not directly use usb.ids provided by hwdata, it calls
> udev_hwdb_*() functions which were only stubs in libudev-zero <= 1.0.3.
> 
> The other libudev providers, eudev and systemd, provide bundled versions
> of hwdata so they do not need to select our hwdata package.
> 
> libudev-zero 1.0.4 otoh does not bundle usb.ids, so in order to display
> meaningful infos we need the hwdata package.
> Although it is true that reading usb.ids is an optional feature in
> libudev-zero[1] I opted to select hwdata to improve lsusb output but
> technically it is not mandatory so you can commit my patches without this
> part.

It would indeed be nice to have "recommends" level dependencies in 
buildroot.
After a bit of back and forth I decided to keep these dependencies. The 
hwdata usb ids aren't exactly tiny, but my main argument in favour of 
having this dependency is that if you want a tiny lsusb and aren't 
interested in having the hw database available you can still use the 
busybox version and just not install usbutils.
> 
> Regards, Bernd

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

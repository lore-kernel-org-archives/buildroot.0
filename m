Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD1CC5479D
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 11:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2564E60BC1;
	Wed, 11 Jan 2023 11:59:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2564E60BC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9oXU8j38bIsF; Wed, 11 Jan 2023 11:59:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7275A60B99;
	Wed, 11 Jan 2023 11:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7275A60B99
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2280E1BF215
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 11:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B2F6404B5
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 11:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B2F6404B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gtk6vHCCFCrz for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 11:59:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 780B94049C
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp2.osuosl.org (Postfix) with ESMTP id 780B94049C
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 11:59:33 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FZlSpbF612HZAFZlTpdC25; Wed, 11 Jan 2023 12:59:31 +0100
Message-ID: <9a0f31e3-ea56-7907-7c07-eb1d3f5d1d47@benettiengineering.com>
Date: Wed, 11 Jan 2023 12:59:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <CB65BA13-5218-4C00-86E0-CB128E71F322@benettiengineering.com>
 <BCF6BFBB-EE5A-43FA-B64A-E2513A4A3BCF@benettiengineering.com>
 <20221231142342.1189ede4@windsurf>
 <40df416d-7db3-4053-28ea-a98316551069@benettiengineering.com>
 <20230103092133.3d88a870@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230103092133.3d88a870@windsurf>
X-CMAE-Envelope: MS4xfAQMP3xcKXJIq0ez7o9SHHZywZ8Ty85nuWkcUBu/iXJtExM3b7IbbTVzTEmQRS2j7nyHyv8KL/dkhs6uabIomB5NW4o7yUZd7yU4fg4v1Ob+CWco/XlC
 SraeVRZMkaBvKza1Xukvbfe5PRcko6MR45KZdtkzvXoVuOF+fNmUEgjMdX9BbKOmi4/B/QPs7AVidbKaezrnGnTKNKAnxiAdrXGoMvODZ8Xr12DY361hzS/q
 FfrLVBsGTbHo7Pvewy5IkGQSSAmjvjHEuW4kQ80ZLoLy+1lGdynZcAokLM8X69CR
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1673438371; bh=QkHr8UvTq+KcsVe2vXgsiAARznnoBS5YD7UDrkj/FaE=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=KC3c4z0W9BzvwPef0hBH+v/MIEuYJZ94sRQ6a9EG92LZ7rHy4+Drl1ITGYNXv7FMj
 qsDp6UPra27HSBDMFp3Akx/qVMxl6rb7dcyGgqO/TWkd6QVLMOmLeNht8Wg8XUzKZB
 95cD+7h8hYKwxSheGWoiTg3mfPCh8w5xJc/s+InRluY4rcrNhNgpMOYPorUfubRotQ
 52eOrNH+/y/wOqDyG7GbilwFPo3V5eUo5JmT+3aWLFDkVamYzAP/DZiATrN8rf+/b3
 MyazpAnXdyYxz3i8JnxZV4rB5RV6d5WfeGpMrN/5fmqn/DsVERCFipmCRrPZVe7ZhA
 09du9y8b7GoXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=KC3c4z0W
Subject: Re: [Buildroot] [PATCH] package/wilc-driver: fix build failure up
 to Linux 6.1
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
Cc: Kris Bahnsen <kris@embeddedts.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Kris, All,

On 03/01/23 09:21, Thomas Petazzoni via buildroot wrote:
> On Sat, 31 Dec 2022 18:51:34 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>>> Open a pull request.
>>
>> Do you mean once they create a branch for 6.1?
>> Or even against 5.15, 5.10 etc. if there are changes that regard those
>> versions?
>>
>> Sorry but it's not clear to me what you mean.
> 
> You have a point. Indeed, until they start moving to 6.1, there's not
> much you can do :-/

linux-6.1-mchp branch is out:
https://github.com/linux4sam/linux-at91/tree/linux-6.1-mchp

I've already built with WILC1000 support and it built successfully, so
no need for other patches on my side.

Kris, if you're interested you can merge their changes into your
repository for WILC1000 if there is some enhancement.

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

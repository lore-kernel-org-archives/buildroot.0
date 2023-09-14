Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13401EEAA74
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 20:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F1C7612BA;
	Thu, 14 Sep 2023 20:11:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F1C7612BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8eoUmkOY5piT; Thu, 14 Sep 2023 20:11:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E612F612B6;
	Thu, 14 Sep 2023 20:11:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E612F612B6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 231101BF3E3
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 20:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F06BA83ABB
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 20:11:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F06BA83ABB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I4fPB5JxAQDO for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 20:11:12 +0000 (UTC)
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43EED83ABA
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 20:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43EED83ABA
Received: from [192.168.50.162] ([146.241.100.148])
 by Aruba Outgoing Smtp  with ESMTPSA
 id gsg9qOeSkvJ43gsg9qHzpu; Thu, 14 Sep 2023 22:11:09 +0200
Message-ID: <8b5fbe25-dc3d-5117-d955-b2f63ed2bf85@benettiengineering.com>
Date: Thu, 14 Sep 2023 22:11:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230914191726.28670-1-giulio.benetti@benettiengineering.com>
 <20230914214942.41dd792a@windsurf>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230914214942.41dd792a@windsurf>
X-CMAE-Envelope: MS4xfEXtFAwLJt38JyuA6sOwNIRrf/i/CetwudJFXw4xOLJTqLOoZzn7AU5sSm6SHAvtVUtL5ScZWoSXbnU9pVErbb9NPmzPhQVgDw5iYLsHMbiM8Ksn/asT
 VjCsVINDp2I/B1F+Jm7dZxkM1H6rleRrDf5QQW4vifVFbcmh6rNrUrZkERtv+BlJOXD0DMHm8pKAGy6yx7hMIGiFrX36nBgb/Y0qXpNml54vy+Hll838H/O9
 sMyCCavFZah+0mcfJCvaZztAUHid7ByXAa7Vb628CUJIYEsJa5pXNDw65N6Itc9mTLab9IoUa8fa2bmTigV04g/AW8pdklRfANGAm5KBEDk3FDUt8B9jFDpb
 sehrt5ATeDpOX0U4XeokDolcgjFJ25H5ZschKTrZAJvSdsRLUK5EPgjiWD0MYSxvV8/MBxii
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1694722269; bh=Ax1KTO3qOY05wUKnjYKCQg5yqNEYVASuv+x4Bzumvlc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=bt+ZRueOJpKSe/mmGNti7BvjE6T/7Adw5xTiZ9yPkQdn0se1eRP12WfIc+UAzkCFG
 6yjMrFj1MfHTYeAoDFwtHaM0YwGYHSZxGSeOVoz9f3bQJoRQyYThtMTKG35m/DGCRC
 TO0IM5Fo+6NyxX8lKiMUFftgToiyt0EIvGPugpirAlY6gWQoLx37+wWWUwJQJrxFgo
 mQjIxsKgtQ93k1Tyx4kxqTix1Bll88RNzoiJWnVSDZSdIBUj97xvUAOWXomd8Q91zH
 a5dPgVaFF+D/htp5/bZJsyOyWL/VjH4Q0/8Yj2a2z5TSr6RvNX3/EFZMihePbfkMFZ
 gwe8uLZ3LNC3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=bt+ZRueO
Subject: Re: [Buildroot] [PATCH] package/apache-utils: new package
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
Cc: Jim Reinhart <jimr@tekvox.com>, James Autry <jautry@tekvox.com>,
 Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 Matthew Maron <matthewm@tekvox.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 14/09/23 21:49, Thomas Petazzoni wrote:
> Hello Giulio,
> 
> On Thu, 14 Sep 2023 21:17:26 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
>>
>> Build htdigest and htpasswd utilities only without building entire Apache
>> package.
>>
>> Cc: Jim Reinhart <jimr@tekvox.com>
>> Cc: James Autry <jautry@tekvox.com>
>> Cc: Matthew Maron <matthewm@tekvox.com>
>> Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
> 
> Thanks for the proposal. I'm always a bit "meh" when it comes to adding
> a new package that uses the same source code as another package. It
> causes extra maintenance work (you need to update both packages, apply
> patches to both, keep tracking of CVEs for both, etc.).

I was unsure if deal with it this way and after searching I've found 
packages uboot and uboot-tools.

> What is the use case for needing this without the Apache server?

I need htdigest to manipulate .htdigest file on target used by SWUpdate
to deal with credentials.

> Can we
> change the Apache package to instead allow installing only those tools?

Yes, I can modify by adding an option to package apache like 
BR2_PACKAGE_APACHE_BUILD_TOOLS_ONLY and then in apache.mk I do like:
ifeq ($(BR2_PACKAGE_APACHE_BUILD_UTILS_ONLY),y)
	what I do in apache-utils package
else
	what it's actually done in apache package
endif

This is because I can't build only htdigest and htpasswd by using
standard autotools-package infrastructure and I need to make specific
targets under $(@D)/support. Otherwise it will try to build(and fail)
to build a part of httpd.

This is what I've found so far, but maybe I can dig deeper and maybe
find a long sequence of:
--disable-a
--disable-b
etc.
to use autotools infrastructure.

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

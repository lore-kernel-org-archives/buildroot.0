Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63703C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 12:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5B69401CC;
	Sat,  6 Jan 2024 12:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5B69401CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QWwqzxVX14qu; Sat,  6 Jan 2024 12:59:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAD3F405E0;
	Sat,  6 Jan 2024 12:59:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAD3F405E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CF2511BF290
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 12:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7540405E0
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 12:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7540405E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zs1PxUVRI_H5 for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 12:59:28 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEE5C401CC
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 12:59:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEE5C401CC
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 2B22413F861;
 Sat,  6 Jan 2024 13:59:23 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35326])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 06 Jan 2024 13:59:23 +0100
MIME-Version: 1.0
Date: Sat, 06 Jan 2024 13:59:23 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20231224191802.5aea90d4@windsurf>
References: <20231212214610.374636-1-ju.o@free.fr>
 <20231224191802.5aea90d4@windsurf>
User-Agent: Webmail Free/1.6.5
Message-ID: <d466c77317eb5974cbe98a0b17f99d06@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704545964;
 bh=I3bIJCALuZOQCzdbMuVj1iVnn3roqaH/ScuBZnSEbDw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V83A9v0glxdar7ZYdqciLrEUFs9xskNT5wN7uAC9EDFKd8nVRoQbiKEaFpd8RTHUW
 WOovGBm3mdyqBr4+LbIodEGUFIYa9C/jez38Q+8+aIzX06yEdFx41zr/e6sSMzTZUM
 eOocO6eOW1Fyk2o1cXr17qTUTLhEHBKbMKemyVBdVGJGxsD4Bb8mO4r7DjQviliE+s
 QBH2TQAZRlhBngKCwLzVxmatIISE2RxQU3KPWvryWVsM8B99j5ZtZeQXHxNhr4LpfQ
 1YQqOXeKnULC1hPzRb4OTE0vWW1r/3MeC++RX5Huax/yfa0bwcgn+C/L7cznE9Trqm
 AFT1hlpRAf2hA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=V83A9v0g
Subject: Re: [Buildroot] [PATCH 1/1] package/octave: add libreadline search
 prefix
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

On 24/12/2023 19:18, Thomas Petazzoni wrote:
> Hello Julien,
> 
> On Tue, 12 Dec 2023 22:46:10 +0100
> Julien Olivain <ju.o@free.fr> wrote:
> 
>> Since commit b36e4b10f3 "package/octave: bump to version 8.1.0",
>> Octave fails to find readline automatically if octave and readline
>> packages are both enabled in Buildroot the configuration.
>> 
>> The readline search prefix need to be explicitly passed during octave
>> configuration. This commit adds this search prefix to fix this build
>> issue.
>> 
>> Fixes:
>> 
>>     checking for readline... (cached) no
>>     checking for readline/readline.h... (cached) yes
>>     checking for readline/history.h... (cached) yes
>>     configure: WARNING: I need GNU Readline 4.2 or later
>>     configure: error: this is fatal unless you specify 
>> --disable-readline
>> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
> 
> This looked good and relevant, but I'm unable to reproduce the issue,
> which probably means there is something more to this.
> 
> Build:
> 
> BR2_arm=y
> BR2_cortex_a9=y
> BR2_ARM_ENABLE_VFP=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_OCTAVE=y
> BR2_PACKAGE_READLINE=y
> # BR2_TARGET_ROOTFS_TAR is not set
> 
> with:
> 
> ./utils/docker-run make octave
> 
> and it builds just fine, readline is properly detected as it should be.
> 
> For the sake of completeness, I also re-did this build on commit
> b36e4b10f3, which is when Octave was bumped to 8.1.0, which you said
> was the commit that introduced the issue. But it also builds fine.
> 
> Could you double check what was your failing configuration, maybe
> investigate what is different to understand the root cause?

You are right: I confirm I cannot reproduce the issue on the
Buildroot docker image.

The conditions in which the issue is triggering are more specific
than I initially thought.

I believe this patch is still needed. I'll send a v2 with a more
detailed analysis and explanation.

> 
> Thanks a lot!
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

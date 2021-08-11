Return-Path: <SRS0=trv6=NC=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADABAC4338F
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 07:43:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3882560EB5
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 07:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3882560EB5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D913B605D8;
	Wed, 11 Aug 2021 07:43:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jmmtM6v90H7x; Wed, 11 Aug 2021 07:43:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 194126086C;
	Wed, 11 Aug 2021 07:43:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D9D6B1BF577
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 07:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9397831E7
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 07:43:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ideasonboard.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WGAeokLpg6FZ for <buildroot@lists.busybox.net>;
 Wed, 11 Aug 2021 07:42:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6BA88318C
 for <buildroot@buildroot.org>; Wed, 11 Aug 2021 07:42:58 +0000 (UTC)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi
 [91.158.153.130])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 157E1EE;
 Wed, 11 Aug 2021 09:42:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628667775;
 bh=GsNWYfuNhYiXhheeuc9slYnJqnBDoiXg0g5BuU9Zvb0=;
 h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
 b=g/UiGUcXEtsRHMATKpLJ2KKnV1exMj82ldXFFAtMHG1j6XOCHQQR4doNPcLbkxSIe
 LGRro2v7vZRUUJcGy7TCcAg95jC4/fK/2N+rUDlwGX47Hm4Tiv6fWoJ+cCAkZ2u7bV
 Pwja85PnE51ZnwgadrRzKMDzMLdwT99mShC1Px1U=
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210806125047.1832422-1-tomi.valkeinen@ideasonboard.com>
 <20210806125047.1832422-2-tomi.valkeinen@ideasonboard.com>
 <20210808092935.GK27036@scaer>
 <ee9c4a7c-82c2-3b5e-7e41-0bad306e80fe@ideasonboard.com>
 <20210808203351.GN27036@scaer>
 <b94a85b6-1483-2f18-9cf2-55e97764dd40@ideasonboard.com>
 <20210810193930.GT27036@scaer>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <e96e4967-da6d-143b-f0fc-9a6ea997018a@ideasonboard.com>
Date: Wed, 11 Aug 2021 10:42:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810193930.GT27036@scaer>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 2/2] package/kmsxx: update to latest
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi,

On 10/08/2021 22:39, Yann E. MORIN wrote:
> Tomi, All,
> 
> On 2021-08-09 09:23 +0300, Tomi Valkeinen spake thusly:
>> And I'd love to enable the python bindings for kms++ in buildroot, but I
>> didn't manage to get meson find buildroot's pybind11. I'll look at that more
>> at some point. I think the problem is that meson should find pybind11 using
>> cmake (apparently that can be used to find dependencies...), but when
>> building kms++, meson just says:
>>
>> CMake binary for MachineChoice.HOST is not cached
>> CMake binary missing from cross or native file, or env var undefined.
>> Default target is not allowed for cross use
>> Found CMake: NO
> 
> Could you try to add:
> 
>      KMSXX_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)
> 
> To see if that would solve the issue?

I did get a bit forward, but not much. I think this also needs to be 
added, to package/meson/cross-compilation.conf.in:

cmake = '@HOST_DIR@/bin/cmake'

This helps meson to find cmake, but then the problems wrt. pybind11 and 
python started. I don't think cmake managed to find the .cmake files 
installed by buildroot's pybind11 package, so I just hacked and copied

<output>/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/python3.9/site-packages/pybind11/share/cmake/pybind11

to

<output>/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/cmake/

so that they are in similar place as from Ubuntu's pybind11 package.

I think that helped cmake find them, but then I'm seeing "Python config 
failure: Python is 64-bit, chosen compiler is 32-bit" error from 
pybind11's cmake files.

I also tried to change buildroot's python-pybind package to be a 
cmake-package, instead of python-package (thinking that perhaps it'll 
install the files to correct place), but again go the 64/32-bit error.

At this point I gave up, as I don't have much experience with cmake (and 
it's horrible =).

>> On 08/08/2021 23:33, Yann E. MORIN wrote:
>>> I am by far not a meson expert, so when you say "the fallback-to-subproject
>>> can be managed with meson commandline options", I'd be much interested
>>> in hos to do that, so that in Buildrot we know how to forcibly forbid
>>> bundled sub-projects (or wraps?) to be used...
>> https://mesonbuild.com/Subprojects.html#commandline-options
>> So, buildroot could globally define "--wrap-mode=nodownload" for meson to
>> prevent download of the subprojects.
> 
> Shouldn't we instead use:   --wrap-mode=nofallback
> 
> This entirely prevent use of wraps, even those that are already present
> (e.g. because an upstream packager would have added them when generating
> the release tarball for example).

Yes, I that makes sense too. I was thinking that the reason to avoid 
fallback is to avoid downloading unverified source code. nodownload does 
that, as if the subproject is packaged in the release tarball, it's 
"verified" in the same way the source of the package itself is, i.e. the 
exact code is known at the time the buildroot package is made, and the 
hash file checks the subproject too.

But if the intention is to make sure all packages use the same version 
of a library, then nofallback is better.

>> Developers who need the functionality
>> of 'use-system-pybind11' option can use
>> "--force-fallback-for=list,of,dependencies".
> 
> This should only be done in conjunction with --wrap-mode=nodownload
> 
>> And at least for me, the download doesn't even work inside buildroot:
>>
>> Downloading pybind11 source from
>> https://github.com/pybind/pybind11/archive/v2.6.0.zip
>> <urlopen error unknown url type: https>
>                              ,------^^^^^
> I think the error lies there: meson is written in python3, and is
> executed with our host-python3, which we only conditionally build it
> with support for TLS:
> 
>     package/python3/python3.mk:
>     46 ifeq ($(BR2_PACKAGE_HOST_PYTHON3_SSL),y)
>     47 HOST_PYTHON3_DEPENDENCIES += host-openssl
>     48 else
>     49 HOST_PYTHON3_CONF_OPTS += --disable-openssl
>     50 endif
> 
> So, this is a good thing that this is not available by default: wraps
> can only be downloaded from insecure sites, which if the meson wrapDB is
> properly curated, should not happen. And thus, it should not be possible
> to ever download any wrap at all! Aha. Aha! AHA! MUAHAHA! ;-]
> 
> But jokes aside, try setting BR2_PACKAGE_HOST_PYTHON3_SSL=y, and I would
> guess downloading wraps would be come possible (although this would be a
> very bad idea).

Then I get:

<urlopen error [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify 
failed: unable to get local issuer certificate (_ssl.c:1129)>

I guess root certs are missing?

This would be nice to have working for the cases where buildroot doesn't 
have the subproject package available (or working, as is the case here 
with pybind11). Even if mainline buildroot doesn't allow subproject 
downloads, it's nice to have it locally.

In my case, I had to remove the subproject stuff from kms++, add 
pybind11 back as a git submodule (which does work in buildroot), and 
then use that kms++ version with buildroot to get a rootfs with kms++ 
with py-bindings.

But I also understand that this is probably a bit of a corner case, and 
no one else is interested =).

  Tomi
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

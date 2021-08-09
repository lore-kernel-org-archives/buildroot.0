Return-Path: <SRS0=uMfR=NA=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB5FEC4338F
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 06:24:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFC0361052
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 06:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFC0361052
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88DA94011F;
	Mon,  9 Aug 2021 06:24:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uXU5Hzq4H35b; Mon,  9 Aug 2021 06:24:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55CD4400C8;
	Mon,  9 Aug 2021 06:24:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A24F81BF3B5
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 06:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 897E66059B
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 06:23:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ideasonboard.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lBvA_6JE7LkR for <buildroot@lists.busybox.net>;
 Mon,  9 Aug 2021 06:23:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20713600D4
 for <buildroot@buildroot.org>; Mon,  9 Aug 2021 06:23:57 +0000 (UTC)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi
 [91.158.153.130])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DBD28466;
 Mon,  9 Aug 2021 08:23:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628490234;
 bh=tB9nFvVjkWSgRqEe/DsM2g97Kkfu0Pd3PlNQk3KzVg0=;
 h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
 b=jHxA0ExqzbsHUoI8ZBXExJOVYmjAqyHxKZ9nQy8DdgaNO2GYDax1jnslVibo+O96A
 PPPpAFpdj/07NRH0tMH+p6nWXV/QBL83cXObEHB3nzjjuNnwtyuLqZ9/OE9VFcCreE
 uoY5pUCNOko2f7zXYfm4UXMv+M245e2WmLBfeXIo=
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210806125047.1832422-1-tomi.valkeinen@ideasonboard.com>
 <20210806125047.1832422-2-tomi.valkeinen@ideasonboard.com>
 <20210808092935.GK27036@scaer>
 <ee9c4a7c-82c2-3b5e-7e41-0bad306e80fe@ideasonboard.com>
 <20210808203351.GN27036@scaer>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <b94a85b6-1483-2f18-9cf2-55e97764dd40@ideasonboard.com>
Date: Mon, 9 Aug 2021 09:23:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210808203351.GN27036@scaer>
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

On 08/08/2021 23:33, Yann E. MORIN wrote:

>> [*] For fmt, I didn't see a need for using meson subproject at all, as fmt
>> seems to be available "everywhere", and afaics it's been quite stable. For
>> pybind11, I still like to keep the option for meson subproject to easily
>> test/use specific versions. However, this doesn't need an option in
>> meson-option.txt, as the behavior of the fallback-to-subproject can be
>> managed with meson commandline options. Also, if 'pykms' option is set to
>> disabled, pybind11 is skipped also.
> 
> The thing is, if pybind11 is not available in the system, then kmsxx
> will build its bundled version when pykms is enabled.
> 
> So, by forcibly disabling pykms in Buildroot, this means that pybind11
> is not needed and thus the bundled version is not built.

Right.

And I'd love to enable the python bindings for kms++ in buildroot, but I 
didn't manage to get meson find buildroot's pybind11. I'll look at that 
more at some point. I think the problem is that meson should find 
pybind11 using cmake (apparently that can be used to find 
dependencies...), but when building kms++, meson just says:

CMake binary for MachineChoice.HOST is not cached
CMake binary missing from cross or native file, or env var undefined.
Default target is not allowed for cross use
Found CMake: NO

> I am by far not a meson expert, so when you say "the fallback-to-subproject
> can be managed with meson commandline options", I'd be much interested
> in hos to do that, so that in Buildrot we know how to forcibly forbid
> bundled sub-projects (or wraps?) to be used...

Yes, "wrap" is a better word here, as that handles the download of the 
subproject.

https://mesonbuild.com/Subprojects.html#commandline-options

So, buildroot could globally define "--wrap-mode=nodownload" for meson 
to prevent download of the subprojects. Developers who need the 
functionality of 'use-system-pybind11' option can use 
"--force-fallback-for=list,of,dependencies".

And at least for me, the download doesn't even work inside buildroot:

Downloading pybind11 source from 
https://github.com/pybind/pybind11/archive/v2.6.0.zip
<urlopen error unknown url type: https>
A fallback URL could be specified using source_fallback_url key in the 
wrap file

../output32/build/kmsxx-824bbb1f4cd062d66b457faca50f904b34dfd96c/py/pykms/meson.build:7:0: 
ERROR: could not get 
https://github.com/pybind/pybind11/archive/v2.6.0.zip is the internet 
available?

  Tomi
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

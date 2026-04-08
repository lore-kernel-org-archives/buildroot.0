Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C50B10F995A
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 16:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEE0C40657;
	Wed,  8 Apr 2026 16:00:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6qaJKWWPZGba; Wed,  8 Apr 2026 16:00:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7906A40658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775664032;
	bh=36xlXTmlSq5/TzoEvZ0G7Lm7YPFqyej5qGqykjZTkvM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Vsco9Rn2AOYz/uC71WPNxspN2B5pEpTZzzcgbqYlJbI6qnLEDNHmZMOnEI9xyVv34
	 kaaQDD2SVC2W2TfECWRDeqkaJrUKUrBKku94PuqUuY1hJMaSsj2o7T1JccS1qpZRr3
	 UN8j+e5Iu7+0AEC0p/SDBMK50BfwJKvyGYHIk/gGjANDINrdHv3wiArAo7gSfmrFiy
	 UdUTEZgozjO5fYWICNS/3rM4SckTACFdWibU/ejYriUJDPqYcmbcxL6uJr3AyLcjS2
	 QKqFwJbrn0e0g891SohApsg05Akaonl0Yy35DhIxsgk3YiDup5bdtVVeE1fKS8hNja
	 Lr+QHgyPhpydQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7906A40658;
	Wed,  8 Apr 2026 16:00:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CADDA237
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 16:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBE8460808
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 16:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lvvNr33Aa70n for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 16:00:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2319560805
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2319560805
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2319560805
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 16:00:28 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MK3Vu-1vtNeK431a-00Mu06; Wed, 08
 Apr 2026 18:00:23 +0200
Message-ID: <2837d90a-c323-41d0-970a-a7f971d23512@gmx.de>
Date: Wed, 8 Apr 2026 18:00:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>, Martin Bark <martin@barkynet.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260407-generate-cyclonedx-br-v1-0-03c45ccba2ed@cherry.de>
 <b49e9bd7-762b-4206-baee-25e92b1d48d9@gmx.de>
 <a4f8b160-2e79-474a-a400-53755144d826@cherry.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <a4f8b160-2e79-474a-a400-53755144d826@cherry.de>
X-Provags-ID: V03:K1:CuZa+2hZt0qRC+hSUJvKLF96AoijZPXHfij+IwACC4MXFIarzuv
 9UXxXaVtjSjC5BzqELpnIjMIFs3BcwpbZDfH6qJLme2Vptw1ORPA0HTCCG4WMcGyTYDb6pU
 YeRevNo0c7ddLHF69AKsD6erzXPmf77VMbylZ3losY7WsJfDlJJVALYGQedoHA9bPy/X11/
 SCn/CLZRuac5ZRvKrdiWQ==
UI-OutboundReport: notjunk:1;M01:P0:uQmNtvylqxw=;NTAPm0DNXg+i4joXNgPP+4z7OO/
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1775664023; x=1776268823; i=fiona.klute@gmx.de;
 bh=xwWS+/vkaVOXPR50UYCt8sHBLba2VncnCvZb6UsDMMQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=NkUjrptkLEEhHdfa4VcVwUAi9PUHrOCLyOkCvSSLp9peKRo227Cnvw8rnO7tsR+G
 x6d+HCEmCJsDNADCWRyCeo0NWOaNeiV1gv7sHydt/lv07MlUUmWvuy9viuMZBGd9w
 7kbhkxh1a0fIpYrbdgCR07VNpELVlwuRk25LMwnQBVW+Z8YBRukc6NOSAYl6z+2Ct
 eD1bgNfMy01kZBhQmIJINakyg2XdmVPj4irtcefsf4v502Ag6V9CFh7mXgpmQkUvb
 vj5pkOd32UVxB14t2xysQIXVLd8nluS5p5RUW2XvNMWweyKzMlOhpUaLqIC7zk4r+
 keDjeCuT6MWiAuFQ8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=NkUjrptk
Subject: Re: [Buildroot] [PATCH 0/4] make utils/generate-cyclonedx runnable
 with Buildroot host packages
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 08.04.26 um 13:01 schrieb Quentin Schulz:
> Hi Fiona,
> 
> On 4/8/26 12:28 PM, Fiona Klute wrote:
>> Hi Quentin!
>>
>> Am 07.04.26 um 19:37 schrieb Quentin Schulz via buildroot:
>>> It may be beneficial to be able to run the script from Buildroot host
>>> packages to avoid external dependencies. I for example build Buildroot
>>> within some ancient container where I don't have a recent-enough Python
>>> to run generate-cyclonedx with. I already build host Python as part of
>>> my build, so it seems like a good opportunity to reuse it for running
>>> generate-cyclonedx with it instead of going for a separate container
>>> just for running that script.
>>>
>>> This however required a few changes. First, I needed to enable
>>> BR2_PACKAGE_HOST_PYTHON3_BZIP2 otherwise importing the bz2 module would
>>> fail.
>>> However after looking at the code deeper, there isn't a way right now
>>> for this script to actually receive a compressed patch to parse,
>>> therefore instead of requiring that option to be selected, the
>>> compression "support" is removed from the script entirely.
>>>
>>> Then, I got hit by Python telling me it does not know what HTTPS is. The
>>> issue was that the ssl (well, technically _ssl) module wasn't built
>>> unless BR2_PACKAGE_HOST_PYTHON3_SSL is enabled and without that, no
>>> HTTPS support.
>>
>> How about creating host packages for generate-cyclonedx and the 
>> CycloneDX schema (in a way that the script still works standalone, if 
>> all dependencies are available)? That'd completely sidestep the HTTPS 
>> issue and work offline after "make source".
>>
> 
> I like that idea. This would also take care of generate-cyclonedx being 
> run in parallel and installing the file to a shared DL_DIR without an 
> flock. The issue I'm seeing however is how to handle different versions 
> of the CycloneDX schema?
> There are patches available (https://patchwork.ozlabs.org/project/ 
> buildroot/patch/20260311140457.140041-6-thomas.perale@mind.be/) for 
> using 1.7 instead of 1.6 for example. We won't know which CycloneDX 
> version the user wants to use with generate-cyclonedx since we cannot 
> run generate-cyclonedx as part of the image (since it depends on the 
> output of make show-info?).
> 
> Do we go for multiple packages, each for a specific CycloneDX version, 
> and they can all be selected independently if desired?

Good point. Maybe one package with version selection from a limited 
range, like for binutils? After all there's no point in installing a 
schema version generate-cyclonedx does not support. I'd expect that 
version selection is mostly a matter of matching what other tools 
support, not going back and forth all the time.

> The other issue I'm seeing is mostly design or politics, how to have a 
> package using a file from utils/. Is this possible, allowed, wanted? I'm 
> busy with https://lore.kernel.org/buildroot/ 
> dff355c7-7539-4eb5-99d9-446e01cfeafd@cherry.de/T/ 
> #m2e71c34c76f5b2fbab145466a4307d6275217b4e at the moment but I'll check 
> later if we already have such packages in-tree.
Possible? Definitely, there's no fundamental difference to how packages 
install init scripts and similar from the Buildroot repo. Admittedly 
installing from outside package/<pkg> feels a bit awkward, but there's 
no technical obstacle (and if that's the main issue, maybe move the 
script and add a symlink in utils/). I'd use <PKG>_SITE_METHOD = local 
so there's no need to define any other source. Probably some sed 
invocation to set shebang and default schema location/version to fit the 
host dir install (or minimal pyproject.toml and optional config that's 
used if installed).

Wanted? I have to defer to the maintainers there. ;-)

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

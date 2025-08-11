Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4DFC87FDB
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 10:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAA2983DD6;
	Mon, 11 Aug 2025 10:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sy0RuAXyhx1M; Mon, 11 Aug 2025 10:53:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03ECB83E1E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03ECB83E1E;
	Mon, 11 Aug 2025 10:53:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C8161C5
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 10:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E402612CE
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 10:53:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 895raL-rfivJ for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 10:53:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 62C476112B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62C476112B
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62C476112B
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 10:53:55 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.127.180]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWAOW-1v5k303kFu-00W1r9; Mon, 11
 Aug 2025 12:53:52 +0200
Message-ID: <d483d5ac-58f7-4517-b049-3a7688b83d2f@gmx.de>
Date: Mon, 11 Aug 2025 12:53:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250809223229.2307960-1-fiona.klute@gmx.de>
 <20250810124736.00b1cc30@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250810124736.00b1cc30@windsurf>
X-Provags-ID: V03:K1:HygsMQL/v/3KhjiI/ajoO5YCNHCvK6RNWnPySyouLlW1Eaznp7M
 UN6elLeFGdSt2yfsQ2Kr6b4TXKIQ7B3kv3KQ/hgL1Swzzovj6YpAgLSuVJl/ziX2ls1HPzb
 syKuJ5TaNf3KUnAozxtjfPgPk866hdmBCLxv25P7vbqk0j0rBOlrrE4h8brx25QgLIx8GX1
 fzPDHgIzr3Qp3E80p562A==
UI-OutboundReport: notjunk:1;M01:P0:tB6YWcY5sMY=;5jCccGMDxFjnre5evKnkRFwzslE
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1754909633; x=1755514433; i=fiona.klute@gmx.de;
 bh=4J6VF74DNV5UeELe3xvd9D0uEeqXeP3wWmK7wx6BBuM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=rKVBLteNXxLp0AF/Gd0/KmULYEqzxDUhyzk+PlRpsnsM0jMdd1XC2AuWqbQPTXXi
 oCACteulCAvIe/QZiKNjUxIt7xa8pzzwfhHmorMdlh/zbbedQmd/27r/SehBOdQqz
 nhhWQrZknMB9nZK9mW8FqKJ/KBakdxKN288Ji81JL9lv8byphowdQYxI5soqF3rZq
 /VvVtfjo09YQB0WCm8gMF8O+8kBtzUddDak9J6PkMAv4Y4stDyCJi55WGVAqgn/cN
 +U+Q+UyMY4EQIbsKtLgaUkeJ9WGc2qlOpW3o+zWRiVHUfGjD+8ONk4Z7BxzhFJSrI
 iqDvn1tPsiXNbsVHOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=rKVBLteN
Subject: Re: [Buildroot] [PATCH 0/7] Add package/python-memray and
 dependencies
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas!

Am 10.08.25 um 12:47 schrieb Thomas Petazzoni:
> Hello Fiona,
> 
> On Sun, 10 Aug 2025 00:32:22 +0200
> Fiona Klute <fiona.klute@gmx.de> wrote:
> 
>> This series adds the Memray memory profiler for Python [1] and its
>> dependencies. I needed it to help reduce memory usage of some custom
>> tools, and figure it might be useful to others for
>> debugging/optimization, too.
>>
>> The individual patches are fairly simple, just a bunch of new Python
>> packages. Memray itself includes a binary module that needs to be
>> cross-compiled.
> 
> Thanks for the patch series! Since it's mostly made if Python packages,
> it would be nice to have some tests in support/testing/ for those
> packages, or at least for the "top-level" Memray package.

Something like "record a trace and process it into 
statistics/flamegraph" should be simple enough to do, checking if the 
output makes sense would be hard to automate though. Would just "doesn't 
crash in the process" and maybe a grep for expected items be enough?

>> One thing I'm not sure about is whether there should be a separate
>> option to enable building libdebuginfod in package/elfutils, instead
>> of enabling it if the dependencies are met. Having an option would
>> allow people who need package/json-c and package/libcurl, but don't
>> build anything that links against libdebuginfod to save a few kB (in
>> my arm64 build /usr/lib/libdebuginfod-0.192.so is about 38 kB), at the
>> price of slightly more complexity in the config system. I'm happy to
>> add the option if that's preferred.
> 
> In this particular case, I believe I would create an explicit
> sub-option. Not because 38 KiB matters, but because it's rather
> impossible to "guess" that json-c and libcurl are needed to get
> libdebuginfod to be built.
I'll add it then. Would it make sense to use "depends on" the new option 
in package/python-memray then, to simplify the forwarded requirements 
(instead of copying all the "depends on" for elfutils and json-c), even 
if it's a little less convenient to enable?

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

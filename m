Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61542C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 18:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10182801DA;
	Tue,  4 Feb 2025 18:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3NciE7OSSYK; Tue,  4 Feb 2025 18:28:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BAFC80B84
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BAFC80B84;
	Tue,  4 Feb 2025 18:28:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1887B12A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 18:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05DE24017A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 18:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s0rvD-PX8Mp9 for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 18:28:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 47DC640190
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47DC640190
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47DC640190
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 18:28:13 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.121.123]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYvY8-1tsWoV26gy-00NQgh; Tue, 04
 Feb 2025 19:27:55 +0100
Message-ID: <2aa26a7d-04ba-4428-87df-a01397a996be@gmx.de>
Date: Tue, 4 Feb 2025 19:27:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryce Johnson <bryce@redpinelabs.com>
Cc: Romain Naour <romain.naour@smile.fr>, Edgar Bonet
 <bonet@grenoble.cnrs.fr>, Buildroot development <buildroot@buildroot.org>,
 Michael Walle <mwalle@kernel.org>, Chris Packham <judge.packham@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
References: <035d6d78-0a31-4083-8fa1-65f5be5f74b5@grenoble.cnrs.fr>
 <3ea35c40-07d1-41d3-b4f9-08bbb0336d24@smile.fr>
 <4e691513-04a1-4f6f-ad3a-df18f653a6b7@grenoble.cnrs.fr>
 <f6d14b70-cf74-4a03-80fd-5e4fc4325a47@gmx.de>
 <d01683ed-cc7e-4c0d-a807-7a76ce7129ba@smile.fr>
 <1c7e531a-e549-4893-b8fd-d7e9cb01f319@gmx.de>
 <CADXxVSJ-0GtrywPpHwy_naA2Jx=aj31c=qLbNtt+bQ6YVqujnQ@mail.gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <CADXxVSJ-0GtrywPpHwy_naA2Jx=aj31c=qLbNtt+bQ6YVqujnQ@mail.gmail.com>
X-Provags-ID: V03:K1:1qH6j6CczTCOXo6rtHDSNOqabpfZnJwxqO7XugzwgeMNd075UIw
 54J7118cN/5wRXktUTlnUJmzjqsV2NYo4UPeK+1M1kuCGf6VeAJv6iHVUnkc4p9zQsG3snR
 EjlulnBsc5PLgzOACdnn4uXvr6DPMJHFTafFl0a/T53VjhF6A9LO1Dwzuf0kWdKa/5dMm7m
 f2HWrGvzmGCXmE9/HTrdw==
UI-OutboundReport: notjunk:1;M01:P0:fDpQIKg6gTI=;ZFBgSa7Gfo8Zs0CKORZ9X8K729r
 LjATbOz4s7Nw7+XlfpGSJzJq+rmcBYMeIUoK3jzWxsoahfGR4fbyl5/QZ98Yo/IPdsiBmuD3Q
 OZLYqtk8oLz1UOPBCaVtw95MV3KbqJaKNBh1/SIt8Cv0rL2Walgu7bdmyhsn1WXz0bi7WRwZf
 cIqmcbezIg40nj3nVHRJNKjVNPMO9DtXslwkHH/SqlLsR04FdAgZ8MZGFoSHBohAxBWNPjc66
 yuidB36YQGbEFiT66z/GYfZGi6UYF0jRvAsf8QpReZRirhgtVMgAMTXKdapVyOvadB+4d0POz
 yavGspvtwjoRoAbf6E83sAVhjMOgcKPyoGtu+dHAO3kokyXdYcjS6JlO2le+rZ5YoRM1/PYG6
 eOyEpw3xz0+Ok4KVWzlL+9efmCSLY6U/eDSQUQcoOv+7TvqLZbOaBZVzL25Peua1TLBZW2yiq
 dES6RkrARVxx8u5DlYAuoC6CFq5I75f1SaEHrn3pPj4dbLxXx7eBl2Prm+3bm/X3seo+cIW9A
 M7DdKf+3QFx6ENvdE+z9rh+ithz8BB9QtZIc2R/QYaOC3wFaNXTb/2eaDTlfLK7V1/JqhxjnT
 c5/BZjiTzpxynpShXSIsjc65BFxGnz93RQJ7QysCGHF1WGUsrTAWDlKccu6jHhQC8sg7LI86p
 qWVvSgYCsaOsj7D1VpSWpjz2xWtKiKGejmh5YcHVfL4BKBBdJOkzZv2LB7Awb5pPWPoCF3xF9
 CHYsQVu7dapwtCWd2TVOcVKcQcf1ZWSQfmy2pAPhnOuHip509aZWEKIpqMJPnWIaSmxZ8HJkr
 7Miex0xAXmVsmhrmX3KNeONclK4F5Y6qOAu0JIhoATeHAAIGQcGYG2/V2hHgmYK2G9ON99/Rd
 6kFszIsv/tHioaTQbwToTcXuhZ+S9+Dmo6KcqKLB4EYUA61bjjde6gHqM6J/RJGWqehy1mcE7
 NAPrgXm4Rmc90Xy0pulKAvdiwRWyLecq1jeRN9RBQzjfim5NP51BuO8Pebj3xiupBI4v56qcD
 YfR5ZQ2qVR9a3pzBNHcUWKB3zAb1q7TpGNprUK+ZJkXs9DkW0/gUXzTWF7ttjOPW/LQvTiLkR
 cneizekyZaucO/6WsW+/mnTj1g7qOMVaJVz+H2yNBdV27PIspM51FJknUsDaZZyGTynDQXGqN
 FlKe3zYqg7GAiWYFFdelyTUJdyGBiLds1eHsMF4f/UksSh4aiXTCrhCUNVbKigMEgYV9BhW+K
 z0Q8LWAQRv3xQgqptLhMRinLtmDojSAyybldSbQP9eQWsm/xWOlPnjiQjSFLXRUNZj4n9SjHl
 r8zsJrpFuOat/BVKFyjuG1EgMZQ7UVcI7qVnwpJssR5s88WjWLBsrhea6HwKOtha+w7TARI+w
 yK8GLgVfJPpBkNBseldz67YLOScD4Ws+Avxo2DrIa8TI9E/pGBjSJtTpkqEGpXO7dp7IrRqqC
 oq9ZiEw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738693675; x=1739298475; i=fiona.klute@gmx.de;
 bh=edi1SxwmgUeuePkylN0tCHkYIqF8YAghTFLZ/fMiCCQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=lwtpZJ5uqmfMKV+YUzUBztujodM6Fw0WHNXVGJ2neELU6balF6Gdc99c//0PrZx6
 Da0yizABIi+g0PQQOE9Hx0KBDowIuoSQtoBU8crEVJ3PQ73VoO2RHhl7WR62xMfAw
 Ms9zIkG4JEgJLV8uU7Wussn5YO68yuEEEqCtK46JBcgPKuQvexv5A9AVCZIOYshQ1
 j162qdITHo7ty2Em5C6IdzsCe+bXNRkbJUIM9TF3H8cPNO+AYYY1i0heXEeJq+8+6
 8xHzFsOUsx2YgXeT2TWH2gfeRTuhkmTFtyktILgL1SypIgXZt4+9tb7x2jhJYegcr
 Oc97Yi8drEFgF9Ce9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=lwtpZJ5u
Subject: Re: [Buildroot] [PATCH v2 1/1] linux: make out-of-tree DTS work
 with newest kernels
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

Hi Bryce!

Am 04.02.25 um 15:47 schrieb Bryce Johnson:
> Hi Fiona,
> I tried the patch and it looks interesting, was there a way to still
> include some dtsi included in the kernel?  For example, I have a
> custom board with TI AM62X.  I might have a myboard.dts that wants to
> include from the kernel, k3-am625.dtsi which includes k3-am62.dtsi,
> which include k3-am62-main.dtsi,k3-am62-mcu.dtsi, k3-am62-wakeup.dtsi,
> etc.

Yes, I actually do that in my setups. E.g. I have a WIP (not posted
publicly yet, but planned) DTS for a certain RPi CM4 based device [1]. I
just have

#include "arm/broadcom/bcm2711-rpi-cm4-io.dts"

in there to start from the mainline CM4 IO-Board DTS. I should probably
switch to bcm2711-rpi-cm4.dtsi instead before sending a kernel patch,
but it works. :-)

Making that work is why $(LINUX_DIR)/scripts/dtc/include-prefixes/ is
added to the include paths for dtc in custom-dtbs.mk. What doesn't work
yet is using extra .dtsi files (as in ones you provide, not from kernel
source), but that should be easy to add.

Best regards,
Fiona

(Patch link for reference)
>> See:
>> https://patchwork.ozlabs.org/project/buildroot/patch/20250203154651.2790784-1-fiona.klute@gmx.de/
[1] https://revolutionpi.com/documentation/revpi-connect-4/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

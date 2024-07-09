Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CA1C3DA41
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 16:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D769E412E4;
	Tue,  9 Jul 2024 16:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYlo93FipJOa; Tue,  9 Jul 2024 16:25:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF7BC412C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF7BC412C0;
	Tue,  9 Jul 2024 16:25:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A21D71BF5E9
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 16:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BE4040428
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 16:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0kYAJY-GAcpM for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 16:25:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F1D440238
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F1D440238
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F1D440238
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 16:25:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.127.252]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McH5a-1rorch27Ia-00fjCe; Tue, 09
 Jul 2024 18:25:03 +0200
Message-ID: <f1ec17d8-b94a-4759-be4b-9eba46ae1b5a@gmx.de>
Date: Tue, 9 Jul 2024 18:25:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240704121352.1915154-1-fiona.klute@gmx.de>
 <20240704121352.1915154-4-fiona.klute@gmx.de>
 <20240708235639.7a9cc07c@windsurf>
 <1e0c66a5-b6d3-4117-aafb-68b4d00a5565@gmx.de>
 <20240709135538.4594978e@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20240709135538.4594978e@windsurf>
X-Provags-ID: V03:K1:opW40lWIAQiOq6e0RsOUqlZvIs6Imt7PX0ObZdTZ5WxMO8VxSQE
 dTMy5URVMY90ezzlD076gscMwJgdZUjYUXM/Kge/yjv2oGn5aJADXJplQE9BYMzYUTtjgwJ
 4bcXr2SLVeOSfZZ/o58cU9l+eN0xwwrIIVQHJtB/G9JndkVQJ7A8zkB8EjI4gY1rPbG6857
 zi2xkTwnlSoUSwp2cFHHA==
UI-OutboundReport: notjunk:1;M01:P0:powdlyPuoeo=;k5klxL9Iu/fH5/A6VY/1l/0JJvV
 usySvM6jcGmo1s7jld+vSmCku7RrXAojNL2kA4prmaTy7mu8iz5V0HasQmgw2le+VGLee0EMs
 F+O7vZAlnDxHpRWVETKnfqj1N8B04SBSlT1/l9bz8AmX7nKr/mTRflbiCIWQfCvQ5GbqD/ZXG
 f1fEtEx6eEQWrW5NBwVhTG/67Smwfz0RA0gTz/g/+G+AWbNP1zDtmSEfE2J4ncpftnfAJycH8
 l4qCfS91grwsfeSTQFoBAAMs3rTofu8VdwtJlw7CLIHoWNtsYnyLor+QAGgUAQ/YclvENlDfz
 GP8Nz72iWLnQhARvXGjbgiBSlRsxLRPeQdrCVCCe5ZkjGtZoZ1XncvTENJ+PuRx72uUbgC5xC
 cthP6IFeOB2wV6LR+j8VeOyNG10yIJa0HiJ45GqgWUSh6sCAg+Wj7EGLWn/3ssqbWn8Dk4nq6
 zT4KR9XatvpRh53c64J4woly3VyNFo1XqAkDEQaFxRvZM1JlmJax3MtUOBrFeyc6Bb9sW1HLs
 299ZYPCTWEFkB//FHZfUj6b9Myc0w9tqw2qRLV5WTujCvUrz4LxNVsi/mC5IXjqOkjCxGS8Um
 71HEUt9w7dFb+4joNoBK8gE4Wzfml6vB0OyMzcgyb3AiG8NZpfF+q6ZOAjmTknCC99PbPAInT
 tXZrl7zgXZBQRH7g7DeNrwcBi5hLh7dMhkFpD0R4SYssGNdVthIgHpjutqKBXM4N5zXWf6xzO
 MwCPjqaqzb+2VsZV0bSMj3SnyY2KeZoHJTcZyPKRIqgAvQ0z9isFBSvOqST2fjQhb3WWhDGIi
 gFtOnAPyLuqKlc8zaOxnH0Ew==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720542303; x=1721147103; i=fiona.klute@gmx.de;
 bh=hJEMuz68Yc/mkkr3gWRtTT3QpvRYY0F3LLWU9aKFsUs=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=FYUiA/hsFZuX40IxgsyLPN/Jj/4NzxDvxE6+TmkpLMcJFLzIIkaOrlYBjcnAdZuV
 UirEPNl3cCWVrpGDJtIh8/1vtDZ8ciA3Wn3ZmM41gCFJAoHjtgA/MC92a4XAOCXcB
 V3iRoAJBTaZAqItJhZEoU8LLAgV/YQRzekcJLR08p7a3JV2oqaD02IkIWQFJSiZOy
 OUc5ECnhbmYwpvtNpKLnArSHsxeJQVE5r3F9iUtnUYQSEhdmxMzL7n0bDhPuRPGhQ
 HtllNqaK734jqCIbb+Y2GxtOtlFiqS4/aGQepMXcUZ5M3lei5/qVIFhnmpblQ4tpe
 trW3kakAMwemqKFsVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=FYUiA/hs
Subject: Re: [Buildroot] [PATCH v2 3/4] package/fail2ban: bump version to
 1.1.0
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 09.07.24 um 13:55 schrieb Thomas Petazzoni:
> Hello Fiona,
>
> On Tue, 9 Jul 2024 12:19:49 +0200
> Fiona Klute <fiona.klute@gmx.de> wrote:
>
>>>> -FAIL2BAN_VERSION = 1.0.2
>>>> +FAIL2BAN_VERSION = 1.1.0
>>>>    FAIL2BAN_SITE = $(call github,fail2ban,fail2ban,$(FAIL2BAN_VERSION))
>>>>    FAIL2BAN_LICENSE = GPL-2.0+
>>>>    FAIL2BAN_LICENSE_FILES = COPYING
>>>>    FAIL2BAN_CPE_ID_VENDOR = fail2ban
>>>>    FAIL2BAN_SELINUX_MODULES = fail2ban
>>>>    FAIL2BAN_SETUP_TYPE = setuptools
>>>> +FAIL2BAN_DEPENDENCIES = host-python3 python-pyasynchat
>>>
>>> Why are you adding host-python3 in the dependencies here?
>>
>> I saw a build failure because host Python hadn't been built before
>> without it. I now suspect that was the result of adding a runtime-only
>> dependency to build-time dependencies (see below), I guess it broke some
>> implicit dependency handling? After completely removing that line the
>> build passes, too.
>
> Adding a runtime dependency to build-time dependencies cannot break
> dependency handling. It just enforces a "strong" dependency that
> doesn't exist, but it clearly cannot be responsible for a build
> failure. So it looks like we haven't figured out why the build was at
> some point failing for you.
>
> A good practice when testing a package:
>
> $ make clean
> $ ./utils/docker-run make fail2ban
>
> This will only build fail2ban and its build dependencies, and nothing
> else. This will therefore make sure that you properly captured all
> dependencies. And it does so in a minimal docker container, to ensure
> no tools from your host machine are used.

Thanks for the hint! That passes with the v3 of the patch series I sent
earlier.

Is there a recommended way to run that with an out-of-tree build? I'm
not seeing any option for that in utils/docker-run.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

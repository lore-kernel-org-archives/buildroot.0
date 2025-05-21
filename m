Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46931C2D0CD
	for <buildroot@archiver.kernel.org>; Wed, 21 May 2025 08:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC9D480B74;
	Wed, 21 May 2025 08:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r6XIHClxyiDm; Wed, 21 May 2025 08:38:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F52D80B50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F52D80B50;
	Wed, 21 May 2025 08:38:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 418ED11B
 for <buildroot@buildroot.org>; Wed, 21 May 2025 08:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24F0940BB3
 for <buildroot@buildroot.org>; Wed, 21 May 2025 08:38:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bitUKGYuM3oS for <buildroot@buildroot.org>;
 Wed, 21 May 2025 08:38:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9BAF340A3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BAF340A3D
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9BAF340A3D
 for <buildroot@buildroot.org>; Wed, 21 May 2025 08:38:19 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.117.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N17UQ-1uxyyI2nc2-01528X; Wed, 21
 May 2025 10:38:16 +0200
Message-ID: <cdfde78b-a281-4d53-9da4-095a13fae352@gmx.de>
Date: Wed, 21 May 2025 10:38:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
References: <20250118133740.4001841-1-fiona.klute@gmx.de>
 <8eccd976-c4c1-4fdc-a3c5-340b4a7f979b@gmx.de>
 <6521217e-0d5a-42ae-a315-c533f0f66909@bubu1.eu>
 <031308f4-35e5-451f-8a6d-1e826ad69b75@gmx.de>
 <1e718904-658f-4221-bd35-42ab8d263084@bubu1.eu>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <1e718904-658f-4221-bd35-42ab8d263084@bubu1.eu>
X-Provags-ID: V03:K1:pYqaWbaYKRZ3cpigvYWCcKV5iYWYEoLSBUQcyzrs8CeE2WCOwVX
 lgZdw3hQc7V7zMNNetiW89XbfkvAYFtb6JcQz0DVrp9y0voP+aXYgXpZzRLJL/gp2vZSvg4
 RR788yu1FuvzEBmxd5EHcn9EN8WHl8Xp4pB56vT4GpNCgSkqUUWA70usiF4YONDTaUWFYQK
 khsgGVgJ3qKlTCnqHgc2g==
UI-OutboundReport: notjunk:1;M01:P0:r36z7ygeCc4=;KTvsyOMDsAxLZauxUIe3WsmvBh6
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1747816697; x=1748421497; i=fiona.klute@gmx.de;
 bh=2SKKTHxJly9z9bnwr5KwJefSo+VRsNYcnA0dj74+MnY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=A1kcBJm/Rl59WILTAS3C0V8e/OW3GlNuc1efhEw/kACp2Y6oYlTLblypbpKW0WJW
 /OCvjdcyA/Lgj3/mDLqgEYka7oOmuwSBiX0Hm182EWLh868R3+Ro/oiEx9oiRDTta
 XwYFYysaMtALFSkK+mCcV7rECmW7UQn1BZySalmY73x5gnoAHXdol2iIEwJCXBEEh
 Odb5giZHX6IJSxE8Ojhi/iCuo2h3vwaqQlLFsOp2H7R/4pgFZs3Lpn4Z5A7CjZ5ST
 HOrIpWokfypfEhFVC2ji3190M5BovIUuMneHPjobnuRQsVXhQsJkTw/iH1TxNyLei
 EiNvwJzdODI1aTFt2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=A1kcBJm/
Subject: Re: [Buildroot] [PATCH 1/1] package/wireless-regdb: sysv init
 script to set regdomain
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

Am 20.05.25 um 14:27 schrieb Marcus Hoffmann:
> Hi Fiona,
> 
> On 20.05.25 12:34, Fiona Klute wrote:
>> Hi Marcus!
>>
>> Am 19.05.25 um 21:03 schrieb Marcus Hoffmann via buildroot:
>>> Hi Fiona,
>>>
>>> On 19.05.25 17:37, Fiona Klute via buildroot wrote:
>>>> Hi everyone,
>>>>
>>>> just want to check if there's any interest in merging this. It's 
>>>> trivial enough to maintain in an external tree otherwise, I just 
>>>> figured it might be useful for anyone who's also using a wireless 
>>>> setup that doesn't have a built-in way to set the regulatory domain 
>>>> (namely, NetworkManager).
>>>
>>> We also use NetworkManager but systemd as our init system, so I ended 
>>> up writing a udev rule that calls a script, that sets the regulatory 
>>> domain. Would be nice to just universally have a solution for this, 
>>> but I guess having a SysV initscript is better than not having it?
>> NetworkManager requires udev (eudev) even without systemd, so a udev 
>> rule would actually work for me, too, as long as the script is 
>> configurable. I hadn't really thought about that because I'm setting 
>> the global regulatory domain, not a device one, but for most embedded 
>> systems "set during boot" and "set when a wifi device is added" will 
>> be close enough that the difference doesn't matter.
>>
>> Anyone who uses wpa_supplicant, iwd, or hostapd can set the country 
>> code in the config there, so I'm not sure if there's much of a need 
>> for a non-udev solution.
> 
> Doesn't NetworkManager use either wpa_supplicant or iwd for managing 
> wireless device? Or does that not (easily) work, if those are controlled 
> though NetworkManager? (we use wpa_supplicant, but only through NM, I 
> think?)

At least for wpa_supplicant NetworkManager makes sure it is the only 
config source, and doesn't support setting a country code. iwd still 
reads its own config, though I wouldn't be too surprised if NM changes 
that as the backend gets improved (for consistency).

>> Would you be willing to share your udev rule?
> 
> Sure, we currently have these three things:
> 
> $ cat rootfs-overlay/usr/lib/udev/rules.d/85-regulatory.rules
> # Set wireless regulatory domain at device creation
> 
> ACTION=="add", SUBSYSTEM=="module", DEVPATH=="/module/cfg80211", RUN+="/ 
> usr/bin/set-wireless-regdom"
> 
> $ cat rootfs-overlay/usr/bin/set-wireless-regdom
> #!/bin/sh
> 
> unset WIRELESS_REGDOM
> . /etc/default/wireless-regdom
> [ -n "${WIRELESS_REGDOM}" ] && iw reg set "${WIRELESS_REGDOM}"
> 
> $ cat rootfs-overlay/etc/default/wireless-regdom
> #
> # Wireless regulatory domain configuration
> #
> WIRELESS_REGDOM=DE

Thank you!

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

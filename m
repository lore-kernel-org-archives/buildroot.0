Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE61C3ABDD
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 12:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2804C6086C;
	Tue, 20 May 2025 12:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H9g7pqe9s5Ls; Tue, 20 May 2025 12:27:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC3ED6105D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC3ED6105D;
	Tue, 20 May 2025 12:27:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D12ED4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 12:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1312D40375
 for <buildroot@buildroot.org>; Tue, 20 May 2025 12:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yjmjkLUbaRjk for <buildroot@buildroot.org>;
 Tue, 20 May 2025 12:27:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DCAB84035C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCAB84035C
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DCAB84035C
 for <buildroot@buildroot.org>; Tue, 20 May 2025 12:27:07 +0000 (UTC)
Received: from [192.168.178.42] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 5D1F72C800A0;
 Tue, 20 May 2025 14:27:05 +0200 (CEST)
Message-ID: <1e718904-658f-4221-bd35-42ab8d263084@bubu1.eu>
Date: Tue, 20 May 2025 14:27:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20250118133740.4001841-1-fiona.klute@gmx.de>
 <8eccd976-c4c1-4fdc-a3c5-340b4a7f979b@gmx.de>
 <6521217e-0d5a-42ae-a315-c533f0f66909@bubu1.eu>
 <031308f4-35e5-451f-8a6d-1e826ad69b75@gmx.de>
Content-Language: en-US
In-Reply-To: <031308f4-35e5-451f-8a6d-1e826ad69b75@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747744025; bh=uqZ+kevl0CUMR9oNCrKqMQ7NXiuoPvlfD+Rqgz4y3NU=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=bYKOwqnJJ5SgFkxppircY0YLNBgtz33szKOItHxM4HlnrpyusKYYmqrh0uD1O4CBJ
 1jywd5uTxm18YGmC0Q+ZzKxwwHUNUr9nLjN/NA7lwiQkxaMGa85Qe6cJLnM68J0Alk
 oNVaQl0/J5/JU0hUVpcEt9qwXtH0xyDa71Gn38mkjhD+QCYk7XIm7Aj66I1xC19Ou8
 SpAMqihmHZJBv5FntV4G2a4w6AsKF4U0fauDn/8qvDmmeftsgh5dox4hNyFcYjw7BH
 HPuuGt4/nHYnMDqiFjjElLTN2zrkS1p1FNikBDVra9vmdh0YUWLenTgoSWdpN/nJ4G
 /hJHEJLYPqcyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=bYKOwqnJ
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fiona,

On 20.05.25 12:34, Fiona Klute wrote:
> Hi Marcus!
> 
> Am 19.05.25 um 21:03 schrieb Marcus Hoffmann via buildroot:
>> Hi Fiona,
>>
>> On 19.05.25 17:37, Fiona Klute via buildroot wrote:
>>> Hi everyone,
>>>
>>> just want to check if there's any interest in merging this. It's 
>>> trivial enough to maintain in an external tree otherwise, I just 
>>> figured it might be useful for anyone who's also using a wireless 
>>> setup that doesn't have a built-in way to set the regulatory domain 
>>> (namely, NetworkManager).
>>
>> We also use NetworkManager but systemd as our init system, so I ended 
>> up writing a udev rule that calls a script, that sets the regulatory 
>> domain. Would be nice to just universally have a solution for this, 
>> but I guess having a SysV initscript is better than not having it?
> NetworkManager requires udev (eudev) even without systemd, so a udev 
> rule would actually work for me, too, as long as the script is 
> configurable. I hadn't really thought about that because I'm setting the 
> global regulatory domain, not a device one, but for most embedded 
> systems "set during boot" and "set when a wifi device is added" will be 
> close enough that the difference doesn't matter.
> 
> Anyone who uses wpa_supplicant, iwd, or hostapd can set the country code 
> in the config there, so I'm not sure if there's much of a need for a 
> non-udev solution.

Doesn't NetworkManager use either wpa_supplicant or iwd for managing 
wireless device? Or does that not (easily) work, if those are controlled 
though NetworkManager? (we use wpa_supplicant, but only through NM, I 
think?)


> Would you be willing to share your udev rule?

Sure, we currently have these three things:

$ cat rootfs-overlay/usr/lib/udev/rules.d/85-regulatory.rules
# Set wireless regulatory domain at device creation

ACTION=="add", SUBSYSTEM=="module", DEVPATH=="/module/cfg80211", 
RUN+="/usr/bin/set-wireless-regdom"

$ cat rootfs-overlay/usr/bin/set-wireless-regdom
#!/bin/sh

unset WIRELESS_REGDOM
. /etc/default/wireless-regdom
[ -n "${WIRELESS_REGDOM}" ] && iw reg set "${WIRELESS_REGDOM}"

$ cat rootfs-overlay/etc/default/wireless-regdom
#
# Wireless regulatory domain configuration
#
WIRELESS_REGDOM=DE

> 
> Best regards,
> Fiona
> 

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

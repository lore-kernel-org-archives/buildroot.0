Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8A0C3DA6D
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 15:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6D5F40B87;
	Tue, 20 May 2025 15:03:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AxvkDogsqTUX; Tue, 20 May 2025 15:03:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F252040B73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F252040B73;
	Tue, 20 May 2025 15:03:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C215D4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 15:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98F0E606E1
 for <buildroot@buildroot.org>; Tue, 20 May 2025 15:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mKM-DR2p4yJP for <buildroot@buildroot.org>;
 Tue, 20 May 2025 15:03:20 +0000 (UTC)
X-Greylist: delayed 762 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 20 May 2025 15:03:19 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3449A61035
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3449A61035
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.72.192.73;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3449A61035
 for <buildroot@buildroot.org>; Tue, 20 May 2025 15:03:19 +0000 (UTC)
Received: from [192.168.0.181] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M7rxE-1uMJyb2eQs-00FO3q; Tue, 20 May 2025 16:50:35 +0200
Message-ID: <53e16a6f-296f-46f6-a66c-4f8f67e7b6b0@green-communications.fr>
Date: Tue, 20 May 2025 16:50:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, Marcus Hoffmann <buildroot@bubu1.eu>,
 buildroot@buildroot.org
References: <20250118133740.4001841-1-fiona.klute@gmx.de>
 <8eccd976-c4c1-4fdc-a3c5-340b4a7f979b@gmx.de>
 <6521217e-0d5a-42ae-a315-c533f0f66909@bubu1.eu>
 <031308f4-35e5-451f-8a6d-1e826ad69b75@gmx.de>
Content-Language: en-US
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
In-Reply-To: <031308f4-35e5-451f-8a6d-1e826ad69b75@gmx.de>
X-Provags-ID: V03:K1:PURSPNbaNs/71bO1GH5FidUC4qIEO5114WLFswVRvhJEV+Mb2yM
 eHedEcjLx0z2vXKNe22NOHNZwrMbJnRm71QFYPb+aFBrJCabKu7jEuw1F37+GDn+EoWwVCP
 +p+CtzrlMRO99JKxrOJ1xYHvYd/o20ER02jTW0MDVfmSeB1MJctCTiclUHPH38oH5FkzMXS
 PJ0fwJVYf2T5v3VyL0Svw==
UI-OutboundReport: notjunk:1;M01:P0:o2SR8w2fpqA=;QOFotQCZ0PI2gfd+alf+lPHtfZp
 rKM5mz7zruHm1P31nwt0O24WBwFVvS51vyY1zHzZzopiFf2zyAlBc7IvKGzhMfVCj2GN438qB
 Ma1OtG5P4DvnQiMwGDKcuMP/uEcfbA9/M/5eEVeiwEHnbOuyUaksvJnlHG8kIl2YBK2lUoHAK
 RygRXPJ6kNGNfhvtkwnxCQCzrs7yWdrN9a3ZswQAH2Otl1QWviCBfngzseISQ9+ekK1Aw1dR+
 9Vzm7tJ/fEO6HRlIOQXfUDmk7g5F/Z62Seq3+o0Bb5833eavhxBbtk7vySne6mMM+DsqUzJvT
 DDa/BM/3oBwJ9bVcfe9y8B0ge9amzhD4fLQCUrmXip9Z9zpRxaE5I9BKz10mxzDOxn6FuFN8R
 9Mmj2oB3EmTk4Jk2YBbqXbosDysnPzKbeo/EtYEhQv5OHQKtB9dXjD07Quf1Q7UnpQ+cEfT4A
 U5jxqdHHrgftPL2a9SAqwj+Kwlhj8U4Spikul1WxwIJcTQQRinl7Z4BZ60XyZfOpToGVRsS3H
 eueSWYdx1xOp/T/anYETvHmLIrgYmaC5DGinCcS8CQFVeqrhjZDNn25+kAuS+2T15s8tv+w1Q
 frgTUwnlqSLZ00BiuBAKNQ2tpMuYKMW6ZnfHmrgzoAm8gbJB8QxaougvasEEvMUK089cezIu8
 2tPl/cUK/tzB9/+3hsgpg41i8nImnD7pq/ugaR8oegAUHAaFsYFsxthbJxui5BrLduJzL2How
 IQcc7iZLDtWW2isPF2qq05UsqlYSpgK3jlf00DSEllQzq0iDcB427uQoM09cnFTAMUeagFWEX
 zqx1Of6/2d0JKUlfG43z4Wwpkax498urxIcNAQ8Zibw6GvJMVEeeKz9d6puNnBi3TK6SiCggE
 jYwMBqV8xlQ4pKX/OOW0kErdBmiqjc6edfiL3s+mnJfQ+8OezLoX0zozbxKkGYSuT8XAH9/Ke
 m5WgUvFLSoGQsUbDLffW46406ClQNy5lETqJVq8yLVvHMVXA1bcYP+mWYd5kySF13nIvHTRuC
 aVm9CsgFjGfgXbnVKyUjh/eJjUOIaMKtcrmcndlbS8b+8/CcEm1GzTXkgFQ9I4zd6lKRcBAGr
 qd82LTKRCpA6L6RckpdFsoemPa5hHZHGKZ1y5AvBJbopimRBbPBpdHjpGeK7d5Otqb+s2rDB7
 wK5M0ci1Vc6k4E1fDfWRQgq35ELFbbJGX3fsQPqkKLhn/BsTduoMQJCNR5FGkHzYrdI6MxcB6
 et87SzKJSW1mLNBARmLpl9GlKOmiOiRWAmMMeQytH3hVthRWDDHhh26QFbR+59XjXxZK7PbgS
 /eoIG0od4+l9OFSkFKGdRyayavktZsFC2CMnrs3EjvwQviqIenB/JlXPGJizvKRXtW44/oDH9
 9uentjRQIzbanoSUnZxsInyCyuPrhCuh+sEp//NpwR3AltA0yrdtyge1DS
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 20/05/2025 12:34, Fiona Klute via buildroot wrote:
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

Just my two cents:

- iw reg set (aka user regulatory hint) may be ignored or overridden by 
the kernel if a wireless interface is added. Typically, some hardware 
eeprom may indicate the country in which it is certified and the kernel 
will trust the driver hint more than the user hint. Depending on if the 
user hint is sent is sent before or after the device is probed, the 
kernel may either trust only the driver, or set the regulation to the 
intersection of the driver and user hint.

- iw reg set XX is actually asynchronous. It will return before the hint 
has been applied or ignored. The kernel may have to load the regulatory 
database from the rootfs, which goes through udev which might be already 
busy enough, causing further delay.  If someone tries to configure e.g. 
an access point on 5 GHz quickly enough before the regulatory hint that 
allows it is loaded, it will fail. The init script may have to wait that 
the hint has been applied before continuing. With udev, it will be more 
difficult since udev hooks will be killed if they take too much time.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

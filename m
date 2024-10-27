Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA44BD13589
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 22:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48222406B3;
	Sun, 27 Oct 2024 22:04:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-YmRxyew2CF; Sun, 27 Oct 2024 22:04:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E10C1406AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E10C1406AA;
	Sun, 27 Oct 2024 22:04:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42FFC971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 22:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24D8D8176D
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 22:04:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id btWDp_OAW_y4 for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 22:04:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A41A18175A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A41A18175A
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A41A18175A
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 22:04:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.121.105]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MjS54-1tkFcT24JG-00bq63; Sun, 27
 Oct 2024 23:03:51 +0100
Message-ID: <9ec13ac0-b5b6-4251-98b8-0d8f7adac452@gmx.de>
Date: Sun, 27 Oct 2024 23:03:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Marek Belisko <marek.belisko@open-nandra.com>
References: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
 <20240916151206.947484-13-adam.duskett@amarulasolutions.com>
 <20241026180946.551f5760@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20241026180946.551f5760@windsurf>
X-Provags-ID: V03:K1:3pQpgV3oY9uepBE+V62H45QvbWBFJkJbTy7R/SbHHPDMfbO/Z0M
 WSYI9hinoSWY79FcJe3PBNBvtFYYyKOpdde8KqbeYJ5BRaiWpy1HwS8CITO4CY10bfDwBx5
 yqQZd8ptH2/OIGyoA2gRoyCoG2DqBoPAbm2dyKynosQ6b88lNasreCU/MKM4GsyNFiHam/z
 SvKFLK+W2cX1+zUFnCWFg==
UI-OutboundReport: notjunk:1;M01:P0:WT4xPu1Ito0=;y8BXCk+L7mqDBdPcSpzhsTlG+1M
 wy2x2vlx2ePgwOrK6FhC5mlaJVU9Nahj9XqwP8K+VrAcL2qZHIdQk2lybEsqJ/FE5HY0RCggH
 aYiWiQefelOGYjzLbo2Gu9kBz/BN1mhai7SLHpIfY0ajLknQjO4cVUw/HAdV1ZqWDbNFD2cD7
 bcf1ROvrD3KwxGqdyDqZJqPmsm7/7hpgtvm9iQPHnAsX1Dbn4/5yUQp6+EvOSyDVUzxXH5dbB
 Aa4gPq6SDZZXkpQCRohRj6IFnIyW0hi7COaypZ7pFEWBUnD9A+7ZdAGLxKof9SLOQu1w+Xbl+
 GTmctbWMlNrd6+w1H9QkDT8Iu1COjBuZ4vFEsvbQ1KWOiWZ2eR6EmgZKyskJ4zRhbyt5YYtp2
 q1FPbgEHzKRlJsFtKtOnWclsw1mLd4VhVb6n+Yte2oM8J8RHndvVeEiYKLZlCwOEEAeNGHpWe
 C2kkIZCVeZmmVrBMBWdpZdotkIv284GUJJd8TkgyMQjzCad1kL2ml0VCVUbkxjM1wDHkn5kHL
 yzTaNH4dhhdfsoGkIBYNTkuDCNA1l30IAromrlf0aTiyxbKO4Xj6K+9Qojoyi3EJ2tL3GQehD
 2wAs1q8NdnXyEyKiId+mZlyGoG5zclKZTBY4ROnOQRHMuTnM6/hJaHhGOQwjOml5/pptHqZBN
 8p3dqGL3MTb7T/b6tV350LRzeN9DW/qbbxK12soyD5wsBpSIJbTGs3X5p//aq+S4YuZLx3fmg
 EtcRO8NV+Izv24kykWvFliiCe0H7ep2mvG59wlepMP4YKtuDv5rnPFT303+smRJoF43R46i1Y
 CuKnjIVtWm9z+1h45unRGyXg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1730066631; x=1730671431; i=fiona.klute@gmx.de;
 bh=8i2JRlqfySc/yk0XUh6xuvML5jfd1omW94E/5o/z538=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=qEWJrRVoUQlVXHHtlbn9mcEbtOjtLLxzvFnTCFQ9XVZJwsMo6Z56LKG8FdwLfHzX
 RjSmo4BiIuz/PB/vOeFSpSAb0e1OQDpRJZ5jY7/VTIcU+VlIkFTC6bpxXKJTZADj7
 SUDvsXbFw/mO76R5QgjYOPdHyftUy3EG36frfTB6J3nlTgCFIIuTMJgSuWh79fXtN
 oIkQz8yO3VpKTix0lBb4kAP5/F6xIHMPwxarn06G6XSOgS2LAECUxOyOHYu6rSsKB
 gRazj9ucRJZUMTtzZIARWdlNCuy049mddG2MBYP7i0xHORM0M8uiWKM15+N4s9ffE
 5Ywu4352nDiwKi3onw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=qEWJrRVo
Subject: Re: [Buildroot] [PATCH 12/13] package/audit/S02auditd: fix
 shellcheck and check-package warnings
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

Hi Adam, Thomas!

Am 26.10.24 um 18:09 schrieb Thomas Petazzoni:
> Hello Adam,
>
> On Mon, 16 Sep 2024 17:12:05 +0200
> Adam Duskett <adam.duskett@amarulasolutions.com> wrote:
>
>> Tested with qemu_x86_64_defconfig. start, stop, restart, reload, and rotate
>> all work with busybox ash shell.
>>
>> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
>> ---
>>   package/audit/S02auditd | 44 ++++++++++++++++++++++-------------------
>>   1 file changed, 24 insertions(+), 20 deletions(-)
>
> Thanks for this rework. As part of this, could you rework S02auditd to
> follow the canonical example of package/busybox/S01syslogd ? There's
> been an effort from Fiona to start aligning our init scripts, and this
> effort is really good, so I'd rather see rework of other init scripts
> go in the direction that Fiona has initiated.
>
> I've added Fiona in the loop so that hopefully she can help if your
> specific init script raises some specific questions.
I took a look at that patch [1], general issues I see:

* Critical (though pre-existing, just restructured in the patch): reload
and rotate use numeric signals. 1 seems to be pretty consistent (HUP),
but according to signal(7) 10 can actually have different meanings
across different architectures. Use the symbolic names instead, both to
make sure you get the right one and for readability. Or maybe it'd make
sense to use auditctl?

* There's a "/dev/nulll" in the reload function.

For the canonical style, things to consider:

* On stop, check that the daemon process is actually gone before
returning. Otherwise restart might fail because the new instance is
started before the old one has actually stopped (I've seen that with a
lot of services).

* Action functions should return a success (or failure) code, usually
the return code of the relevant start-stop-daemon action, and the last
one should be the return code of the init script. That way it's possible
to check success when calling the init script from automated tools (e.g.
other scripts).

* Use long form options where possible for clarity.

While you're tidying up the script, it might be good to break some of
the very long lines, too.

I guess I should put some of the above into the docs some time. :-)

Best regards,
Fiona

[1]
https://patchwork.ozlabs.org/project/buildroot/patch/20240916151206.947484-13-adam.duskett@amarulasolutions.com/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

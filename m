Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E25C3DA64
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 17:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2E50816F5;
	Wed, 31 Jul 2024 17:51:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zUMUgnCw40Gg; Wed, 31 Jul 2024 17:51:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A18E381749
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A18E381749;
	Wed, 31 Jul 2024 17:51:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8728E1BF3D5
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 17:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74BFB40E23
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 17:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ms3Ny2O1VtOu for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 17:51:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BC9E340188
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC9E340188
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC9E340188
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 17:51:35 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.116.187]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIdeX-1sW8wg3MSj-006Fh0; Wed, 31
 Jul 2024 19:51:31 +0200
Message-ID: <7a1af24d-83dd-4bd0-b8ff-cc28bee3bda9@gmx.de>
Date: Wed, 31 Jul 2024 19:51:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240729122011.1112914-1-fiona.klute@gmx.de>
 <20240729225040.6431a398@windsurf>
 <1f90c2c6-ef59-47d8-b547-527879f9d8fc@gmx.de>
 <20240730175036.2d4bd34f@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20240730175036.2d4bd34f@windsurf>
X-Provags-ID: V03:K1:i3Ce5UaBPv86vQSwdNRi2oxifSqueV0JRbfjJu1pjbZOIbF3oP6
 Et9VeOxsP2sO6SaQjNXFvtZLXrlZR2zGpRoN4MLjlePTXK5QajycKauUdkwhaBBj2nlWL0Y
 1IR6ULTa1mRO02JLKWGV1iGKDymZRaTQDjg9z8LszV4jXD5czUpsn8CX9TYDkahuy9u2LcK
 A9+nXpF758Ee4Kg5wgGOA==
UI-OutboundReport: notjunk:1;M01:P0:fxEQ3Dxm1Qk=;IrNr9g4Y4cSE1LuWR0zn/SzoBER
 JHAcVpZUECXUvzTbNzDcbR0vPYdyPX/aAEwXuh/sPruDAXO6L8fy6cIfThbu6XJS8lDqz7hiM
 BlR7RZOLgcJKG5x+h93LmuFinWM6Q4BpWyUUVxCxr8lOhBZ0xpBdFZg5vtxeM7y3FdFgZGkGn
 tLis/MLA1a0W3i1gPW2UelBFd+pKkcfCmZiZ84bE64ONbyxhisKaRiPYcSxr58rlnVVzBXTu5
 w7MdmGuczFnTLaxa56LyxhR/aOrf+VEsxTxpw4UGDm9J0Me1hgqOeihtn93zcNS8J2ry+aTw4
 IohZoeBcRjFrCjcgbcFKE1oAfoKc4ecDxEXJUD/BSSWhT/smUVgxpwXEQ0T/q2aIKxCRGBpEC
 1G/6Gn5wuj5bkPfGSoK8v7MKrhqHNO6yvpm4VBxEm7H9g19VwmGbHV17nJWqYCktYdPx0ITmY
 dDz0IdePzhek+WqsWUbxQ5IRLrfJHVnEyhdUAsPzr8dGz+mPH7y0Gazd+et9AAZc1VjawVfCt
 p8xMr57yFCiBmImWaKr4LFMg8JbbqhjN1TW+P0Ya9wmGz6nYV1OiJhV9c2MHcELFRl64AHPNG
 bWWcXZ0wuBVKTuFaw6JeZ6XWjLXk+gUFmLBoaT6J7Izl1ITpxtFKqb3ifXh2mgoEPUQCI1loR
 zZUG33ktYVCe2gfBLj8MB4B9FhnqZ9IoVCfxc2WVMnA9KqUNfzJo76ngx+eCoY9+1xRit7XaY
 U9tA06WWB+fHNxG/fbu+SfCbjQq7ELXFEVlGFwBDhQC/R9oLI+Ri8xbjsoHlE9+KTuz2OgOz7
 qNhoaBRRNghAHFj/7hF81Okw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1722448292; x=1723053092; i=fiona.klute@gmx.de;
 bh=QlQwmULKziGFJvHY30T86/vbmd38X7TAxqD5/F6ascM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=W9lEC515Ow404dWVvGQLwayLOMWEv9yy9n1/dzxTyUvy0iTk1NmysOI25QiODWQi
 pt5c6E+RdQsh9+RUPivL2nLOrlNVV7/rjoQFNa/Xi25ADN7d+b53SQb/qGlusTkGU
 LDPBRq8QxehzWQf9a+jJ7IzTvi0afVP1nL07Rkh4RMh9sQzuf5lG9WVQPyHkKRJ4k
 +u1bptCx7VHdV70BptjKJ6IzkKeDEvB5kezZFklIMxtObAYUjDec+juQM2V1UenKR
 vi1E2ZlGMiV7L2jhGlJNmGrjDsTRkoxnqjg/N17JDU84GlgPgGuW2mpWgamghOcH2
 vqH+X7gFhwk1uMty/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=W9lEC515
Subject: Re: [Buildroot] [PATCH 1/2] package/docker-engine: rewrite dockerd
 init script
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
Cc: Christian Stewart <christian@aperture.us>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 30.07.24 um 17:50 schrieb Thomas Petazzoni:
> Hello Fiona,
>
> On Tue, 30 Jul 2024 17:33:07 +0200
> Fiona Klute <fiona.klute@gmx.de> wrote:
>
>>> While would need the while loop waiting for the daemon to actually be
>>> started in the docker-engine init script and not the other services?
>>
>> There isn't a fundamental difference, I might have over-engineered a bit
>> while thinking about experiments with the Docker config and how it'd be
>> annoying if I change the config and restart, see "OK", and then the
>> service isn't running. Effectively the loop only confirms that the
>> service reaches the point where it writes its PID file (that's something
>> those other services don't do, note the absence of --make-pidfile), but
>> it might still crash after.
>>
>> It should be fine to drop the loop and accept the same limitation as in
>> those other scripts (if the binary can be executed and then crashes,
>> output still says "OK").
>
> To me, the whole goal of the effort you have started (and which is
> super nice!) is to have consistency among the init scripts, so I would
> really prefer that a given situation is handled in exactly the same way
> in all init scripts.

Makes sense, I'll respin in that way. :-)

> BTW, in another e-mail, I had suggested to improve a bit our
> documentation to describe the different situations, and how we intend
> to handle each situation in our init script.

I saw that, and agree it makes sense. I'll have to see if/when I can fit
a documentation update in.

>> I can respin, I'm just hoping to get an opinion on the second patch
>> first (the log capture one), so I know whether to modify or drop that in v2.
>
> I don't have a super super strong opinion PATCH 2/2. Wrapper scripts
> always tend to make things a bit more "obscure". My initial thought
> was: but if all what's missing is --no-close support in Busybox, why
> don't we implement it? On the other hand, your wrapper script allows
> the logging to go into syslog (which is configurable), while with
> --no-close, it simply gets redirected to a file, and that's it (which I
> suppose we can say is less configurable than having logs going through
> syslog).

Yes, exactly, and the log_proxy that Alpine uses has some extra handling
to avoid losing some lines during (outside) log rotation. I'd very much
prefer keeping the redirection to syslog. The proper fix in my eyes
would be syslog support in the Docker engine itself (which ironically
already exists for containers).

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7253606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 08:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=br2f2t1c
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5AAC60ACA;
	Fri, 27 Nov 2026 08:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NMa_S4mhehsy; Fri, 27 Nov 2026 08:53:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 43E1A60AAC
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795769591;
	b=K7BLs/9/r5rpjeqVAS9yPHn8gnJb0I1t9n0nTn0ej4r/jUSMh9gE0HPv+C3nJB15HaQV
	 SW0j4e0sdlMg0MIwfG/F/ZuOJWwS1+BsdigStukOBxHlYKbrlq6nBmg+mCZnaioi8MrTa
	 +gSJivRyVc7pWux56/6MmVWB5rJiIlGAq3H0IC+I06Uhu2fCg3Z0xMZqIoOTpeN1zwT3S
	 OMFKL88lMbFiw4e1ONhB2aEaSA/lPcI7d4J5vhM9NFBiXg4eN0h5/Aw4k9k0K/6HODX8M
	 peSX6V5YIfE8CYLwcUjHxWZ4PFW6POdZpqgRXagcVcLkti77mAX9SgAhbE1/xQror2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795769591;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=MOBjI6bAlALSk0AFmxsVlBWzUwsj3Z/LNBXQXw1oDsE=;
	b=Ux4tk+8IqQFSts+RrR/AniGzafFcEBgvLFMol5GVubnktJ/KC+9YafIs88b6Mx9uavrc
	 uxiH4Gi/W/XZCVKKzRWX5UJWyvgJ2jrhUppaYqElXanW799WjSvVrAabyngTHnhnyOo3a
	 aXXYaYG2+i+6demobxIga0IJBtBPhwC3o7e+SrnlGv1iA2LCHy4Xv19bEtk6aV+VomOkO
	 40lo86DVoWIxPioiDskvjsqv5QmJskK+pMq2KLNsfIsgWpmpKRCedU8ql3Pg1mTZNjno3
	 Q9wVGav2ZHq5p31sC7iRG6nj1at2Q795QVw9qJQmWjHjDj0dIH8s202vp2N8uy1h6ag==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795769591;
	bh=MOBjI6bAlALSk0AFmxsVlBWzUwsj3Z/LNBXQXw1oDsE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=br2f2t1ca4Xx5eWiMPimuTv9fjUWPI00omMLXJwuknH8pHPxWvl6AG7is1jVZcI6d
	 sHUb8lPIA0YKcteelt7xIwG4WPEFjCxWVm/LhDVtrf60TUQ2xETgalFtFYAO7ba+cN
	 JIEARPB6RRUJRHy2j0vKeEdd0KrUUzP91N9cFDZxy0ruX0WLTOuc9XFo93vbx/Ic24
	 lfxNvUw2vuYSc8yGqcfu2vod/ClBE99DBNAftDb45Bx4lHzbqqTwQnfEOzYreXbByr
	 ViOTNunH1y8tV5mryACcIUrBtYViK4+7hKVtZFdxQ9Ql/4pNuOUgMPQD13SgmQ7xmn
	 PlqBGYdWgBaNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43E1A60AAC;
	Fri, 27 Nov 2026 08:53:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B55AB3C0
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 08:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6CD240A36
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 08:53:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wt9sjKOjtvg3 for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 08:53:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E985740A16
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E985740A16
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 08:53:07 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795769585; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:adDIVnBrOy5MNIh4UoGYGQqIKpyy
 M6rzB6aNQDQpvCG5/NOcYz7QBi499RXLxNiQoiwZHUINzmPbXsiIVvUaGzI3rTF1qx+hA6wuGQO
 UtczSUM4MHe5SH2zL8jm4wpNOL8Rzt0v1aYQYGKoOunmd2pdZZ8aQiCrF0g7kG29pPI66i7HSFy
 x+1p/uLfLWyZXcp3/L/1RtT7Ij84KZeoOd3aVCqSdkUyLC8fKzd2DNopfPHs9BLtWKMYuseH5da
 eFOBx5e+vv+vk8uycRBcf/iqgMUqz/ETF1hc2nZBMT3YLVKvRwVyhb2sSzPKH+JROvt5GZGtyT2
 tOK+MgaYQacNew==;
Message-Instance: m=1; h=sha256: k72+ptmaNANnBm/Ovg0qAylT9y4uLi9W053K0WSoL9s=:
 FdJWxF4qer5xjJ22tzceW7pXg66apv2m4DnMM7BHbAQ=, sha512:
 kZAYgnjOcTRWbTG+56jofwKO8Ebv8V3BTJSlbh+M/Ih4B+Hkdc7k5UguZjsi6K+PpXBkzn4RgG3LgtazUc08kA==:
 xcY7f6sNOVmDrRf4ctGVy0yiVjEg1KQPV2tG9c8oXsvrFNHSPEAlm+2jp/iUyGuXx+SVAm4GClRFWU2P9ALSiw==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mj8mV-1yBRFY3KDt-00lgoK; Fri, 27
 Nov 2026 09:53:01 +0100
Message-ID: <72837f10-3399-4e96-9ac9-f428b4b7cf0d@gmx.de>
Date: Fri, 27 Nov 2026 09:53:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, linux-amarula@amarulasolutions.com
References: <20261126192612.1598984-1-dario.binacchi@amarulasolutions.com>
 <8733smirz0.fsf@dell.be.48ers.dk>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <8733smirz0.fsf@dell.be.48ers.dk>
X-Provags-ID: V03:K1:jOyo2csiSsVwyXHW+z3mgSsBwK7zuVNL3gmDQ3YHphIZbb9C63J
 ZocfjatH+HiUmsfzVC19vitYdy7FEh+Uyz73Hl73iivXp1Ty/jCfFLatCRVYyz/PlEwxmoj
 3N0RQZwieAQJ3qIkmw8+T90Rn2y2Gk/3J2kJgEUGGtvFuLOgEW5rEx683g/X4sqjvKaT74H
 hNC5AMsO/6aZf3JJh4rQA==
UI-OutboundReport: notjunk:1;M01:P0:TFwm2kTARgQ=;MQMFUkqetUiqaKf0W7mlyAA//8U
 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
Subject: Re: [Buildroot] [PATCH v2] package/eudev: S10udevd: wait for udevd
 before triggering events
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 27.11.26 um 09:44 schrieb Peter Korsgaard:
>>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:
> 
>   > start-stop-daemon starts udevd in the background and returns before
>   > udevd listens to kernel events. The coldplug events generated right
>   > after by "udevadm trigger" may then get lost, so that no module is
>   > loaded at boot.
> 
>   >   Starting network: Waiting for interface eth0 to appear............... timeout!
> 
>   > Wait until udevd answers on its control socket before triggering the
>   > events. The udevadm control command of eudev has no --ping option, so
>   > use --start-exec-queue, which has no effect on a daemon whose queue is
>   > already running.
> 
>   > While at it, return right away when udevd fails to start, as there is
>   > no point in triggering events then.
> 
>   > Fixes: 41258a81948fddfa7fc8ac06b69d77fa051b744d ("package/eudev: refactor init script and rename it to S10udevd")
> 
> Sorry, I know this is already committed - But if the bug was introduced
> by the move to backgrounding with start-stop-daemon, wouldn't it be
> simpler to just drop the --background argument to start-stop-daemon and
> instead ask udevd to background itself with -d like we did before?
The problem is that eudev doesn't write a PID file, and if we don't let 
start-stop-daemon handle backgrounding the one it writes will be wrong 
(before commit 41258a81948fddfa7fc8ac06b69d77fa051b744d, the init script 
didn't create one at all). :-(

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

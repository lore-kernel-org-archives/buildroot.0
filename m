Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E54CC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 11:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB2C940506;
	Fri, 12 Jul 2024 11:34:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OzWSX6HHG-vk; Fri, 12 Jul 2024 11:34:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AC3E405E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AC3E405E6;
	Fri, 12 Jul 2024 11:34:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 75BE01BF3F4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 11:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DE2D405E6
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 11:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AWFuuCE-fHRG for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 11:34:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EFF0D40506
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFF0D40506
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFF0D40506
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 11:34:19 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.120.126]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTRQq-1sw2UO34xg-00LyJ5; Fri, 12
 Jul 2024 13:34:16 +0200
Message-ID: <1a8fe41c-8031-4aba-ae63-1909c8098297@gmx.de>
Date: Fri, 12 Jul 2024 13:34:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
References: <20240712094717.2539892-1-fiona.klute@gmx.de>
 <20240712094717.2539892-3-fiona.klute@gmx.de>
 <20240712130716.600a075e@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20240712130716.600a075e@windsurf>
X-Provags-ID: V03:K1:d9jCJBJEg+rxX65KJ1vdD5FBImv5n4NRivqf8N95EFabat0vuXG
 C1L2kh0o29EyfsPQKTUMC6gcCQk2h722Nrg9qlaexZA0Ydz23WRGt/PgJ5mzWAJqdLtcqcl
 vl7bH8f+nQc8gn1DHFF3o98nJJX+kfdRucJ19GfGrrtjfKtB7R9/AU23XeHRnIwqtZ3jWlg
 6zPA5psBtakYSUdNb1b4w==
UI-OutboundReport: notjunk:1;M01:P0:Ln3RW4t9WG0=;wmfzkfXw/rLE+huxjyavzYKoFTG
 11IcifElaBMbdYVQuaXDm4butca5VIRqwYx1iYqga+PoHuVMg4KVVWfQ77Ly0BRF50AN1yzPF
 Ylt4g9onT1o5aTvPnOt4pWECDOWzoeuXSAIXijKjawHcZwWKkw3LH45LGyWnMb1DNdONbGSTH
 YLV3ikHMQVqSV73hQyyWJbCgbqGYM63BUSgR/N+ZUY2PP1BNIdEaQyPmI+r6dxRoxf5piWUaU
 O8SoyFtd5oyKyZKqAPT7kzy9+ycxSMW1Oyoa2napli3LPAK2e1cKio5nUa3shmtoPafMpEEai
 VG0vrRVF1/JFwtXKDUiU1NyXf/twqObWVEyB9rLRzdC81rp1qHHO1cCs0iHHvlwphZOKH5Lzs
 gsiZb2CBTR1FX8tY2iIbO/M2ywtwAAddU986QRZK6Zm80GpdeSyS54S9h3C9ARAGjSQxc5+WO
 LSXF0mZTaxILS6mxPSr4kUS56QDfH4JiNf8Ao/jTifkgtw4mG6v7tT8eZQZsN2+mAUkLfWFg+
 St7MRiKQvzUpixUG8N5q4VVTRdBQ07N3e5D9PWU9rXgUZEEqqLl63vDzgkKuT0m6LnEigxCas
 Ao9P/Vv5mRaphiQjcxKjpNr/d8LJqWJBOr2/yOpxY7+NhwhhsLR4qO4Hj4EpgsFurig3z59tr
 MzLAmKMNdGeEHVMcH7Sp8yLdSz126JKXVJ971zGUf9AsY90aDnGYncvlz5amN1/qa0/pcbTEa
 RqO1BZmnbNs2bZuo914ZTLJgS5/pilOCPuh2UbGD9ZaH422vhbldIqm3sNqWeimzCAftAhgxa
 brmT2uVgDPBSpV9CxTAUGKpQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720784057; x=1721388857; i=fiona.klute@gmx.de;
 bh=XsLZzfdrOtIE7RSD1iX5SFjfR/argum/qRE8Z+bxl+A=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=owxcH8N+hYjbgY8HoG4aMjA5JTvIqjpnMC/+OuLsecW2X1k37RG/VyOKP7OU9pP+
 2a2UxqrHpn9gjFJA3L9pLuaR5YjrTGWNUNeSjKlMRFjqJWt2jk8Gt5VijXD6ejClp
 Z/EY/J7WUSVFPkUpEU6JdXHgXgRFeukWXgG5PgKa1ft5oAL13ckYXg3t5uWuPFbpJ
 3d4ZofJw0XiScIrpxc1OAgDuiEwucQYMPqRtWoz8+yovA5eoUZ48w8GVsfynoi9Rg
 /VoBEQ0cJb2oDX8rrTjGfp3Xmga9VGiMhZerQ07V1j+Ml6xPlLQSLEPl9wLyzckOb
 72zlRJW22Yj16+tOgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=owxcH8N+
Subject: Re: [Buildroot] [PATCH 2/6] package/busybox: tidy up S01syslogd
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
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 12.07.24 um 13:07 schrieb Thomas Petazzoni:
> Hello Fiona,
>
> Thanks for your work on this, much appreciated!

Thank you!

> On Fri, 12 Jul 2024 11:47:13 +0200
> Fiona Klute via buildroot <buildroot@buildroot.org> wrote:
>
>> +	# Wait for process to be gone, because Busybox'
>> +	# start-stop-daemon does not support --retry (as of 1.36.1).
>> +	while true; do
>> +		pid="$( cat "${PIDFILE}" 2>/dev/null || true )"
>> +		{ [ -n "${pid}" ] && [ -d "/proc/${pid}" ]; } || break
>> +		sleep 0.1
>
> I am not a big fan of this, and Arnout pointed out that Busybox
> start-stop-daemon has the --status option:
>
>          -T,--status             Check for the existence of a process, return exitcode (since version 1.16.1)
>                                  0 - program is running
>                                  1 - program is not running and the pid file exists
>                                  3 - program is not running
>                                  4 - can't determine program status
>
> Could we use this instead of poking into /proc manually?

Unfortunately not, because the Busybox version of start-stop-daemon
doesn't implement -T/--status. With the Debian version adding "--retry
TIMEOUT" to the stop command would be the elegant solution, but Busybox
silently ignores that one (I bumped into that before with Buildroot init
scripts).

Looking at the options that are supported, we might be able to use
--stop --test, it returns 1 if there is no matching process that could
be stopped.

That would make the loop something like (--quiet to not spam "stopping
..." messages):

while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE"
--exec "/sbin/$DAEMON"; do
	sleep 0.1
done

I'll test that and respin if it works.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4FEC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 15:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C310540340;
	Tue, 30 Jul 2024 15:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S7aaET1_KKPD; Tue, 30 Jul 2024 15:33:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 751414035C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 751414035C;
	Tue, 30 Jul 2024 15:33:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 15E291BF844
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 15:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 106704035C
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 15:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EL4Je-kFXwd8 for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 15:33:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 76AF640340
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76AF640340
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76AF640340
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 15:33:12 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.125.168]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtfNf-1sGbPQ3dYF-0124c4; Tue, 30
 Jul 2024 17:33:07 +0200
Message-ID: <1f90c2c6-ef59-47d8-b547-527879f9d8fc@gmx.de>
Date: Tue, 30 Jul 2024 17:33:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
References: <20240729122011.1112914-1-fiona.klute@gmx.de>
 <20240729225040.6431a398@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20240729225040.6431a398@windsurf>
X-Provags-ID: V03:K1:qoiQhrw/tvBi7e17djTt22hIXdHJJ/YSxxxfp0bcwMSStWNt1HO
 OH9AaXkbsFjcSHWdNldisHOHq1M8Bwthp9F655hDQIAcaRoF9/FNcpF6WqprDebvCE5pzR9
 BSzsSDayBSVsYxB6PDMRTTFZfOWWKzSeLzGjPLacCnXW/5N3C5oNY4J+Tl8GpgGt0n7O73b
 e7uRjEa2wo8YX8BpG8k1g==
UI-OutboundReport: notjunk:1;M01:P0:DEHeg8EDLKE=;Ywimrr8rDojHiSEptwE7MIlEPBz
 Mn4IjI9CJa+0G6DUb6tnF1NitpYjYP0qrWWd+FVsPZdQfhyoTQrkUnM4XvY+X4NVSrcFoHL+x
 ToGqVXDbQ2SPxUJIShzO5ZeSjK8/pavRunUCrBAUcTiWyBRzs71dEfXKbGdII8bUe/3iQFwow
 7qPK4jMPqRB74Hhtgx/8/cr4mTKm6Is32GuiEB6a9/LGgk8JtbdUcUonYigNRx2DeumtSGXuj
 GxxhhLBd+HkWOwxub6q4IesHHEpuZuWiGUYoWFaJPe/2t4ehDJEMlSQ7J3lmyWmPGqh7bRweD
 tFtOURlFRR0usJz5Bh9Pw9uyyx4ElNm0i2OX4ScKiFBe2crHrNO5I/nUKu0EgnqKB6KRbzl38
 fcnMaIeXCDtsqVvQr1SF85x1K49zRyzFdkiJmTULZ6FBlZoZTZZZaul/Py1eo/hYXUXWC6yxK
 Vqltmhk5oiEXdVAVpoe7NijfNC0sEzf/KqYTtSMOv8+ep0AocHJqq2h9TdOV3pTn7Zuqx4m/F
 WYB7GnF70EY2FW1qCLZxg8TDVByKPQ4SuoPn1NKFaQlRdk+7vHYT9CD6ZtMb6GNAbPz3KmsxW
 7hXASEl4BPVNsY5PRUbWcQANPAhlCJuW1fLsedGes8lrrja4TZZnbtGoo2ABly0fR7dhF2wj0
 yjN8+i4f5foz/D+qbLO8UfJ59RxOvHmzi9UmyHGNz1Er/qANp7++ox8mBjwhgIfRzk1YkJJfg
 UbuBYRvlxsBO51+USD4GM0l7I4m8v7SMWbTfVq5j7u5OcDYV6kK199LWyjrBddzDYZ+BcPUcR
 R1W0TQ/18V/p3UUIvsydphdg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1722353588; x=1722958388; i=fiona.klute@gmx.de;
 bh=WPItbraVFSIFtADiZtVcofP43fv/knM7W5WKci3oLm0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=FDuLGrhbsEXbQVGz/K8w1YEGsQ+KCJLcupU7imOC9JdYU2NXAm93we8PtfrdkQdQ
 xLdulv2vlORi4hsH9srvjE/8GL9phT+QsgPdWFOrl1H1ncOf0CoKN/Lr0HY+Q05TW
 jFprHoX8rga5g7pwhyVXJIkLKJYlPcGEAvjVh55rtHLGGuwRXgV1YeuOadaXYoM4x
 L2mablY7ckzlJZ2D2iNftK4QOLRvQYLTcVDq0D6ikalthgI1Dc9o3XceJPlPfIGeg
 yM5yA7MwfYT1a/oj+JTpEIniOdS/W8WH0GiIYt64oqsTlHHjO/QqaN48Zx66FtNvY
 OQKVXhSQ0a3TvmjV6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=FDuLGrhb
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
Cc: Christian Stewart <christian@aperture.us>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas!

Am 29.07.24 um 22:50 schrieb Thomas Petazzoni:
> Hello Fiona,
>
> Thanks for working on this. One question below.
>
> On Mon, 29 Jul 2024 14:20:10 +0200
> Fiona Klute via buildroot <buildroot@buildroot.org> wrote:
>
>> +start() {
>> +	printf 'Starting %s: ' "$DAEMON"
>> +	# shellcheck disable=SC2086 # we need word splitting for DOCKERD_ARGS
>> +	start-stop-daemon --start --background --pidfile "$PIDFILE" \
>> +		--exec "/usr/bin/$DAEMON" \
>> +		-- --pidfile "$PIDFILE" $DOCKERD_ARGS
>> +	# We have to use --background because dockerd doesn't
>> +	# daemonize on its own. Unfortunately that means
>> +	# start-stop-daemon cannot check the return status, so at
>> +	# least check the process is actually running.
>
> How is this different than the other init scripts for which we use
> --background?
>
> package/at/S99at
> package/busybox/S01syslogd (which was recently reworked)
> package/busybox/S41ifplugd (same)
> package/busybox/S50crond (same)
>
> While would need the while loop waiting for the daemon to actually be
> started in the docker-engine init script and not the other services?

There isn't a fundamental difference, I might have over-engineered a bit
while thinking about experiments with the Docker config and how it'd be
annoying if I change the config and restart, see "OK", and then the
service isn't running. Effectively the loop only confirms that the
service reaches the point where it writes its PID file (that's something
those other services don't do, note the absence of --make-pidfile), but
it might still crash after.

It should be fine to drop the loop and accept the same limitation as in
those other scripts (if the binary can be executed and then crashes,
output still says "OK").

I can respin, I'm just hoping to get an opinion on the second patch
first (the log capture one), so I know whether to modify or drop that in v2.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

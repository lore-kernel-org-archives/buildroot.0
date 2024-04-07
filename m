Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D18CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 10:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3B6240770;
	Sun,  7 Apr 2024 10:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tBqBINd8WQgH; Sun,  7 Apr 2024 10:45:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B20CE407B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B20CE407B4;
	Sun,  7 Apr 2024 10:45:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13BF21BF575
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E6F340434
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x9ylQgZsOnP5 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 10:45:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 279F0403E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 279F0403E9
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 279F0403E9
 for <buildroot@uclibc.org>; Sun,  7 Apr 2024 10:45:04 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1rtQ1G-0008iZ-Bg
 for buildroot@uclibc.org; Sun, 07 Apr 2024 12:45:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 07 Apr 2024 12:42:56 +0200
Message-ID: <pan$3e2fd$c5a948fb$259223af$b8ed487e@ID-313208.user.individual.net>
References: <20240406073216.1054073-1-bernd@kuhls.net>
 <20240406073216.1054073-2-bernd@kuhls.net>
 <ZhJmcptsEo41MP6G__17866.991232016$1712481939$gmane$org@landeda>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 02/18] package/ffmpeg: bump version to 6.1.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

Am Sun, 7 Apr 2024 11:25:06 +0200 schrieb Yann E. MORIN:

> For aubio, it was only an optional dependency, so that loses an optional
> feature. While not ideal, this is not breaking the package, but we have
> no way to tell the user when they update that aubio no longer uses
> ffmpeg. Unless there is an aubio version bump that supports newer
> ffmpeg?

v2 of the patch series will include a bump for aubio to support ffmpeg 6.x

> For opencv3 and opencv4, this is also optional, and there are Kconfig
> options we'd move to legacy, that will tell the user opencv3/4 no longer
> uses ffmpeg. And then we can simplify the ffmpeg.mk itself about its own
> dependency on opencv3.

Correct.

> Which leaves us with omxplayer, for which libavresample is a mandatory
> dependency. Is there an upstream changin in omxplayer that makes
> libavresample optional? If not, then we'd have to drop omxplayer before
> we bump ffmpeg...

The package was deprecated in 2020 and will be removed in v2 of the patch 
series.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

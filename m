Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FFECD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 11:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0851381F45;
	Sun,  7 Apr 2024 11:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IB-SIKuulQd4; Sun,  7 Apr 2024 11:24:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04E8781F4B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04E8781F4B;
	Sun,  7 Apr 2024 11:24:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 99E851BF947
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86FA9405BF
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gMizGdzELQ5N for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 11:24:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7C3B440199
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C3B440199
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C3B440199
 for <buildroot@uclibc.org>; Sun,  7 Apr 2024 11:24:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9487B13F89A;
 Sun,  7 Apr 2024 13:24:39 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Apr 2024 13:24:39 +0200
Date: Sun, 7 Apr 2024 13:24:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ZhKCd6i93EvcHlup@landeda>
References: <20240406073216.1054073-1-bernd@kuhls.net>
 <20240406073216.1054073-2-bernd@kuhls.net>
 <ZhJmcptsEo41MP6G__17866.991232016$1712481939$gmane$org@landeda>
 <pan$3e2fd$c5a948fb$259223af$b8ed487e@ID-313208.user.individual.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <pan$3e2fd$c5a948fb$259223af$b8ed487e@ID-313208.user.individual.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712489081;
 bh=24B3MzaWDtgsI7BwkJCxYXb/OypEp1Bi9lx61JSigaI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T1e1TugJ0ZppIIsp7DixLPDuFA8KnEWU5YltsuiV3fDNIMBR30JEZWYc4S+XktA6V
 GaElrcXw5lI/0YxAaaWJNg0z+3VKAPCS7dn36agrUU1SFuVxGVJAgM718LOK22r/d9
 CmwV2qYOZnjJgJaVXkOuzB4sp1eVkCZkM2V+f3KW2/hSEDhZ0c7rg8AMfO1wU+l+Ln
 qbD5G0ENH9KM4HSl/Kdeokk0VixGZpJ3AOSpGIR6pbpec20SY7jyh4NR2COTdy+ipo
 xIl7WlCvJ3RKnkJdGdq7uRxegmGQvwnxButnRAG+L7nNsvq1CTRK4fYttBqzwO30tk
 DIgDQbTxFErJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=T1e1TugJ
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2024-04-07 12:42 +0200, Bernd Kuhls spake thusly:
> Am Sun, 7 Apr 2024 11:25:06 +0200 schrieb Yann E. MORIN:
> > For aubio, it was only an optional dependency, so that loses an optional
> > feature. While not ideal, this is not breaking the package, but we have
> > no way to tell the user when they update that aubio no longer uses
> > ffmpeg. Unless there is an aubio version bump that supports newer
> > ffmpeg?
> v2 of the patch series will include a bump for aubio to support ffmpeg 6.x

ACK, good.

> > For opencv3 and opencv4, this is also optional, and there are Kconfig
> > options we'd move to legacy, that will tell the user opencv3/4 no longer
> > uses ffmpeg. And then we can simplify the ffmpeg.mk itself about its own
> > dependency on opencv3.
> Correct.

Sure, but would it be possible to update openv3 (unlikely) and opencv4
to versions that support newer ffmpeg?

> > Which leaves us with omxplayer, for which libavresample is a mandatory
> > dependency. Is there an upstream changin in omxplayer that makes
> > libavresample optional? If not, then we'd have to drop omxplayer before
> > we bump ffmpeg...
> The package was deprecated in 2020 and will be removed in v2 of the patch 
> series.

Good, let's drop it then.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

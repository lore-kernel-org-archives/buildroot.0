Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A56CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 11:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1E4081FDA;
	Sun,  7 Apr 2024 11:40:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vN66DttaYP8h; Sun,  7 Apr 2024 11:40:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF4CE81FDB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF4CE81FDB;
	Sun,  7 Apr 2024 11:40:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 13D621BF947
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0110A6087D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:40:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TKJAjU8IMPN0 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 11:40:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 35E4860879
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35E4860879
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35E4860879
 for <buildroot@uclibc.org>; Sun,  7 Apr 2024 11:40:05 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1rtQsT-0005gD-V6
 for buildroot@uclibc.org; Sun, 07 Apr 2024 13:40:01 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 07 Apr 2024 13:32:03 +0200
Message-ID: <pan$59179$dfda9430$f07446b8$cfd400fc@ID-313208.user.individual.net>
References: <20240406073216.1054073-1-bernd@kuhls.net>
 <20240406073216.1054073-2-bernd@kuhls.net>
 <ZhJmcptsEo41MP6G__17866.991232016$1712481939$gmane$org@landeda>
 <pan$3e2fd$c5a948fb$259223af$b8ed487e@ID-313208.user.individual.net>
 <ZhKCd6i93EvcHlup@landeda>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>
Message-ID: <20240407113203.0d0CQx2IDk7QHU3OURI5ygvfI-fJV60y2PXLSE3q7hU@z>

Am Sun, 7 Apr 2024 13:24:39 +0200 schrieb Yann E. MORIN:

>> > For opencv3 and opencv4, this is also optional
>> Correct.
> 
> Sure, but would it be possible to update openv3 (unlikely) and opencv4
> to versions that support newer ffmpeg?

Hi Yann,

imho no version bump is needed because both packages build fine with 
ffmpeg 6.x, libavresample is only an optional dependency.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

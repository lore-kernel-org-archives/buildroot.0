Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B0DEE49A8
	for <buildroot@archiver.kernel.org>; Sat, 19 Aug 2023 14:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D4DD82204;
	Sat, 19 Aug 2023 14:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D4DD82204
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 36Lq-KQRh-Yz; Sat, 19 Aug 2023 14:04:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D258821C8;
	Sat, 19 Aug 2023 14:04:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D258821C8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A7BF41BF476
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 14:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FA34821C8
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 14:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FA34821C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ykNEF6ygkogv for <buildroot@lists.busybox.net>;
 Sat, 19 Aug 2023 14:04:15 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C58A821BB
 for <buildroot@uclibc.org>; Sat, 19 Aug 2023 14:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C58A821BB
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qXMYm-000AI2-0Q
 for buildroot@uclibc.org; Sat, 19 Aug 2023 16:04:12 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sat, 19 Aug 2023 16:03:57 +0200
Message-ID: <pan$1d20$6ee79d5d$c31858a7$6979945c@ID-313208.user.individual.net>
References: <20230818144231.976762-1-bernd@kuhls.net>
 <20230819125702.GG1134940__46104.2901662708$1692449855$gmane$org@scaer>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH/next v2 1/1] package/{gettext-gnu,
 libtextstyle}: bump to version 0.22
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

> You're mixing the target _SUBDIR with host build; that's not clean.

after seeing the discussion[1] about the build-time improvements, which 
led to the current situation, I decided not to enter the discussion about 
its rationale ;) This lead to my un-clean code.

> If we can't have proper separation of tiools and runtime for the host
> variant, then let's just stop this dance and build host-gettext at the
> root of the package (e.g. let's just drop HOST_GETTEEXT_GNU_SUBDIR).

+1, and thanks for starting the discussion ;)

> As far as I understand, this installs stuff into $(HOST_DIR) at build
> time. That is definitely not correct.

You are right, it's hackish.

> So, back to my porposal above: if we need the runtime for the tools,
> then let's build the whole package.

+1

Regards, Bernd

[1] https://lists.buildroot.org/pipermail/buildroot/2014-June/401411.html

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

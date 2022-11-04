Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E43C4332F
	for <buildroot@archiver.kernel.org>; Fri,  4 Nov 2022 08:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4B1440BEF;
	Fri,  4 Nov 2022 08:10:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4B1440BEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4KU6BvkksWmP; Fri,  4 Nov 2022 08:10:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 061CC40B54;
	Fri,  4 Nov 2022 08:10:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 061CC40B54
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E6921BF2AB
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 08:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29D9340B54
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 08:10:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29D9340B54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8jEaZqQ7vVVm for <buildroot@lists.busybox.net>;
 Fri,  4 Nov 2022 08:09:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FD0D404F1
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FD0D404F1
 for <buildroot@uclibc.org>; Fri,  4 Nov 2022 08:09:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D43C4C000E;
 Fri,  4 Nov 2022 08:09:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oqrly-00BZNH-QK; Fri, 04 Nov 2022 09:09:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20221023165026.13707-1-fontaine.fabrice__23420.659061388$1666543861$gmane$org@gmail.com>
 <pan$dd0eb$bcfe6a21$17d3908c$470fd6da@ID-313208.user.individual.net>
Date: Fri, 04 Nov 2022 09:09:54 +0100
In-Reply-To: <pan$dd0eb$bcfe6a21$17d3908c$470fd6da@ID-313208.user.individual.net>
 (Bernd Kuhls's message of "Mon, 31 Oct 2022 21:35:01 +0100")
Message-ID: <871qqjnnsd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libzlib: bump to version 1.2.13
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

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Am Sun, 23 Oct 2022 18:50:26 +0200 schrieb Fabrice Fontaine:
 >> - Drop all patches (already in version)
 >> - Replace README by LICENSE file added with
 >> https://github.com/madler/zlib/commit/
 > 352cb28d12baf02863ff5d4d96be0587ced419a1
 >> 
 >> https://github.com/madler/zlib/releases/tag/v1.2.13

 > Hi,

 > ftr: this fixes CVE-2022-37434:
 > https://nvd.nist.gov/vuln/detail/CVE-2022-37434

No, we already had patches for that (which this patch removed).

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

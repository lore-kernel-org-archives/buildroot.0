Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0912C636CD
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 21:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 715E640FF8;
	Mon, 30 Jan 2023 21:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 715E640FF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kOMii-8W60kF; Mon, 30 Jan 2023 21:23:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC25240FCB;
	Mon, 30 Jan 2023 21:23:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC25240FCB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1CC01BF44A
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8908542A47
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8908542A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iadA4sQPxAIA for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 21:23:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61D9A42A4D
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61D9A42A4D
 for <buildroot@uclibc.org>; Mon, 30 Jan 2023 21:23:10 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1pMbcJ-00042X-BB
 for buildroot@uclibc.org; Mon, 30 Jan 2023 22:23:07 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 30 Jan 2023 22:22:39 +0100
Message-ID: <pan$3ecc$a270d623$db098d49$551a10ca@ID-313208.user.individual.net>
References: <20230130174339.36794-1-bernd.kuhls@t-online.de>
 <20230130174339.36794-3-bernd.kuhls@t-online.de>
 <20230130221242.2aa95b6e__49270.7143466518$1675113191$gmane$org@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 3/5] package/libva-utils: bump version to
 2.17.1
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

Am Mon, 30 Jan 2023 22:12:42 +0100 schrieb Thomas Petazzoni via buildroot:

> Are you sure?
> 
> ERROR: libva-utils-2.17.1.tar.gz has wrong sha256 hash:
> ERROR: expected:
> 6ea5993c3eba230a979fa9d35b4cad8df06d4474a773dc0918033bf50353f966 ERROR:
> got     :
> ef681558ce294453945247e5874ceee5a7d3c08ff078ff1cc2a2e357871a81b6 ERROR:
> Incomplete download, or man-in-the-middle (MITM) attack
> 
> Thomas

Hi Thomas,

yes, I tested the hash. The 6ea... hash was also used by Archlinux and 
Freshports:

https://github.com/freebsd/freebsd-ports/commit/
d2575a6e14071688e142525192ce2db19ea71c8b
https://github.com/archlinux/svntogit-community/commit/
c3c11ced639ca2b9ebe4227b4ade30ce6acebbee

But you are right, the hash of a currently downloaded tarball is 
different. Unfortunately I deleted the libva* tarballs but kept the 
mediadriver one and will compare it asap.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

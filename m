Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975ADEB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 05:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14FAD40A38;
	Mon, 26 Jun 2023 05:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14FAD40A38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oe2TQXeUnd39; Mon, 26 Jun 2023 05:50:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 474A640562;
	Mon, 26 Jun 2023 05:50:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 474A640562
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17FC81BF392
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 05:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F187041609
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 05:50:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F187041609
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BljhB0ZMbmUX for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 05:50:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8471A414DE
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8471A414DE
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 05:50:12 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E3D51BF207;
 Mon, 26 Jun 2023 05:50:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qDf72-007U8K-7d; Mon, 26 Jun 2023 07:50:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach <baruch@tkos.co.il>
References: <20230625203736.1722233-1-peter@korsgaard.com>
 <87jzvr3p01.fsf@tarshish>
Date: Mon, 26 Jun 2023 07:50:08 +0200
In-Reply-To: <87jzvr3p01.fsf@tarshish> (Baruch Siach's message of "Mon, 26 Jun
 2023 06:00:04 +0300")
Message-ID: <87ilbaojqn.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/tiff: security bump to version 4.5.1
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Sun, Jun 25 2023, Peter Korsgaard wrote:

 >> Fixes the following security issues:
 >> 
 >> - CVE-2023-1916: A flaw was found in tiffcrop, a program distributed by the
 >> libtiff package.  A specially crafted tiff file can lead to an
 >> out-of-bounds read in the extractImageSection function in
 >> tools/tiffcrop.c, resulting in a denial of service and limited information
 >> disclosure.  This issue affects libtiff versions 4.x.
 >> 
 >> - CVE-2023-25434: libtiff 4.5.0 is vulnerable to Buffer Overflow via
 >> extractContigSamplesBytes() at /libtiff/tools/tiffcrop.c:3215.
 >> 
 >> - CVE-2023-26965: loadImage() in tools/tiffcrop.c in LibTIFF through 4.5.0
 >> has a heap-based use after free via a crafted TIFF image
 >> 
 >> Drop the now upstream
 >> 0001-tiffcrop-Correct-simple-copy-paste-error-Fix-488.patch.

 > Should be removed from .checkpackageignore as well.

Ahh yes, thanks for reminding me.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD24EB64DA
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 07:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58B984116E;
	Mon, 26 Jun 2023 07:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58B984116E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vSr6c7RMRX6t; Mon, 26 Jun 2023 07:04:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CADF41145;
	Mon, 26 Jun 2023 07:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CADF41145
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 115E81BF390
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 07:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9F7F60AAC
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 07:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9F7F60AAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C3ca-Pdpi9DQ for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 07:04:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66AC0607AA
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66AC0607AA
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 07:04:24 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 35152240006;
 Mon, 26 Jun 2023 07:04:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qDgGq-008Gra-00; Mon, 26 Jun 2023 09:04:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach <baruch@tkos.co.il>
References: <20230625203736.1722233-1-peter@korsgaard.com>
 <87jzvr3p01.fsf@tarshish> <87ilbaojqn.fsf@48ers.dk>
Date: Mon, 26 Jun 2023 09:04:19 +0200
In-Reply-To: <87ilbaojqn.fsf@48ers.dk> (Peter Korsgaard's message of "Mon, 26
 Jun 2023 07:50:08 +0200")
Message-ID: <87a5wmogb0.fsf@48ers.dk>
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
 >> Hi Peter,
 >> On Sun, Jun 25 2023, Peter Korsgaard wrote:

 >>> Fixes the following security issues:
 >>> 
 >>> - CVE-2023-1916: A flaw was found in tiffcrop, a program distributed by the
 >>> libtiff package.  A specially crafted tiff file can lead to an
 >>> out-of-bounds read in the extractImageSection function in
 >>> tools/tiffcrop.c, resulting in a denial of service and limited information
 >>> disclosure.  This issue affects libtiff versions 4.x.
 >>> 
 >>> - CVE-2023-25434: libtiff 4.5.0 is vulnerable to Buffer Overflow via
 >>> extractContigSamplesBytes() at /libtiff/tools/tiffcrop.c:3215.
 >>> 
 >>> - CVE-2023-26965: loadImage() in tools/tiffcrop.c in LibTIFF through 4.5.0
 >>> has a heap-based use after free via a crafted TIFF image
 >>> 
 >>> Drop the now upstream
 >>> 0001-tiffcrop-Correct-simple-copy-paste-error-Fix-488.patch.

 >> Should be removed from .checkpackageignore as well.

 > Ahh yes, thanks for reminding me.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CD2EB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 06:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9FC181B53;
	Sun, 16 Jul 2023 06:20:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9FC181B53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7hdEeZtYWjFQ; Sun, 16 Jul 2023 06:20:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E63881A46;
	Sun, 16 Jul 2023 06:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E63881A46
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9684C1BF322
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7023360739
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7023360739
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZRB6WUKfhduU for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 06:20:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC59F60737
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC59F60737
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 06:20:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1BD41BF204
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 06:20:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1qKv7d-008nD5-2U
 for buildroot@buildroot.org; Sun, 16 Jul 2023 08:20:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20230625203736.1722233-1-peter@korsgaard.com>
Date: Sun, 16 Jul 2023 08:20:44 +0200
In-Reply-To: <20230625203736.1722233-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 25 Jun 2023 22:37:35 +0200")
Message-ID: <87v8ekcr7n.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2023-1916: A flaw was found in tiffcrop, a program distributed by the
 >   libtiff package.  A specially crafted tiff file can lead to an
 >   out-of-bounds read in the extractImageSection function in
 >   tools/tiffcrop.c, resulting in a denial of service and limited information
 >   disclosure.  This issue affects libtiff versions 4.x.

 > - CVE-2023-25434: libtiff 4.5.0 is vulnerable to Buffer Overflow via
 >   extractContigSamplesBytes() at /libtiff/tools/tiffcrop.c:3215.

 > - CVE-2023-26965: loadImage() in tools/tiffcrop.c in LibTIFF through 4.5.0
 >   has a heap-based use after free via a crafted TIFF image

 > Drop the now upstream
 > 0001-tiffcrop-Correct-simple-copy-paste-error-Fix-488.patch.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

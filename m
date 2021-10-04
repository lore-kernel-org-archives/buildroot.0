Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735DEC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 15:22:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B731613D5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 15:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B731613D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA9C540893;
	Mon,  4 Oct 2021 15:22:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id knSmx31TKbUA; Mon,  4 Oct 2021 15:22:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0749040704;
	Mon,  4 Oct 2021 15:22:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E118B1BF2FE
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 15:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0B0B84A59
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 15:22:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iSDOxCWbrXMJ for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 15:22:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B87BE84785
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 15:22:30 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id AE738E0013;
 Mon,  4 Oct 2021 15:22:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mXPnO-0003DN-4k; Mon, 04 Oct 2021 17:22:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
References: <20210912092855.2427158-1-aperez@igalia.com>
Date: Mon, 04 Oct 2021 17:22:26 +0200
In-Reply-To: <20210912092855.2427158-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Sun, 12 Sep 2021 12:28:55 +0300")
Message-ID: <875yucizm5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/cog: bump to version 0.10.1
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

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Update to version 0.10.1, which fixes the build when the DRM platform
 > module is enabled, fixes handling of absolute pointer events, and makes
 > the headless platform optional. Note that while optional, Buildroot
 > keeps it enabled (as previously) because the wpebackend-fdo dependency
 > is always needed anyway because Buildroot does not include any other
 > WPE backend.

 > Release notes:

 >   https://wpewebkit.org/release/cog-0.10.1.html

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed to 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

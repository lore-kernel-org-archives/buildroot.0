Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3919C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 14:43:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08A0F61372
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 14:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 08A0F61372
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A49EA40840;
	Tue,  5 Oct 2021 14:43:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oadbd8CSsFAJ; Tue,  5 Oct 2021 14:43:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C16640857;
	Tue,  5 Oct 2021 14:43:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 31B1D1BF34A
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 14:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CB7E60BD2
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 14:43:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pLSp9flJrU26 for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 14:43:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D6A5060BC7
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 14:43:14 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2234420004;
 Tue,  5 Oct 2021 14:43:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mXlev-0002wX-0E; Tue, 05 Oct 2021 16:43:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20210924162349.2802374-1-quentin.schulz@theobroma-systems.com>
Date: Tue, 05 Oct 2021 16:43:08 +0200
In-Reply-To: <20210924162349.2802374-1-quentin.schulz@theobroma-systems.com>
 (Quentin Schulz's message of "Fri, 24 Sep 2021 18:23:49 +0200")
Message-ID: <87ee8zcz2b.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: point
 LICENSE_FILES to correct file
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Quentin" == Quentin Schulz <quentin.schulz@theobroma-systems.com> writes:

 > Since v2.2 release (commits 8cc36aec912 "doc: De-duplicate readme and
 > license files" and 9f1622b018ab "doc: Move content out of readme and
 > create new index page "), the license.rst file at the root of the git
 > repo is only telling to look at docs/license.rst file.

 > Let's point the ARM_TRUSTED_FIRMWARE_LICENSE_FILES to the correct file
 > and modify the .hash file accordingly.

 > Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

For 2021.02.x / 2021.05.x I updated the license hash to match the
version we use there (v2.4).

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

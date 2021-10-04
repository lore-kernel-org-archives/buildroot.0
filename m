Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C54BC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 14:05:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA01161019
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 14:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA01161019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65CB6605FD;
	Mon,  4 Oct 2021 14:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wTfXez6TkIYp; Mon,  4 Oct 2021 14:05:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C659260BBB;
	Mon,  4 Oct 2021 14:05:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A77A1BF2F9
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 14:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEA4E40318
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 14:05:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ljgBUi14a4y7 for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 14:05:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBA75427B2
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 14:05:09 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id CEF39240003;
 Mon,  4 Oct 2021 14:05:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mXOaX-0007gJ-1j; Mon, 04 Oct 2021 16:05:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20210909151740.1097665-1-illia.bitkov@mind.be>
 <20210909151740.1097665-2-illia.bitkov@mind.be>
 <e305bdc0-088b-47c0-687a-4a3632089d2e@mind.be>
Date: Mon, 04 Oct 2021 16:05:04 +0200
In-Reply-To: <e305bdc0-088b-47c0-687a-4a3632089d2e@mind.be> (Arnout
 Vandecappelle's message of "Tue, 21 Sep 2021 21:04:04 +0200")
Message-ID: <87a6joj373.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/2] package/alsa-lib: add smixer-python
 module for alsa-lib python config
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Illia Bitkov <illia.bitkov@mind.be>,
 Adam Dusketta <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 09/09/2021 17:17, Illia Bitkov wrote:
 >> Add simple mixer python bindings to build when "Python support for alsa-lib" is active.
 >> smixer-python is the only one python module which exists in alsa-lib.

 >  Please wrap the commit message at 72 columns.

 >  I've changed the subject line to "package/alsa-lib: smixer-python
 > module supports python3" because IMHO adding python3 is the most
 > important feature of this patch.

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

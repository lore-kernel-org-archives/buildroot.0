Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12231C3DA6F
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 12:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BD7F61450;
	Fri, 25 Aug 2023 12:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BD7F61450
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RO_tl-UZ6OYY; Fri, 25 Aug 2023 12:53:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 110816103B;
	Fri, 25 Aug 2023 12:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 110816103B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 288C61BF309
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 12:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0314140A2F
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 12:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0314140A2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t8LIbGgHf369 for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 12:53:32 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFEE3402E0
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 12:53:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFEE3402E0
Received: by mail.gandi.net (Postfix) with ESMTPSA id C4F5EC0012;
 Fri, 25 Aug 2023 12:53:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qZWJb-002sfO-Tg; Fri, 25 Aug 2023 14:53:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Charles Hardin <ckhardin@gmail.com>
References: <20230620170922.3722-1-ckhardin@gmail.com>
Date: Fri, 25 Aug 2023 14:53:27 +0200
In-Reply-To: <20230620170922.3722-1-ckhardin@gmail.com> (Charles Hardin's
 message of "Tue, 20 Jun 2023 10:09:22 -0700")
Message-ID: <87h6oncmgo.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/firmware-imx: ensure the linux
 firmware is installed first
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Charles" == Charles Hardin <ckhardin@gmail.com> writes:

 > There was imx SDMA firmware in the base linux-firmware package at
 > one time, but the firmware-imx is updated with the latest versions
 > from NXP releases.

 > This just ensures a dependency is set so that the imx package will
 > always come later in case an overlap occurs again.

 > Signed-off-by: Chares Hardin <ckhardin@gmail.com>
 > Signed-off-by: Charles Hardin <ckhardin@gmail.com>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

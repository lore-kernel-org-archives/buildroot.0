Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982D9EB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 06:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 285AA409DF;
	Sun, 16 Jul 2023 06:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 285AA409DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yIwlHPJxBC3n; Sun, 16 Jul 2023 06:15:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EECE409B0;
	Sun, 16 Jul 2023 06:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EECE409B0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9AF091BF322
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81F2181A3B
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:15:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81F2181A3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NfGvUjIXqhPV for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 06:15:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3092D81A39
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3092D81A39
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 06:15:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E921920003;
 Sun, 16 Jul 2023 06:15:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qKv2e-008mhi-Uw; Sun, 16 Jul 2023 08:15:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Charles Hardin <ckhardin@gmail.com>
References: <20230620173813.4590-1-ckhardin@gmail.com>
Date: Sun, 16 Jul 2023 08:15:36 +0200
In-Reply-To: <20230620173813.4590-1-ckhardin@gmail.com> (Charles Hardin's
 message of "Tue, 20 Jun 2023 10:38:12 -0700")
Message-ID: <87zg3wcrg7.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] package/alsa-plugins: fix dependencies
 for the alsa plugin package
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

>>>>> "Charles" == Charles Hardin <ckhardin@gmail.com> writes:

 > The alsa-utils will remove and create the /usr/share/alsa dir
 > as a whole and since the alsa plugins needs to add config into
 > this same directory it should come after those install steps.

 > Also, the bluez alsa needs the plugins installed to find them
 > during the configuration phases - so, interlock the plugins
 > when configured.

 > Signed-off-by: Charles Hardin <ckhardin@gmail.com>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

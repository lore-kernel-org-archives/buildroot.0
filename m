Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEC3C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 08:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED4DB41E33;
	Sun, 18 Sep 2022 08:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED4DB41E33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TVtDbUZDqwpc; Sun, 18 Sep 2022 08:51:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA9634155F;
	Sun, 18 Sep 2022 08:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA9634155F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A26D1BF282
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 08:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9A48404A1
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 08:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9A48404A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GlAv85y8dv6O for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 08:51:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E047B4011C
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E047B4011C
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 08:51:26 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4CF9E200007;
 Sun, 18 Sep 2022 08:51:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZq1K-00BT8X-9i; Sun, 18 Sep 2022 10:51:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Konstantin Menyaev via buildroot <buildroot@buildroot.org>
References: <20220905010913.13640-1-KAMenyaev@sberdevices.ru>
Date: Sun, 18 Sep 2022 10:51:22 +0200
In-Reply-To: <20220905010913.13640-1-KAMenyaev@sberdevices.ru> (Konstantin
 Menyaev via buildroot's message of "Mon, 5 Sep 2022 04:09:13 +0300")
Message-ID: <87pmftjcad.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcpcd: pid path fixed.
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
Cc: John Stile <johns@msli.com>, KAMenyaev@sberdevices.ru,
 sdfw_system_team@sberdevices.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Konstantin" == Konstantin Menyaev via buildroot <buildroot@buildroot.org> writes:

 > From: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
 > dhcpcd-9 defaults the run directory to `/var/run/dhcpcd` instead of
 > `/var/run` and the prefix of dhcpcd has been removed from the files.

 > Signed-off-by: Konstantin Menyaev <KAMenyaev@sberdevices.ru>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

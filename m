Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C639EB64D9
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 09:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2424961219;
	Wed, 14 Jun 2023 09:23:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2424961219
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YSXh6rnHalNc; Wed, 14 Jun 2023 09:23:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F5CA611FC;
	Wed, 14 Jun 2023 09:23:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F5CA611FC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E1881BF860
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 09:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4586D41754
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 09:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4586D41754
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yo9zOihobA81 for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 09:23:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 872BE41744
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 872BE41744
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 09:23:29 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CE15240006;
 Wed, 14 Jun 2023 09:23:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q9Mis-005Gyb-Bs; Wed, 14 Jun 2023 11:23:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Sergey Bobrenok via buildroot <buildroot@buildroot.org>
References: <20230529134320.1961326-1-SIBobrenok@sberdevices.ru>
 <20230529134320.1961326-3-SIBobrenok@sberdevices.ru>
Date: Wed, 14 Jun 2023 11:23:26 +0200
In-Reply-To: <20230529134320.1961326-3-SIBobrenok@sberdevices.ru> (Sergey
 Bobrenok via buildroot's message of "Mon, 29 May 2023 13:44:02 +0000")
Message-ID: <87ttvas8hd.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/earlyoom: unhardcode package
 version in CFLAGS
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Sergey Bobrenok <sibobrenok@sberdevices.ru>,
 sdfw_system_team <sdfw_system_team@sberdevices.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Sergey" == Sergey Bobrenok via buildroot <buildroot@buildroot.org> writes:

 > 'earlyoom --help' still says 'earlyoom 1.6' though it's already
 > version 1.7. '-DVERSION' flag value should be either unhardcoded,
 > either updated with each package version bump.

 > Signed-off-by: Sergey Bobrenok <SIBobrenok@sberdevices.ru>

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

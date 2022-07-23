Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9640C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 14:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C48E423B9;
	Sat, 23 Jul 2022 14:36:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C48E423B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sP0HYp55gfP0; Sat, 23 Jul 2022 14:36:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CEEC42341;
	Sat, 23 Jul 2022 14:36:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CEEC42341
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E3E4A1BF314
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF66540B1A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:36:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF66540B1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7k2dDRU6taIa for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 14:36:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09F444060B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09F444060B
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:36:17 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 92FC31C000A;
 Sat, 23 Jul 2022 14:36:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oFGEm-003OOY-Lq; Sat, 23 Jul 2022 16:36:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dominik Michael Rauh <dmrauh@posteo.de>
References: <20220629182923.26615-1-dmrauh@posteo.de>
Date: Sat, 23 Jul 2022 16:36:12 +0200
In-Reply-To: <20220629182923.26615-1-dmrauh@posteo.de> (Dominik Michael Rauh's
 message of "Wed, 29 Jun 2022 18:29:23 +0000")
Message-ID: <87ilnnuc9v.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/uboot-tools: fix info in
 Config.in.host help section
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Dominik" == Dominik Michael Rauh <dmrauh@posteo.de> writes:

 > The help section of "BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_REDUNDANT"
 > refers to U-Boot configuration option "CONFIG_ENV_SIZE_REDUND" which is
 > removed since U-Boot v2020.01, so remove this reference.

 > We may replace this with a reference to "CONFIG_ENV_OFFSET_REDUND" as
 > another indicator that a redundant environment image should be created.

 > This also fixes a minor typo in the same file.

 > Signed-off-by: Dominik Michael Rauh <dmrauh@posteo.de>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

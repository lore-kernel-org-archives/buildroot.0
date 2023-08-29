Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66B5C71153
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 16:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DE25414BB;
	Tue, 29 Aug 2023 16:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DE25414BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S3wlSi39oKBI; Tue, 29 Aug 2023 16:43:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A5BF41494;
	Tue, 29 Aug 2023 16:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A5BF41494
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D0BD21BF288
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 16:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B80BF41494
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 16:43:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B80BF41494
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sB6OwYEZ5Dp0 for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 16:43:37 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3B3941476
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 16:43:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3B3941476
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7ECE91BF20D;
 Tue, 29 Aug 2023 16:43:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qb1oT-008LEc-Eb; Tue, 29 Aug 2023 18:43:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20230718183238.688311-1-bernd@kuhls.net>
 <20230718183238.688311-4-bernd@kuhls.net>
Date: Tue, 29 Aug 2023 18:43:33 +0200
In-Reply-To: <20230718183238.688311-4-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 18 Jul 2023 20:32:38 +0200")
Message-ID: <87sf814x56.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 4/4] package/wpewebkit: security bump
 version to 2.40.3
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Removed md5 hash.
 > Switch _SITE to https and update URL.

 > Added dependency to host-unifdef, needed since upstream commit
 > https://github.com/WebKit/WebKit/commit/f76a7e30e5749af897b83cc75b2534b1afa32552

 > Release notes:
 > 2.40.3
 > - https://lists.webkit.org/pipermail/webkit-wpe/2023-June/000603.html
 > 2.40.2
 > - https://lists.webkit.org/pipermail/webkit-wpe/2023-May/000598.html
 >   Fixes CVE-2023-28204 & CVE-2023-32373:
 >   https://lists.webkit.org/pipermail/webkit-wpe/2023-May/000599.html
 > 2.40.1
 > - https://lists.webkit.org/pipermail/webkit-wpe/2023-April/000591.html
 > 2.40.0
 > - https://lists.webkit.org/pipermail/webkit-wpe/2023-March/000589.html
 > 2.39.91
 > - https://lists.webkit.org/pipermail/webkit-wpe/2023-March/000581.html
 > 2.39.90
 > - https://lists.webkit.org/pipermail/webkit-wpe/2023-February/000577.html
 > 2.39.5
 > - https://lists.webkit.org/pipermail/webkit-wpe/2023-January/000571.html
 >   USE_AVIF was enabled by default upstream:
 >   https://github.com/WebKit/WebKit/commit/3d60d9f93c64aac55c890160d00d008367e11e91
 >   Add -DUSE_AVIF=OFF to _CONF_OPTS due to missing libavif package

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > v2: added host-unifdef dependency

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

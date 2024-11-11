Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D9BD2E9FF
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 14:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCA5080BE5;
	Mon, 11 Nov 2024 14:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vqb18G9sZp0X; Mon, 11 Nov 2024 14:22:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0224880BF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0224880BF2;
	Mon, 11 Nov 2024 14:22:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 514226C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D39FB401B1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vPettgM1jE_K for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 14:22:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 906AD401C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 906AD401C2
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 906AD401C2
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:22:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A98EE0003;
 Mon, 11 Nov 2024 14:22:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tAVIl-00AUn3-1v;
 Mon, 11 Nov 2024 15:21:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org,  Romain Naour <romain.naour@gmail.com>
References: <20240930193627.50229-1-ju.o@free.fr>
Date: Mon, 11 Nov 2024 15:21:59 +0100
In-Reply-To: <20240930193627.50229-1-ju.o@free.fr> (Julien Olivain's message
 of "Mon, 30 Sep 2024 21:36:27 +0200")
Message-ID: <87o72lc0l4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/liblinear: fix _SITE url
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > The package _SITE url only contains the latest version at a given point
 > in time. When a new version is published, it is replacing the old one.

 > This issue was not detected because the archive was downloaded from the
 > sources.buildroot.org backup mirror, when the primary source became
 > unavailable.

 > Since commit 559bb33ae "support/testing: do not use s.b.o" [1], the
 > runtime test infrastructure is disabling this backup mirror. This
 > makes the nmap runtime test failing [2], which is using liblinear as
 > a dependency.

 > The liblinear package author confirmed in a private email that all the
 > releases, including the latest version, are all kept in the "oldfiles"
 > directory.

 > This commit fixes this download issue by updating the _SITE url to that
 > location. While at it, this commit also change the url to use https
 > (since the http equivalent redirects to https).

 > Fixes:
 > - [2]

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/559bb33ae71dd2358ca2314ccb24b56cc3809fc1
 > [2] https://gitlab.com/buildroot.org/buildroot/-/jobs/7948008007

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B3BC4167D
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 18:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D61F540136;
	Wed,  8 Nov 2023 18:10:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D61F540136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B6oReoZJ7oJ7; Wed,  8 Nov 2023 18:10:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF5454012A;
	Wed,  8 Nov 2023 18:10:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF5454012A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 56BE31BF951
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 18:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DAD660AAA
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 18:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DAD660AAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rjoZf3xhF1wg for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 18:10:25 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD23460A9F
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 18:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD23460A9F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8BDA240002;
 Wed,  8 Nov 2023 18:10:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r0n0O-000yGH-2s;
 Wed, 08 Nov 2023 19:10:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
References: <20231103184428.1029306-1-adam.duskett@amarulasolutions.com>
Date: Wed, 08 Nov 2023 19:10:20 +0100
In-Reply-To: <20231103184428.1029306-1-adam.duskett@amarulasolutions.com>
 (Adam Duskett's message of "Fri, 3 Nov 2023 12:44:28 -0600")
Message-ID: <87pm0kqfoz.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/python-django: security bump to
 4.2.7
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

>>>>> "Adam" == Adam Duskett <adam.duskett@amarulasolutions.com> writes:

 >  - Fixed a regression in Django 4.2 that caused a crash of QuerySet.aggregate()
 >    with aggregates referencing expressions containing subqueries (#34798).

 >  - Restored, following a regression in Django 4.2, creating
 >    varchar/text_pattern_ops indexes on CharField and TextField with
 >    deterministic collations on PostgreSQL (#34932).

 > Tested on Fedora 39 with:
 > ./support/testing/run-tests tests.package.test_python_django

 > Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

While this indeed is a security fix, it seems to be for a Windows-only
issue:

https://www.djangoproject.com/weblog/2023/nov/01/security-releases/

Anyway, for 2023.02.x and 2023.08.x I have instead bumped to 4.1.13,
which contains the same fix.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

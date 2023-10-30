Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772D7C4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 07:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 099F88540F;
	Mon, 30 Oct 2023 07:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 099F88540F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wRLj1Ciw4hu7; Mon, 30 Oct 2023 07:40:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5407385374;
	Mon, 30 Oct 2023 07:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5407385374
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D8B51BF2E3
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 07:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF8DC4361D
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 07:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF8DC4361D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id niCNKcMi6KiO for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 07:40:23 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7F62431F4
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 07:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7F62431F4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 971DE1BF207;
 Mon, 30 Oct 2023 07:40:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1qxMsk-000jXN-32;
 Mon, 30 Oct 2023 08:40:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
References: <20231020082703.1610281-1-adam.duskett@amarulasolutions.com>
 <875y2uphio.fsf@48ers.dk>
Date: Mon, 30 Oct 2023 08:40:18 +0100
In-Reply-To: <875y2uphio.fsf@48ers.dk> (Peter Korsgaard's message of "Wed, 25
 Oct 2023 22:35:27 +0200")
Message-ID: <87a5s0lfrx.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/python-django: bump version to
 4.2.6
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Adam" == Adam Duskett <adam.duskett@amarulasolutions.com> writes:
 >> Tested with tests.package.test_python_django.TestPythonPy3Django.test_run in
 >> Fedora 38 and Debian 11

 >> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

 > Looking at
 > https://www.djangoproject.com/weblog/2023/oct/04/security-releases/,
 > Django 4.2.6 was a security release, so it should have been marked as
 > such (and ideally we would first have bumped to 4.1.12 for easier
 > backporting).

 > 4.2.6 apparently also introduced a regression, so it would be good if
 > you could send a bump to 4.2.7:

 > https://docs.djangoproject.com/en/dev/releases/4.2.7/

For 2023.02.x and 2023.08.x I have instead bumped to 4.1.12, which
contains the same security fix.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

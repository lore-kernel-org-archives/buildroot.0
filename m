Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C72C64EC7
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 15:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 045226115B;
	Tue, 28 Feb 2023 15:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 045226115B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kFkp8Gb894rz; Tue, 28 Feb 2023 15:29:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B8F26115D;
	Tue, 28 Feb 2023 15:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B8F26115D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C07D51BF59A
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 15:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 999FE6115D
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 15:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 999FE6115D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HTFGyTCmXU5P for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 15:29:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80FDD6115B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80FDD6115B
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 15:29:41 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 96FC960005
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 15:29:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1pX1v7-009mae-Mc
 for buildroot@buildroot.org; Tue, 28 Feb 2023 16:29:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20230207172450.921B78430F@busybox.osuosl.org>
Date: Tue, 28 Feb 2023 16:29:37 +0100
In-Reply-To: <20230207172450.921B78430F@busybox.osuosl.org> (Peter Korsgaard's
 message of "Tue, 7 Feb 2023 18:24:10 +0100")
Message-ID: <87ttz5kdum.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] support/dependencies/dependencies.sh:
 silence gcc plugin test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=4fbd2f6d2cf26225f73f584c3a0cacb1b2476f5f
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The gcc plugin test was not using the -q option to grep causing it to print
 > the line to stdout, so fix that.

 > While we're at it, adjust the locale check to use grep -q instead of
 > redirecting to /dev/null for consistency with the other checks.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

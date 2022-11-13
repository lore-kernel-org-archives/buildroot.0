Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EECC4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 16:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2972D60BCE;
	Sun, 13 Nov 2022 16:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2972D60BCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aU0ZKN4jYojz; Sun, 13 Nov 2022 16:55:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AC8B60BCC;
	Sun, 13 Nov 2022 16:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AC8B60BCC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EB241BF2FE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E951060BC9
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E951060BC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pFbSZ_8rScY8 for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 16:55:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F11EA607AA
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F11EA607AA
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 16:55:29 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 21367FF805;
 Sun, 13 Nov 2022 16:55:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ouGGV-005Tnx-9b; Sun, 13 Nov 2022 17:55:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Paul Cercueil <paul@crapouillou.net>
References: <20221018110157.35331-1-paul@crapouillou.net>
Date: Sun, 13 Nov 2022 17:55:27 +0100
In-Reply-To: <20221018110157.35331-1-paul@crapouillou.net> (Paul Cercueil's
 message of "Tue, 18 Oct 2022 12:01:57 +0100")
Message-ID: <877czyoku8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/umtprd: add patch to fix
 output_dir make dependency
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

>>>>> "Paul" == Paul Cercueil <paul@crapouillou.net> writes:

 > Object file targets need to depend on the output_dir target.
 > Upstream commit:
 > https://github.com/viveris/uMTP-Responder/commit/d84216a678edaca81c0899318231cdcca2100d38

 > Fixes:
 > - http://autobuild.buildroot.net/results/c7ce975d398190fc191ccc03813f8ec0b3464c7d/
 > - http://autobuild.buildroot.net/results/0331fb9cf2748b16440ef830d09452a9812f5217/
 > - http://autobuild.buildroot.net/results/a1b1de9e2f764ce22f23d8a8ea88f7ddcf2969a9/
 > - http://autobuild.buildroot.net/results/7c7dbe03d769dc5f155fc14102f6591855605640/
 > - http://autobuild.buildroot.net/results/6cd90b7877520669d9ab9c9fadc9fa36912963b4/
 > - http://autobuild.buildroot.net/results/186689fc9637ae1a8330d7e19057cd1b3c9a841c/

 > Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

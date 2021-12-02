Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22752C433F5
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 17:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4E1B41DFD;
	Thu,  2 Dec 2021 17:35:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2p0lcYs5FzZT; Thu,  2 Dec 2021 17:35:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32F7C41DFB;
	Thu,  2 Dec 2021 17:35:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 701CD1BF3F9
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E1A040A4C
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:35:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gHq6VKqKciTM for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 17:35:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07E6B40162
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 17:35:25 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 904201C0011;
 Thu,  2 Dec 2021 17:35:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mspzN-0006uY-H7; Thu, 02 Dec 2021 18:35:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211019172532.3431240-1-fontaine.fabrice@gmail.com>
 <20211019172532.3431240-2-fontaine.fabrice@gmail.com>
Date: Thu, 02 Dec 2021 18:35:21 +0100
In-Reply-To: <20211019172532.3431240-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 19 Oct 2021 19:25:31 +0200")
Message-ID: <87wnkmdi5i.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] package/heimdal: install compile_et
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > compile_et is not installed anymore by heimdal since version 7.0.1 and
 > https://github.com/heimdal/heimdal/commit/e40ef47b57f3c62f94c4056f02ced3af2ed083ca

 > So remove the broken symlink and install it manually as it is needed for
 > samba4 because compile_et provided by e2fsprogs raises a build failure

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

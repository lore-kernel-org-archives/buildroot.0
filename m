Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8B8C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 17:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B496B82894;
	Thu, 11 Aug 2022 17:39:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B496B82894
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ULZhbeax2yY9; Thu, 11 Aug 2022 17:39:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E26C081A3B;
	Thu, 11 Aug 2022 17:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E26C081A3B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F49F1BF35F
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 17:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A1304038E
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 17:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A1304038E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kwiuEmsfL-E1 for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 17:39:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98FE4400DB
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98FE4400DB
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 17:39:06 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 322901BF209;
 Thu, 11 Aug 2022 17:39:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oMC99-002ztC-A1; Thu, 11 Aug 2022 19:39:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220615022348.914136-1-james.hilliard1@gmail.com>
 <20220720235244.107aee5f@windsurf>
Date: Thu, 11 Aug 2022 19:39:03 +0200
In-Reply-To: <20220720235244.107aee5f@windsurf> (Thomas Petazzoni via
 buildroot's message of "Wed, 20 Jul 2022 23:52:44 +0200")
Message-ID: <87fsi2k7d4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/{glibc,
 localedef}: bump to version
 2.35-134-gb6aade18a7e5719c942aa2da6cf3157aca993fa4
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
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Tue, 14 Jun 2022 20:23:48 -0600
 > James Hilliard <james.hilliard1@gmail.com> wrote:

 >> Contains various fixes some of which may effect pthread fork handling.
 >> 
 >> Add patch reverting a commit breaking builds.
 >> 
 >> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 >> ---
 >> Changes v1 -> v2:
 >> - revert a commit breaking build
 >> ---
 >> ...lement-a-useful-version-of-_startup_.patch | 132 ++++++++++++++++++
 >> package/glibc/glibc.hash                      |   2 +-
 >> package/glibc/glibc.mk                        |   2 +-
 >> package/localedef/localedef.mk                |   2 +-
 >> 4 files changed, 135 insertions(+), 3 deletions(-)
 >> create mode 100644 package/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch

 > Applied to master, thanks.

Committed to 2022.05.x, thanks.

James, what is the status of that patch? I see that it has not been
applied upstream?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

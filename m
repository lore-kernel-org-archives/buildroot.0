Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9A9C001B2
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 18:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFA8D41802;
	Wed, 14 Dec 2022 18:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFA8D41802
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HYyJewlqvJRk; Wed, 14 Dec 2022 18:57:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0CD7417C7;
	Wed, 14 Dec 2022 18:57:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0CD7417C7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EA821BF312
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 18:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEB828199D
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 18:57:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEB828199D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uUp1vOCZxOp9 for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 18:57:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FE2081F3A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FE2081F3A
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 18:57:06 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E86491C0007;
 Wed, 14 Dec 2022 18:57:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p5Ww8-000VWv-5v; Wed, 14 Dec 2022 19:57:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Andrey Nechypurenko <andreynech@gmail.com>
References: <CAOiXNkA3_5sO2ajKtvco8G6O_Qufz0N=i1javZjFbDMj+zDf5g@mail.gmail.com>
Date: Wed, 14 Dec 2022 19:57:00 +0100
In-Reply-To: <CAOiXNkA3_5sO2ajKtvco8G6O_Qufz0N=i1javZjFbDMj+zDf5g@mail.gmail.com>
 (Andrey Nechypurenko's message of "Wed, 14 Dec 2022 19:00:01 +0100")
Message-ID: <877cytvmo3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] Confusion about 2022.11 release branch
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Andrey" == Andrey Nechypurenko <andreynech@gmail.com> writes:

 > Hello Buildroot Folks,
 > I am currently trying to update to the latest stable 2022.11 release.  What
 > surprises me is that there is no 2022.11.x branch as I would expect.
 > Instead, it seems to me that the release is somehow related to the branch
 > 2012.11.x. It could be confirmed looking at this location:
 > https://git.buildroot.net/buildroot/tag/?h=2022.11
 > It says Release 2022.11 but the branch mentioned in the combo-box in the top
 > right corner says it is the 2012.11.x branch.

 > So my question is whether it is intended like this or am I missing
 > something?

It is simply that I haven't made one yet. 2022.11 was released on the
5th, and since then I have backported the (security) fixes from 2022.11
to the older releases (2022.02.x and 2022.08.x). Those branches have now
also been released so I will start reviewing the post-2022.11 changes to
master and backport them to 2022.11.x (and 2022.02.x where applicable).

The reason why you see 2012.11.x in the branch drop down is that was
simple the first time I did such a bugfix release (and it sorts
alphabetically before the other branch names).

Anything specific you are missing from the 2022.11 release?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

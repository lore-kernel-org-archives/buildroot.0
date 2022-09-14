Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2664ECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 22:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25DD2417D8;
	Wed, 14 Sep 2022 22:12:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25DD2417D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O_5N4bLI9Uie; Wed, 14 Sep 2022 22:12:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0631F417A8;
	Wed, 14 Sep 2022 22:12:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0631F417A8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F12011BF38C
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAE21417A8
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAE21417A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uPVxgc_mDp1G for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 22:12:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E16341702
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E16341702
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 22:12:18 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7E674200005;
 Wed, 14 Sep 2022 22:12:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oYac9-007qeT-O9; Thu, 15 Sep 2022 00:12:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220808201330.378A787013@busybox.osuosl.org>
Date: Thu, 15 Sep 2022 00:12:13 +0200
In-Reply-To: <20220808201330.378A787013@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Mon, 8 Aug 2022 22:27:35 +0200")
Message-ID: <87sfktobb6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/python-crossbar: adjust
 dependencies based on requirements-min.txt
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=bfafb08c62a214fc24f6f33ce4c0b18ad6f67dfd
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This commit makes sure that the python-crossbar package pulls in the
 > right dependencies, based on the requirements-min.txt.

 > It does so by:

 >  - Changing the 0002-Remove-idna-requirement patch by a more thorough
 >    patch that drops all indirect dependencies from
 >    requirements-min.txt, making it easier to have a 1:1 mapping
 >    between lines in requirements-min.txt and Buildroot selects.

 >  - Changing the
 >    0003-crossbar-webservice-wap-use-markupsafe-instead-of-we patch to
 >    update requirements-min.txt to indicate the new MarkupSafe
 >    dependency. Here again, to have a 1:1 mapping between lines in
 >    requirements-min.txt and Buildroot selects.

 >  - Updating the Buildroot selects to match requirements-min.txt, with
 >    relevant comments when it does not.

 >  - Fixing up the Crossbar test case to no longer force autobahn to use
 >    umsgpack. Instead, we now use the default of msgpack that is
 >    expected by autobahn.

 > Fixes bug #14556, https://bugs.busybox.net/show_bug.cgi?id=14556.

 > Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2022.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

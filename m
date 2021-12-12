Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10499C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 22:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D6364064B;
	Sun, 12 Dec 2021 22:18:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cv1wHVbbJDh1; Sun, 12 Dec 2021 22:18:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C55114063A;
	Sun, 12 Dec 2021 22:18:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C226F1BF337
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A11724063A
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:18:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HCe81PGZgxmx for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 22:18:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A64FE40010
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 22:18:09 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C9E21240008;
 Sun, 12 Dec 2021 22:18:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mwXAV-0002l5-7X; Sun, 12 Dec 2021 23:18:07 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
 <4cf753e522f89d1f109a3b1cd7742cb4e18aa743.1636810092.git.yann.morin.1998@free.fr>
Date: Sun, 12 Dec 2021 23:18:07 +0100
In-Reply-To: <4cf753e522f89d1f109a3b1cd7742cb4e18aa743.1636810092.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 13 Nov 2021 14:28:19 +0100")
Message-ID: <87wnk9v55s.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 08/16 v2] core/show-info: 'name' only
 applies to packages
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Commit 0cfa1659487f (package/pkg-utils.mk: introduce "name" field in
 > show-info output) did what it said, but did so in the generic show-info
 > part, thus it was also added to filesystems (rootfs), the other kind of
 > entity that show-info reports on.

 > Only packages have a "name"; filesystems do not. Instead, they already
 > have an 'image_name'.

 > Move the 'name' field to the package-related part of show-info.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

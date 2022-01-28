Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C1CC433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 18:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2002641CD6;
	Fri, 28 Jan 2022 18:25:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JQJMSVSqVYtf; Fri, 28 Jan 2022 18:25:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A74241680;
	Fri, 28 Jan 2022 18:25:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 579D71BF2F7
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 18:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CFF641680
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 18:25:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZRyRzhd_Yb4q for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 18:25:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1017B4165D
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 18:25:40 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6F1E7FF806;
 Fri, 28 Jan 2022 18:25:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nDVwF-00072p-3H; Fri, 28 Jan 2022 19:25:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
References: <20220128105917.30421-1-thomas.devoogdt@barco.com>
 <20220128105917.30421-2-thomas.devoogdt@barco.com>
 <20220128134223.GB765275@momiji>
 <CACXRmJi3_D1n3tJNXgm+6azeVqY8=cA7gPvfWT8xMbR3Dk8eWA@mail.gmail.com>
 <20220128161314.GB770598@momiji>
Date: Fri, 28 Jan 2022 19:25:35 +0100
In-Reply-To: <20220128161314.GB770598@momiji> (Adrian Perez de Castro's
 message of "Fri, 28 Jan 2022 16:13:14 +0200")
Message-ID: <87o83v7m5c.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] libsoup3 migration
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
Cc: Thomas Devoogdt <thomas.devoogdt@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

Hi,

 > There is a tracking table for the libsoup3 migration that one of my work mates
 > has been maintaining up to date; you can find it here:

 >   https://gitlab.gnome.org/GNOME/libsoup/-/issues/218

 > For most of the packages from Buildroot that you listed there are patches
 > filed to their corresponding upstreams. 

Thanks, that is helpful!

 > The way I see it, there are three possible ways for a migration:

 > - Keep both libsoup2 and libsoup3 in the tree, migrate packages to libsoup3
 >   where possible and where we do not see conflicts (like loading both versions
 >   in the same process) likely to happen.

 > - Replace libsoup2 with libsoup3 *now*, import patches into the Buildroot tree
 >   for the packages which do not yet have releases compatible with libsoup3.

 > - Replace libsoup2 with libsoup3 *later*, once all upstreams of packages
 >   present in Buildroot put out releases that work with libsoup3.

 > Personally I tend to think the last option is likely to be the best, to avoid
 > confusions and the possibility that people who use Buildroot as basis for
 > their work get into nasty situations due to both libsoup2 and libsoup3 being
 > available.

We don't want to maintain any more patches than needed, so option 2
isn't very nice. The question about having both v2 and v3 in the tree at
the same time probably depends on how long v2 will be supported
upstream, how fast applications will be migrate to v3 and how fast they
will drop their v2 support - E.G. we still want to be able to pull in
security fixes to any packages using libsoup during the 2022.02.x
support period.

We typically don't go as far as detecting any possible runtime issues
from package combinations in Kconfig, and it looks like libsoup v2
recently gained some support for detecting an already loaded v3, so
perhaps that is good enough?

https://www.mail-archive.com/ftp-release-list@gnome.org/msg32190.html

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

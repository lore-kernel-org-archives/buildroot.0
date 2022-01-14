Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB452C433F5
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 16:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77BDD415CD;
	Fri, 14 Jan 2022 16:15:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A0PqJfpijGaU; Fri, 14 Jan 2022 16:15:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C47B9415A0;
	Fri, 14 Jan 2022 16:15:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 54D5A1BF362
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42C5560806
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:15:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GNdwjO21alZF for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 16:14:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2382260709
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 16:14:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 2E7F424000E;
 Fri, 14 Jan 2022 16:14:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n8PE6-0000VA-46; Fri, 14 Jan 2022 17:14:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20211115221805.3956738-1-fontaine.fabrice@gmail.com>
 <1cc57fb6-6ca5-e82d-e748-780028b748b8@mind.be>
Date: Fri, 14 Jan 2022 17:14:54 +0100
In-Reply-To: <1cc57fb6-6ca5-e82d-e748-780028b748b8@mind.be> (Arnout
 Vandecappelle's message of "Sat, 11 Dec 2021 10:58:04 +0100")
Message-ID: <87czku70qp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/capnproto: bump to version 0.9.1
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 15/11/2021 23:18, Fabrice Fontaine wrote:
 >> - Drop patch (already in version)
 >> - Fix build on musl by disabling fibers through the new KJ_USE_FIBERS
 >> variable:
 >> https://github.com/capnproto/capnproto/issues/1167
 >> https://github.com/capnproto/capnproto/pull/1313
 >> - Update indentation in hash file (two spaces)
 >> 
 >> https://capnproto.org/news
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/1a54cf9e7223c2bd67a5c85a6f2f42aa98da3a53

 >  I've applied to master now, but hte build error of course still
 > exists on the 2021.11 branch.

And 2021.02.x.

Committed to 2021.02.x and 2021.11.x to fix that, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

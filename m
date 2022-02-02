Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC42C433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 10:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CD42415D0;
	Wed,  2 Feb 2022 10:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dLOfb907LGNt; Wed,  2 Feb 2022 10:10:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D9AD41642;
	Wed,  2 Feb 2022 10:10:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CDF6A1BF588
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 10:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9D8F60A83
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 10:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CocZSoJGWHY4 for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 10:10:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57A5260A87
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 10:10:15 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4AD8960018;
 Wed,  2 Feb 2022 10:10:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nFCaZ-0005Ux-7g; Wed, 02 Feb 2022 11:10:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220131225230.178602-1-fontaine.fabrice@gmail.com>
Date: Wed, 02 Feb 2022 11:10:11 +0100
In-Reply-To: <20220131225230.178602-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 31 Jan 2022 23:52:30 +0100")
Message-ID: <87k0ed1svw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: security bump to version
 2.4.4
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

 > Expat 2.4.4 has been released yesterday. Besides a memory leak bugfix to
 > xmlwf and fixes to the build system, this release is about security
 > fixes. There are 2 CVEs involved, both related to fixed-size integer
 > math (integer overflow) near memory allocation, not unlike what we had
 > with 2.4.3 before. Impact is denial of service, or more.

 > Fix CVE-2022-23852 and CVE-2022-23990

 > https://blog.hartwork.org/posts/expat-2-4-4-released/
 > https://github.com/libexpat/libexpat/blob/R_2_4_4/expat/Changes

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Sorry, I applied the other patch for the same before noticing this (even
though your commit message is a lot nicer).

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

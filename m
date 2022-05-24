Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E60C433EF
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 12:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 615A741677;
	Tue, 24 May 2022 12:52:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EjJqIDk0vN6v; Tue, 24 May 2022 12:52:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B1BE4160B;
	Tue, 24 May 2022 12:52:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 158531BF400
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 12:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11A7F40477
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 12:52:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CxXhuNuxEG1X for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 12:52:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEF66400EF
 for <buildroot@buildroot.org>; Tue, 24 May 2022 12:52:41 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 40E29E0013;
 Tue, 24 May 2022 12:52:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ntU1d-00EyN4-8L; Tue, 24 May 2022 14:52:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220416150604.1965916-1-fontaine.fabrice@gmail.com>
Date: Tue, 24 May 2022 14:52:37 +0200
In-Reply-To: <20220416150604.1965916-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 16 Apr 2022 17:06:04 +0200")
Message-ID: <87pmk3um7e.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libsigsegv: bump to version 2.14
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
Cc: Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This bump will fix the following build failure on or1k and microblazeel:
 > In file included from handler.c:20:
 > handler-unix.c: In function 'sigsegv_handler':
 > handler-unix.c:194:28: error: 'struct vma_struct' has no member named 'is_near_this'
 >   194 |                       : vma.is_near_this (addr, &vma))
 >       |                            ^

 > https://git.savannah.gnu.org/gitweb/?p=libsigsegv.git;a=blob;f=NEWS;h=4d012f8b6cd9b2c1eccbf266a10aae56b0e79978;hb=9ad117adabd223b79e037575e071855c2b8b35c0
 > https://git.savannah.gnu.org/gitweb/?p=libsigsegv.git;a=blob;f=ChangeLog;h=c52b227aae190ba9b161282efaa5f33cb4a127f9;hb=9ad117adabd223b79e037575e071855c2b8b35c0

 > Fixes:
 >  - http://autobuild.buildroot.org/results/c693fafb8f1f68be30a281313fb1f0890cc08b1e
 >  - http://autobuild.buildroot.org/results/ecde11129d102e3321b2aaef407697c29311c705

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

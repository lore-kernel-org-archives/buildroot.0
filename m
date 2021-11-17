Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88C1C433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 15:39:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 437156137E
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 15:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 437156137E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E467D80F63;
	Wed, 17 Nov 2021 15:39:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UdHuQ0b33KxX; Wed, 17 Nov 2021 15:39:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 513EC80F57;
	Wed, 17 Nov 2021 15:39:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD38B1BF36B
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 15:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CC8D40545
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 15:39:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qrfZKueIfJX1 for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 15:39:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F3A540543
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 15:39:17 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 0153360014;
 Wed, 17 Nov 2021 15:39:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mnN1n-0004hK-AI; Wed, 17 Nov 2021 16:39:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211110174609.1927002-1-fontaine.fabrice@gmail.com>
Date: Wed, 17 Nov 2021 16:39:15 +0100
In-Reply-To: <20211110174609.1927002-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 10 Nov 2021 18:46:09 +0100")
Message-ID: <87o86ivljw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/binutils: zlib is mandatory
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > As found out by Yann [1], if zlib is not provided by the system,
 > binutils will use a bundled version. So use --with-system-zlib which is
 > available since version 2.21 and
 > https://github.com/bminor/binutils-gdb/commit/700d40ca16eb3ba1ecc1e602cb3eec175bdf70f0

 > This will fix the following build failure with oprofile:

 > checking for bfd_openr in -lbfd... no
 > checking for compress in -lz... no
 > configure: error: libz library not found; required by libbfd

 > As found out by Arnout [1], this fails infrequently because static is
 > already pretty rare, but in addition zlib is almost always selected by
 > some other package.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/0e1d16dfbb455a08db80ac5d35613908c3b4163f

 > [1] https://patchwork.ozlabs.org/project/buildroot/patch/20211030214734.2154583-1-fontaine.fabrice@gmail.com/

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

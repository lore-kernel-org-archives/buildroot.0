Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB48FC433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 16:55:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D49B611C5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 16:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D49B611C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA8734083C;
	Tue,  5 Oct 2021 16:55:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YMqsP7vH7mLB; Tue,  5 Oct 2021 16:55:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35CE740839;
	Tue,  5 Oct 2021 16:55:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 551BB1BF2F2
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 16:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52AF140839
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 16:55:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BQQhxLRxsNdG for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 16:55:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4239640836
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 16:55:52 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id B86AFE0012;
 Tue,  5 Oct 2021 16:55:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mXnjI-0007YY-8i; Tue, 05 Oct 2021 18:55:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach <baruch@tkos.co.il>
References: <20210919145331.3492573-1-fontaine.fabrice@gmail.com>
 <87r1czd07i.fsf@dell.be.48ers.dk> <87ilyb5sp1.fsf@tarshish>
Date: Tue, 05 Oct 2021 18:55:48 +0200
In-Reply-To: <87ilyb5sp1.fsf@tarshish> (Baruch Siach's message of "Tue, 05 Oct
 2021 19:41:49 +0300")
Message-ID: <87k0irbecr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/wavemon: add libcap optional
 dependency
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
Cc: =?utf-8?Q?J=C3=B6rg?= Krause <joerg.krause@embedded.rocks>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Tue, Oct 05 2021, Peter Korsgaard wrote:
 >>>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> 
 >> > libcap is an optional dependency which is enabled by default since
 >> > version 0.7.1 and
 >> > https://github.com/uoaerg/wavemon/commit/669c53e3359af5f6d4044126e22ab95f40a968f4
 >> > and can be explicitly enabled or disabled since version 0.9.0 and
 >> > https://github.com/uoaerg/wavemon/commit/af36fbe75649f745e205cd961302b656b8461e06
 >> 
 >> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> 
 >> Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

 > Not in 2021.08.x as of commit 46da68c01bbf ("package/google-breakpad:
 > fix build with glibc >= 2.33").

Ups, fixed - Thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

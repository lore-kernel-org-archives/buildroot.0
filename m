Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE490C4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 16:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A151D6FB02;
	Fri, 12 Jan 2024 16:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A151D6FB02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VklMmQ8zj615; Fri, 12 Jan 2024 16:34:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFF1D6FAFF;
	Fri, 12 Jan 2024 16:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFF1D6FAFF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 643C91BF2F3
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 16:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39FBF42E5F
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 16:34:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39FBF42E5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a4dzsPFf-ycc for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 16:34:48 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2719E42075
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 16:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2719E42075
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4FC2FF802;
 Fri, 12 Jan 2024 16:34:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rOKUV-00C5i2-36;
 Fri, 12 Jan 2024 17:34:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Alexey Brodkin via buildroot <buildroot@buildroot.org>
References: <20240102155552.1902447-1-abrodkin@synopsys.com>
 <ZZR2I87QpH7JFOpp@landeda>
 <DS7PR12MB90419624B8739BAF541F133DA161A@DS7PR12MB9041.namprd12.prod.outlook.com>
Date: Fri, 12 Jan 2024 17:34:43 +0100
In-Reply-To: <DS7PR12MB90419624B8739BAF541F133DA161A@DS7PR12MB9041.namprd12.prod.outlook.com>
 (Alexey Brodkin via buildroot's message of "Tue, 2 Jan 2024 21:55:13
 +0000")
Message-ID: <87bk9q1pek.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/gdb: Remove special handling of
 libstdc++ for ARC
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Alexey" == Alexey Brodkin via buildroot <buildroot@buildroot.org> writes:

 > Hi Yann,
 >> On 2024-01-02 07:55 -0800, Alexey Brodkin via buildroot spake thusly:
 >> > Effectively that's a revert of a very old fix [1]
 >> > which is no longer needed.
 >> 
 >> It would have been nice to get a better indication of how much time it
 >> has not been needed anymore, so that we know wehther we should backport
 >> that to maintenance beranches. ca99d0ea925e5a8 mentions that it would be
 >> fixed in 2017.03, so we can certainly assume that it has been fixed for
 >> quite some time now, and thus we can backport this to all our
 >> maintenance branches (2023.02 LTS and 2023.11).
 >> 
 >> I forgot to add that information befoe pushing, sorry.

 > Well, indeed it's been so many years since that fix and I'm sure
 > that problem is long gone.

 > What's moreinteresting, that option "--disable-build-with-cxx" was removed
 > in GDB 8.x in September 2016 as since then C++ is required, see
 > https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=cf6de44d75082116865a85cbf94db2632b679361

 > That said it's totaly fine to back-port that fix to stable Buildroot branches,
 > but since it's not functional (it doesn't change anyting in reality) I'd say
 > there's no point in back-porting it.

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

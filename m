Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B87C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 11:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C59E960A8C;
	Mon,  6 Feb 2023 11:07:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C59E960A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gt5u5VMlO-ZS; Mon,  6 Feb 2023 11:07:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F02F060812;
	Mon,  6 Feb 2023 11:07:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F02F060812
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6D3B1BF397
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C060C401C3
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C060C401C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zbdyg69gq4Wb for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 11:07:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43400401A2
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43400401A2
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 11:07:48 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7F637FF80A;
 Mon,  6 Feb 2023 11:07:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pOzLc-00DpUS-L8; Mon, 06 Feb 2023 12:07:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
 <20221127130739.1862398-9-ricardo.martincoski@gmail.com>
Date: Mon, 06 Feb 2023 12:07:44 +0100
In-Reply-To: <20221127130739.1862398-9-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Sun, 27 Nov 2022 10:07:22 -0300")
Message-ID: <871qn3carj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [next 08/25] package/pugixml: unconditionally set
 BUILD_DEFINES
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
Cc: Theo Debrouwere <t.debrouwere@televic.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > The ifdef construct intended to avoid passing -DBUILD_DEFINES="" was
 > never needed, because even upstream version v1.9 used in 2019 when the
 > configuration options were added, can handle an empty string for
 > BUILD_DEFINES.
 > In fact an empty string is the default for v1.9 if it is not passed
 > during configure.

 > Also, the host variant already sets BUILD_DEFINES unconditionally.

 > So remove the unneeded conditional.

 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Theo Debrouwere <t.debrouwere@televic.com>
 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > ---
 > NOTE 1:
 > For versions starting from v1.11 this flag BUILD_DEFINES is ignored, but
 > it will be fixed in the next patch.
 > I had split into 2 patches because this first one applies to old
 > versions of the package too. Someone could theoretically decide to
 > backport to a local copy of buildroot 2020.05.x for instance.

 > NOTE 2:
 > It doesn't test much, since BUILD_DEFINES is ignored, but anyway:
 > https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/704554673
 > 44 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
 > test-pkg config:
 > BR2_PACKAGE_PUGIXML=y

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

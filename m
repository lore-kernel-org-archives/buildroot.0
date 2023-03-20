Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40459C6FD1D
	for <buildroot@archiver.kernel.org>; Mon, 20 Mar 2023 08:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB50E60B9D;
	Mon, 20 Mar 2023 08:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB50E60B9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MhCTIwfV5riO; Mon, 20 Mar 2023 08:41:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED6F060BB1;
	Mon, 20 Mar 2023 08:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED6F060BB1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3EB9A1BF35B
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 08:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18E8260BC8
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 08:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18E8260BC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZMMuWC6TjQyK for <buildroot@lists.busybox.net>;
 Mon, 20 Mar 2023 08:41:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55AE36059C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55AE36059C
 for <buildroot@buildroot.org>; Mon, 20 Mar 2023 08:41:21 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EED0F1C0003;
 Mon, 20 Mar 2023 08:41:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1peB4u-007ZTU-Qb; Mon, 20 Mar 2023 09:41:16 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230318220510.AD6C086EA5@busybox.osuosl.org>
Date: Mon, 20 Mar 2023 09:41:16 +0100
In-Reply-To: <20230318220510.AD6C086EA5@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Sat, 18 Mar 2023 23:04:38 +0100")
Message-ID: <87edpjx1ar.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/linux-tools/S10hyperv: fix
 shellcheck warnings
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=c4173d8b08525f260fea8a2a1e805b806bcba9fc
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > When running "make check-package" on a system with shellcheck 0.9.0,
 > the command fails with output:

 >     make check-package
 >     package/linux-tools/S10hyperv:0: run 'shellcheck' and fix the warnings
 >     ...
 >     2 warnings generated

 > This commit fixes the warnings reported by the command:

 >     shellcheck package/linux-tools/S10hyperv

 > This commit also fixes the four-space indent by a single tab on the
 > changed lines. Since this fixes the indentation warnings of
 > check-package, the Indent exclusion in .checkpackageignore is also
 > removed.

 > Fixes:

 >     In package/linux-tools/S10hyperv line 27:
 >         return $ret
 >                ^--^ SC2086 (info): Double quote to prevent globbing and word splitting.

 >     In package/linux-tools/S10hyperv line 48:
 >         return $ret
 >                ^--^ SC2086 (info): Double quote to prevent globbing and word splitting.

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.02.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F88C433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 18:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26D85405A8;
	Fri, 28 Jan 2022 18:36:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YFOKLn6u2QbW; Fri, 28 Jan 2022 18:36:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CC9540580;
	Fri, 28 Jan 2022 18:36:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 97BF41BF2F7
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 18:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8635084E16
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 18:36:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jkRvsxsNIHJu for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 18:36:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7143D84E13
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 18:36:28 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id AE6AD200002;
 Fri, 28 Jan 2022 18:36:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nDW6h-0007VV-JR; Fri, 28 Jan 2022 19:36:23 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20220121165046.183224-1-quentin.schulz@theobroma-systems.com>
 <20220121205327.GK3252931@scaer>
 <3e21aca9-71ec-d648-c9e3-058a9f9960b2@theobroma-systems.com>
Date: Fri, 28 Jan 2022 19:36:23 +0100
In-Reply-To: <3e21aca9-71ec-d648-c9e3-058a9f9960b2@theobroma-systems.com>
 (Quentin Schulz's message of "Mon, 24 Jan 2022 10:31:06 +0100")
Message-ID: <87fsp77lnc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/qt5/qt5base: fix CVE-2021-38593
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
Cc: Julien Corjon <corjon.j@ecagroup.com>, Peter Seiderer <ps.report@gmx.net>,
 Quentin Schulz <foss+buildroot@0leil.net>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Quentin" == Quentin Schulz <quentin.schulz@theobroma-systems.com> writes:

 > Hi Yann,
 > On 1/21/22 21:53, Yann E. MORIN wrote:
 >> Quentin, All,
 >> 
 >> On 2022-01-21 17:50 +0100, Quentin Schulz spake thusly:
 >>> 5.15.2 is the last public release of 5.15 and does not contain this CVE
 >>> fix. However, >=6.1.2 and >5.12.12 all contain the necessary patches so
 >>> let's port them to 5.15.2.
 >>> 
 >>> Technically only the first two patches are required to patch the CVE.
 >>> However, the second patch introduces a regression that is fixed in the third
 >>> patch.
 >>> 
 >>> The patches are taken from KDE kde/5.15 git branch.
 >>> 
 >>> Cc: Quentin Schulz <foss+buildroot@0leil.net>
 >>> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
 >> 
 >> Applied to master, thanks.
 >> 

 > Thanks!

 > I forgot to add that this patch can be applied to 2021.02.x and
 > 2021.11.x branches too since qtbase hasn't changed since.

Thanks for the heads up.

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925F2C4332F
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 19:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C13041B50;
	Tue, 18 Oct 2022 19:42:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C13041B50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HwqdyVijXM8H; Tue, 18 Oct 2022 19:42:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2337B41B3E;
	Tue, 18 Oct 2022 19:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2337B41B3E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 67AC91BF95F
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 19:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 432CA402C3
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 19:42:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 432CA402C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0S2hD0sfsT3b for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 19:42:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0ED8E40111
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0ED8E40111
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 19:42:24 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 04A89FF803;
 Tue, 18 Oct 2022 19:42:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oksTi-008mfJ-Kw; Tue, 18 Oct 2022 21:42:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
References: <20221017071002.48266-1-neal.frager@amd.com>
 <20221017071002.48266-2-neal.frager@amd.com>
Date: Tue, 18 Oct 2022 21:42:18 +0200
In-Reply-To: <20221017071002.48266-2-neal.frager@amd.com> (Neal Frager's
 message of "Mon, 17 Oct 2022 01:10:02 -0600")
Message-ID: <87bkq87wbp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig: fix
 pmufw sw reset
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
Cc: luca.ceresoli@bootlin.com, buildroot@buildroot.org, kris.chaplin@amd.com,
 wesley@sonifex.co.uk, giulio.benetti@benettiengineering.com,
 michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > This patch will solve the problem of the pmufw built by the
 > zynqmp-pmufw-builder where soft resets crash for the zcu106.
 > Details of the issue can be found here:

 > https://lore.kernel.org/buildroot/87ilqccu3k.fsf@dell.be.48ers.dk/

 > Signed-off-by: Neal Frager <neal.frager@amd.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

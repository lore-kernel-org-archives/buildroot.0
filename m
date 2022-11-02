Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92B8C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 22:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73147818BE;
	Wed,  2 Nov 2022 22:57:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73147818BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pnh1A8i7BUwl; Wed,  2 Nov 2022 22:57:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0F0781E93;
	Wed,  2 Nov 2022 22:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0F0781E93
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 026B61BF471
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD2FB4172F
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:57:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD2FB4172F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U_BeqyF7pkTt for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 22:57:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCC7B40355
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCC7B40355
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 22:57:47 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 871DF240002;
 Wed,  2 Nov 2022 22:57:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oqMg3-007nfR-Kc; Wed, 02 Nov 2022 23:57:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
References: <20221017071002.48266-1-neal.frager@amd.com>
 <20221017071002.48266-2-neal.frager@amd.com>
Date: Wed, 02 Nov 2022 23:57:43 +0100
In-Reply-To: <20221017071002.48266-2-neal.frager@amd.com> (Neal Frager's
 message of "Mon, 17 Oct 2022 01:10:02 -0600")
Message-ID: <8735b1rml4.fsf@dell.be.48ers.dk>
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

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

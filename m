Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43D6C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 22:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ADB841730;
	Wed,  2 Nov 2022 22:58:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ADB841730
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IJHq74ShNbeu; Wed,  2 Nov 2022 22:58:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3042B40355;
	Wed,  2 Nov 2022 22:58:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3042B40355
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27ABE1BF95F
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 035F460AFC
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:57:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 035F460AFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dREGUVaZ3sQq for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 22:57:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01DF960BC7
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 01DF960BC7
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 22:57:56 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 41FBA100004;
 Wed,  2 Nov 2022 22:57:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oqMgC-007nfi-6x; Wed, 02 Nov 2022 23:57:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
References: <20221017094429.4752-1-neal.frager@amd.com>
Date: Wed, 02 Nov 2022 23:57:52 +0100
In-Reply-To: <20221017094429.4752-1-neal.frager@amd.com> (Neal Frager's
 message of "Mon, 17 Oct 2022 03:44:29 -0600")
Message-ID: <87y1stq80f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kv260_defconfig:
 fix pmufw sw reset
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
 > zynqmp-pmufw-builder where soft resets crash for the kv260.
 > Details of the issue can be found here:

 > https://lore.kernel.org/buildroot/87ilqccu3k.fsf@dell.be.48ers.dk/

 > Please note that this is a temporary solution as the kv260
 > pmufw is not yet available on the Xilinx github. This is expected
 > in the coming months.  The nealfrager github uses the same
 > licensing terms as the Xilinx github regarding the distribution of
 > zynqmp pmufw binary files.

 > https://github.com/Xilinx/ubuntu-firmware/blob/v2022.1_22.04_1/LICENSE
 > https://github.com/nealfrager/buildroot-firmware/blob/v2022.1/LICENSE

 > Signed-off-by: Neal Frager <neal.frager@amd.com>

Committed to 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

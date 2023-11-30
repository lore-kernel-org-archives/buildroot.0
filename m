Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8841C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 22:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31EE44016C;
	Thu, 30 Nov 2023 22:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31EE44016C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9fqP57RCQVb1; Thu, 30 Nov 2023 22:37:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 616FB404DA;
	Thu, 30 Nov 2023 22:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 616FB404DA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB4551BF844
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 22:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 801EB8459C
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 22:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 801EB8459C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HUZXK7d4i7Z0 for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 22:37:16 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FA858459A
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 22:37:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FA858459A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B0BCFF80A;
 Thu, 30 Nov 2023 22:37:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r8pei-003RcC-1U;
 Thu, 30 Nov 2023 23:37:12 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230808180959.28091-1-ps.report@gmx.net>
 <20231127185138.GD3177259@scaer>
Date: Thu, 30 Nov 2023 23:37:12 +0100
In-Reply-To: <20231127185138.GD3177259@scaer> (Yann E. MORIN's message of
 "Mon, 27 Nov 2023 19:51:38 +0100")
Message-ID: <87zfyu7trb.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v1] board/raspberrypi/config_4_64bit.txt:
 remove testing dtoverlay entries (vc4-kms-v3d-pi4, imx219)
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
Cc: Peter Seiderer <ps.report@gmx.net>, Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2023-08-08 20:09 +0200, Peter Seiderer spake thusly:
 >> Remove private/testing dtoverlay entries (vc4-kms-v3d-pi4, imx219 and
 >> commented out ov5647) wrongly introduced by commit 689b9ac439
 >> ("package/rpi-firmware: rework boot/config file handling") [1].
 >> 
 >> [1] https://git.buildroot.net/buildroot/commit/?id=689b9ac439ab7b507c8982b6102bddf59d03efbf
 >> 
 >> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

 > Applied to master, thanks.

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

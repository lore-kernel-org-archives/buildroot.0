Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F030C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 10:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3DE141B59;
	Wed, 30 Aug 2023 10:49:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3DE141B59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GzdpAM13ocCc; Wed, 30 Aug 2023 10:49:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06D1341B3D;
	Wed, 30 Aug 2023 10:49:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06D1341B3D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 826021BF2B1
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 10:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A1CC41B3D
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 10:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A1CC41B3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8jGmR1GS3zPR for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 10:49:32 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0009241B36
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 10:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0009241B36
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF19460002;
 Wed, 30 Aug 2023 10:49:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qbIlL-0002RW-SG; Wed, 30 Aug 2023 12:49:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20230726194453.1462570-1-bernd@kuhls.net>
Date: Wed, 30 Aug 2023 12:49:27 +0200
In-Reply-To: <20230726194453.1462570-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 26 Jul 2023 21:44:52 +0200")
Message-ID: <87v8cwreiw.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] package/wolfssl: disable asm on armv4
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Quoting
 > https://developer.arm.com/documentation/dui0489/i/arm-and-thumb-instructions/clz
 > "This ARM instruction is available in ARMv5T and above."

 > Fixes:
 > - armeb
 >   http://autobuild.buildroot.net/results/ea9/ea9b19e872b4b20b97fceec3f7e0a6a1109c4f12/
 >   /tmp/ccdRCOaB.s:27: Error: selected processor does not support `clz r5,r2' in ARM mode
 > - arm
 >   http://autobuild.buildroot.net/results/cb1/cb1c7ac68b3379d3f4b5efc897198bea0a904217/
 >   /tmp/cc72ECAj.s:6764: Error: selected processor does not support `clz r5,r0' in ARM mode
 >   /tmp/cc72ECAj.s:7110: Error: selected processor does not support `clz r5,lr' in ARM mode
 >   /tmp/cc72ECAj.s:8934: Error: selected processor does not support `clz r5,fp' in ARM mode

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

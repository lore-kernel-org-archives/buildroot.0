Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA27C54FC6
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 08:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8CA26065D;
	Sun,  1 Sep 2024 08:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FcHWlqbabtNa; Sun,  1 Sep 2024 08:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F11E66066C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F11E66066C;
	Sun,  1 Sep 2024 08:40:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2392A1BF3AA
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 08:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D38140320
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 08:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p30t70bv4uO6 for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 08:40:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 31BD040021
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31BD040021
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31BD040021
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 08:40:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6F1C40002;
 Sun,  1 Sep 2024 08:40:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1skg8G-000ip7-0n;
 Sun, 01 Sep 2024 10:40:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dmitry Chestnykh <dm.chestnykh@gmail.com>
References: <20240725082703.615109-1-dm.chestnykh@gmail.com>
Date: Sun, 01 Sep 2024 10:40:24 +0200
In-Reply-To: <20240725082703.615109-1-dm.chestnykh@gmail.com> (Dmitry
 Chestnykh's message of "Thu, 25 Jul 2024 11:27:03 +0300")
Message-ID: <87h6azvkav.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v3 RESEND] package/uclibc-ng-test: Fix musl
 build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Dmitry" == Dmitry Chestnykh <dm.chestnykh@gmail.com> writes:

 > Musl doesn't provide sys/asm.h header
 > so we should add some defines inside
 > mips-specific header file to avoid build errors

 > Fixes:
 >  http://autobuild.buildroot.net/results/af7a1d00930485f87f77762b34cae01873a8cd41/

 > Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
 > ---
 > Musl doesn't provide sys/asm.h header.
 > I think no one has enabled this test before for mips musl builds
 > so perhaps this error has only appeared now

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

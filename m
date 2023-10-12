Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7615BCDB482
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 16:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1200E82256;
	Thu, 12 Oct 2023 16:32:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1200E82256
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MWYs9Z888yem; Thu, 12 Oct 2023 16:32:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 651C4821AA;
	Thu, 12 Oct 2023 16:32:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 651C4821AA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 467191BF2F8
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 16:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 201B9402D7
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 16:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 201B9402D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EEG6nVLjy3as for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 16:32:17 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9A2340018
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 16:32:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9A2340018
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F7F41C000C;
 Thu, 12 Oct 2023 16:32:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qqybW-003fza-T1; Thu, 12 Oct 2023 18:32:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Ben Dooks via buildroot <buildroot@buildroot.org>
References: <20230927085823.3477476-1-ben.dooks@codethink.co.uk>
 <87msx4axxw.fsf@48ers.dk>
Date: Thu, 12 Oct 2023 18:32:06 +0200
In-Reply-To: <87msx4axxw.fsf@48ers.dk> (Peter Korsgaard's message of "Sat, 30
 Sep 2023 10:04:59 +0200")
Message-ID: <8734yfajjt.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] board/qemu/aarch64-virt/linux.config:
 enable base ACPI support
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
Cc: romain.naour@gmail.com, Ben Dooks <ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Ben" == Ben Dooks via buildroot <buildroot@buildroot.org> writes:
 >> When testing the virt machine with EDK2, the buildroot 6.1 kernel
 >> will not boot as it has no base ACPI support. Whilst you can run
 >> qemu with the -no-acpi option, it would help if basic ACPI support
 >> was there as otherwise there is no output from the kernel post the
 >> ACPI BIOS initialisation.

 >> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

 > Committed, thanks.

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

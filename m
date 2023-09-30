Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDE6E7735F
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 08:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE1B481D7C;
	Sat, 30 Sep 2023 08:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE1B481D7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7a7fBiVqF6eJ; Sat, 30 Sep 2023 08:05:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23E17817E4;
	Sat, 30 Sep 2023 08:05:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23E17817E4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B2B841BF471
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 08:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8619760E7A
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 08:05:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8619760E7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9IvnjG8h5u73 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 08:05:02 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5416F60E5D
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 08:05:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5416F60E5D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39BBD240002;
 Sat, 30 Sep 2023 08:04:59 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qmUyB-00AKfA-IB; Sat, 30 Sep 2023 10:04:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Ben Dooks via buildroot <buildroot@buildroot.org>
References: <20230927085823.3477476-1-ben.dooks@codethink.co.uk>
Date: Sat, 30 Sep 2023 10:04:59 +0200
In-Reply-To: <20230927085823.3477476-1-ben.dooks@codethink.co.uk> (Ben Dooks
 via buildroot's message of "Wed, 27 Sep 2023 09:58:23 +0100")
Message-ID: <87msx4axxw.fsf@48ers.dk>
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

>>>>> "Ben" == Ben Dooks via buildroot <buildroot@buildroot.org> writes:

 > When testing the virt machine with EDK2, the buildroot 6.1 kernel
 > will not boot as it has no base ACPI support. Whilst you can run
 > qemu with the -no-acpi option, it would help if basic ACPI support
 > was there as otherwise there is no output from the kernel post the
 > ACPI BIOS initialisation.

 > Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947E3C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 21:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E5DF607CC;
	Mon,  3 Jun 2024 21:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLu6f0Th_Bi8; Mon,  3 Jun 2024 21:28:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 578D360A6A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 578D360A6A;
	Mon,  3 Jun 2024 21:28:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7135B1BF2FA
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 21:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D3BA40453
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 21:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ci4Z1mkbwGEI for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 21:28:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 072F9400F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 072F9400F5
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 072F9400F5
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 21:28:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD48820004;
 Mon,  3 Jun 2024 21:27:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sEFDh-004e31-0D;
 Mon, 03 Jun 2024 23:27:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240603115550.699332-1-peter@korsgaard.com>
 <Zl4t_UNUKVRYdYk7@landeda>
Date: Mon, 03 Jun 2024 23:27:56 +0200
In-Reply-To: <Zl4t_UNUKVRYdYk7@landeda> (Yann E. MORIN's message of "Mon, 3
 Jun 2024 22:56:29 +0200")
Message-ID: <871q5dhg2r.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] boot/at91bootstrap: remove package
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2024-06-03 13:55 +0200, Peter Korsgaard spake thusly:
 >> The upstream is no longer available, no defconfigs use it and the package
 >> has been replaced 12 years ago with at91bootstrap3 with commit ca0d69c61cc
 >> (at91bootstrap3: new package), so remove it.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> Config.in.legacy                              |   7 +
 >> boot/Config.in                                |   1 -
 >> boot/at91bootstrap/0001-eabi-fix.patch        | 334 ------------------
 >> .../0002-gcc-4.6.x-ldscript-fix.patch         |  29 --
 >> .../0003-u-boot-relocation-fix.patch          | 284 ---------------

 >     $ ./utils/docker-run make check-package
 >     .checkpackageignore:99: ignored file boot/at91bootstrap/0001-eabi-fix.patch is missing
 >     .checkpackageignore:100: ignored file boot/at91bootstrap/0002-gcc-4.6.x-ldscript-fix.patch is missing
 >     .checkpackageignore:101: ignored file boot/at91bootstrap/0003-u-boot-relocation-fix.patch is missing

 > Applied to master with that fixed, thanks.

Ups, thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

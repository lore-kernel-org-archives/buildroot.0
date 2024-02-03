Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D27CC4828F
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1C2841B77;
	Sat,  3 Feb 2024 18:14:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1C2841B77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QkvDsSEy1e6h; Sat,  3 Feb 2024 18:14:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 355C1417BF;
	Sat,  3 Feb 2024 18:14:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 355C1417BF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D8BF41BF976
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 12:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5666410DC
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 12:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uVtoOOn_ZnS0 for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 12:09:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B64854086D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B64854086D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B64854086D
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 12:09:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84E7360002;
 Sat,  3 Feb 2024 12:09:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rWEqE-009OeZ-3B;
 Sat, 03 Feb 2024 13:09:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
 <20240117225049.28443-11-adam.duskett@amarulasolutions.com>
 <ZaxCNWaYXvkG3Mmv@landeda>
Date: Sat, 03 Feb 2024 13:09:50 +0100
In-Reply-To: <ZaxCNWaYXvkG3Mmv@landeda> (Yann E. MORIN's message of "Sat, 20
 Jan 2024 22:59:17 +0100")
Message-ID: <87o7cxsq9d.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v3 10/10] package/flutter-gallery: clean up
 install_target_cmds
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Adam, All,
 > On 2024-01-17 15:50 -0700, Adam Duskett spake thusly:
 >> Remove and create the kernel_blob.bin file in the flutter_assets directory:
 >> 
 >> When Flutter compiles the source code, it creates the kernel_blob.bin file,
 >> a Dart Kernel Bytecode of the application.
 >> 
 >> If kernel_blob.bin exists inside the flutter_assets directory, then the
 >> application source code can be extracted with nothing more than apktool.
 >> Not only is this a security risk, it's also redundant and a waste of space.
 >> 
 >> Removing the kernel_blob.bin file generated for flutter-gallery saves 86M!
 >> Because this package is a reference package, and some applications may check
 >> if the kernel_blob.bin file exists, we also touch a blank kernel_blob.bin
 >> file.
 >> 
 >> Do not use relative symlinks:
 >> Users may not install their applications in the
 >> /usr/share/flutter/${package_name} directory. Because this is a reference
 >> application, using exact symlinks to icudtl.dat and libflutter_engine.so
 >> is preferable.

 > It was not directly obvious to me what this section meant, so I reworded
 > it, and introduced a bad typo... At least I could only spot one...
 > Sorry... :-(

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

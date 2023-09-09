Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0494EEB580
	for <buildroot@archiver.kernel.org>; Sat,  9 Sep 2023 15:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C607400DF;
	Sat,  9 Sep 2023 15:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C607400DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vnPP_hH_6SbO; Sat,  9 Sep 2023 15:08:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09C5A40288;
	Sat,  9 Sep 2023 15:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09C5A40288
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 686F41BF34E
 for <buildroot@lists.busybox.net>; Sat,  9 Sep 2023 15:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02D8681D4D
 for <buildroot@lists.busybox.net>; Sat,  9 Sep 2023 15:08:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02D8681D4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3jELLvmT1PeX for <buildroot@lists.busybox.net>;
 Sat,  9 Sep 2023 15:08:13 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA19C81CDC
 for <buildroot@buildroot.org>; Sat,  9 Sep 2023 15:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA19C81CDC
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9B89FF804;
 Sat,  9 Sep 2023 15:08:09 +0000 (UTC)
Date: Sat, 9 Sep 2023 17:08:09 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230909170809.4d0fb384@windsurf>
In-Reply-To: <20230909104707.491203-1-ju.o@free.fr>
References: <20230909104707.491203-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694272090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KwavQMyhLqWgspJwUXKC/KjV/vXK03uFPwMaukc15sM=;
 b=OF5o2QoAnLG1IQ+G2IoJzpxPNbxwCOnZFlMInJawxUBrhqFLjReIQZP/+7lYWZhDZJinxm
 67o0TDEoDpv+1ci2rMyZXNw2dElJxkFybaQ4T6uq/FKKLdQPjjJGryqjW7qHL7utAhcTSL
 pNJRx5anNNn8I9CmFEOTo3A1zW2wRzb22Dnl5snUPBrWmW2h48B9N7ZuPHz7BrR4Gsnc9j
 9ClkaD/17XsGviiQpEjEZUkgEDz153D2u3yyCI5wzFzGSqNPVAeY9ODyS24qJmMdPVoH7W
 7nht63avusSPEsZTMEkOQtM7/y6LKRmArrUoIMgT2NHTLU/dVHqjzMdOPuUcTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OF5o2QoA
Subject: Re: [Buildroot] [PATCH 1/1] package/zynaddsubfx: fix uclibc compile
 error
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Julien,

On Sat,  9 Sep 2023 12:47:07 +0200
Julien Olivain <ju.o@free.fr> wrote:

> When compiling with uclibc, build fails with errors, such as:
> 
>     In file included from /build/zynaddsubfx-3.0.6/src/Nio/NulEngine.h:21,
>                      from /build/zynaddsubfx-3.0.6/src/Nio/NulEngine.cpp:14:
>     /build/zynaddsubfx-3.0.6/src/Nio/MidiIn.h:37:9: error: 'uint8_t' does not name a type
>        37 |         uint8_t midiSysEx(unsigned char data);
>           |         ^~~~~~~
> 
> This commit fixes the issue by adding upstream patches, not yet
> included in a release.
> 
> Fixes:
> http://autobuild.buildroot.net/results/97b5a30c7be820ac91e745cf60f9b759e962aa5c
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Since when is this build issue occurring? zynaddsubfx has been in
Buildroot for a while, and I don't see any recent update of it. Have
this issue always existed? Is it due to a recent update of uClibc?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

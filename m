Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B625DC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 08:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A58A40141;
	Fri,  5 Jan 2024 08:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A58A40141
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yIcyxcjCyHWT; Fri,  5 Jan 2024 08:42:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58BDA43553;
	Fri,  5 Jan 2024 08:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58BDA43553
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B402B1BF30D
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 08:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99349420A7
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 08:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99349420A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ASiUbIPbGuP for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 08:42:35 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B83A420A4
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 08:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B83A420A4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E5D240004;
 Fri,  5 Jan 2024 08:42:32 +0000 (UTC)
Date: Fri, 5 Jan 2024 09:42:31 +0100
To: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Message-ID: <20240105094231.318fd50f@windsurf>
In-Reply-To: <20240104171224.1469776-1-abrodkin@synopsys.com>
References: <20240104171224.1469776-1-abrodkin@synopsys.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704444152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SndVw+u3Ts4wF9oBW8HciDClVmyGqIZ0wenXQoj+hTU=;
 b=W0IH2ddfAXFVkjYg0vfkxxWw18SjgahXCd3XDSHLtNzRCBzTPRSp806ArjEOQYZaLlbrot
 D97P8rpPUJZgxsP4wzoOo/092XE7/hdMYiMWxuuxc1XoZ+Uwnw0b5CmSZWg5gzTk+5j85I
 UnBB7NUCMF9kDnTtaEOZSPHtKOfDLm6U2qJseDbPW6kN21fSwzSySRO1XtlKjHpfns0PK3
 o3MnWg7MxLGrsFwABguNMwNO5QXa9so4Hm6KO2KeXWbaoXUOvhAy+6YAe7dgYOvAQwTABQ
 w+HUb7rOPVJyDLjFhPrahQbNvO+tgE0GTVXSNG7DU7qJX0ztc8rEhGcfCduKGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W0IH2ddf
Subject: Re: [Buildroot] [PATCH] ARC: Switch toolchain components to
 arc-2023.09-release
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Waldemar Brodkorb <mail@waldemar-brodkorb.de>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alexey,

On Thu,  4 Jan 2024 09:12:24 -0800
Alexey Brodkin via buildroot <buildroot@buildroot.org> wrote:

>  .../0001-poison-system-directories.patch      | 310 ------------------

You removed this patch without re-adding it for the new ARC toolchain
version. When reviewing it, I thought: "but in fact, the other system
directory poisoning patches in binutils are useless, because we are now
doing this in the toolchain wrapper" and I even went all the way to
writing a patch to remove those binutils patches.

Except that binutils tools are not wrapped by the toolchain wrapper
(only gcc/g++/etc. are), and this is why we have kept the system
directory poisoning patches on binutils.

Therefore, could you re-add this system directory poisoning patch for
the ARC-specific binutils version, so that we have something that is
aligned between binutils versions?

It should be as easy as taking the binutils patch from the
corresponding binutils version.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E69C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 21:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9334C416E6;
	Wed,  1 Nov 2023 21:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9334C416E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id srwdv2EqrR5V; Wed,  1 Nov 2023 21:54:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01B2E431C9;
	Wed,  1 Nov 2023 21:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01B2E431C9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D72F1BF335
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 167F24EECC
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:54:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 167F24EECC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ciksDqrOQ3hS for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 21:54:26 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 135B94EEC9
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 21:54:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 135B94EEC9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 393DA60002;
 Wed,  1 Nov 2023 21:54:24 +0000 (UTC)
Date: Wed, 1 Nov 2023 22:54:23 +0100
To: <yann.morin@orange.com>
Message-ID: <20231101225423.2412f034@windsurf>
In-Reply-To: <5f5d6e6dbfc89ca509f3d73154d7e31d1b6659b5.1698759638.git.yann.morin@orange.com>
References: <5f5d6e6dbfc89ca509f3d73154d7e31d1b6659b5.1698759638.git.yann.morin@orange.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698875664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zw6vkAKOfrGsQ7H89HJe1MsTVsGZ+u1/WPvliS+e8qc=;
 b=U51TS82k/J7tPpjiauiBTBBgdhQ1T4DVN4XC7jK2T6nDv548L8QPISjZ5/K4CPm6FDHIxz
 MKHjAlHY23AApi/N6qWhQS6vwOLneiABWoumBWLbwGlo4f77ldoJbXunxaITwGHxGix9cp
 uenUTaAkXp0iPMaKSOknHDg3yk2vSRPunbWdl+wp3Z0jrsjZoT73/UURyRw4XHe1znkzfo
 dbU9nD0n3HJ+sA9ukOcqv1Z4HrBEdSFcWbTFruPpkV1SllPqcsiQ4em3e7geQPN3fwBbsN
 SFVHTDq6lKal2GsPop4uq4SMOX26rbdSyBYQw5dLPVCiQ5SpFnoKH8SJTfeH+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U51TS82k
Subject: Re: [Buildroot] [PATCH] .editorconfig: add editor-agnostic
 configuration
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

On Tue, 31 Oct 2023 14:40:38 +0100
<yann.morin@orange.com> wrote:

> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> EditorConfig [0] is an editor-agnostic configuration file, to set
> preferences on how to edit text: tabs vs. spaces, tab width, indentation
> size, line endings...
> 
> A large number of editors support EditorConfig, either natively [1] or
> with the help of plugins [2].
> 
> Add a basic .editorconfig that provides defaults for most of the files
> used by Buildroot. More can be added in the future if we can find more
> matching patterns.
> 
> The values are chosen a bit arbitrarily, unless we already have a
> (un)written rule about it. Notably, indentation defaults to using 4
> spaces, and only a set of files for which we require TABs (Makefile,
> essentially) or have already settled for TABs (Kconfig files, init
> scripts...) are configured so. The traditional width of TABs is 8 char,
> and we pair TAB indentation with TAB size.
> 
> Trailing spaces are usually useless, except in asciidoc source where
> they can be used to force a new line without a new paragraph.
> 
> One of the limitations of .editorconfig, tough, is that it matches on
> filenames (e.g. *.py), not on the content (e.g. no use of mimetype, or
> libmagic, or such). Still, this is enough to cover a lot of files in
> Buildroot.
> 
> [0] https://editorconfig.org/
> [1] https://editorconfig.org/#pre-installed
> [2] https://editorconfig.org/#download
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> ---
>  .editorconfig | 29 +++++++++++++++++++++++++++++
>  DEVELOPERS    |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644 .editorconfig

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

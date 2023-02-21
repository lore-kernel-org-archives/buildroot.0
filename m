Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6F1C636D7
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 22:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AE6E81F9C;
	Tue, 21 Feb 2023 22:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AE6E81F9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wCmK5pFNTCnP; Tue, 21 Feb 2023 22:02:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35EDB81341;
	Tue, 21 Feb 2023 22:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35EDB81341
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 841401BF39F
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 22:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B27C41866
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 22:02:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B27C41866
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mIQlWa5KzFqV for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 22:02:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA7034185E
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA7034185E
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 22:01:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0943B100006;
 Tue, 21 Feb 2023 22:01:56 +0000 (UTC)
Date: Tue, 21 Feb 2023 23:01:55 +0100
To: AndreiCherniaev <cherniaev.andrei@kairo.space>
Message-ID: <20230221230155.0e21a186@windsurf>
In-Reply-To: <20230109073353.11701-1-cherniaev.andrei@kairo.space>
References: <20230109073353.11701-1-cherniaev.andrei@kairo.space>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677016917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tl/EZ5/tXxYkYXdwD47MpHswGYZdkDlOb8DtXKIX8Gs=;
 b=gGbyGXaoK/eMH2uVZLUTCSHGhJzBXuqdpriOxbtcRJMOJEc98B5nQL0gYgau9XPoLkTnIM
 sMnz3mj4YAAu4+J2h8caRpkyA/bKbJQI+tdofMcedXu1p7SDIPywUkU+xNr2/U8Fxy5YXx
 n67feRVfQwxAQ8AG46degWxbw2emHmNyBw8k1vrrPZMg/o3oXG8SuSGCbjhB3/KMdBUIzK
 9uWx3e3fEj0ldZSJgoTAj4HCBFhXx3WnbZYvw5fCYlnVJsXL0DiCczq4vFGJNTWtxrFD4H
 o7ZeWFIO0cfTuXOUtO+ZHCDhyYnYpNh0W35GVacIljYXxBJCnPm1PP1Ufwzfag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gGbyGXao
Subject: Re: [Buildroot] [PATCH] boot/grub2: add information where is
 configuration file
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

Hello Andrei,

On Mon,  9 Jan 2023 16:33:52 +0900
AndreiCherniaev <cherniaev.andrei@kairo.space> wrote:

> diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
> index 92b5dd501b..bf0400c08f 100644
> --- a/boot/grub2/Config.in
> +++ b/boot/grub2/Config.in
> @@ -125,6 +125,7 @@ config BR2_TARGET_GRUB2_BUILTIN_CONFIG_PC
>  	  into the Grub image itself. This allows to set the root
>  	  device and other configuration parameters, but however menu
>  	  entries cannot be described in this embedded configuration.
> +	  Use boot/grub2/grub.cfg to edit menu entries.

Actually no, you probably don't want to change boot/grub2/grub.cfg: it
is part of Buildroot itself, and you probably don't want to have
project-specific changes in there.

Instead, you should override it using a rootfs overlay (if grub.cfg is
in $(TARGET_DIR)/boot) or a post-build/post-image script (if it's in
the EFI partition).

I have nevertheless applied your patch, but after tweaking the message
in the help text, and moving it to the main Grub2 option. See:

  https://gitlab.com/buildroot.org/buildroot/-/commit/7692d5beb2d9e4d0b463f0f26a177829e5bcc1ec

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

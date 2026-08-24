Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57108C5DF81
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 20:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0295680D29;
	Mon, 24 Aug 2026 20:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l6Ol_Mn5JpmR; Mon, 24 Aug 2026 20:56:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787604992;
	bh=gZFf4fx8n/uRPXRT54XdalIvvv24y/ZgIiFpKhvefM8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ATH2feQSv+jwc8MpA9mCBtxprX4sMDLgBQ+IKlkQGkuw9dBraw1cWd53bSNEIjzL4
	 SB35z2Ipq2nnaekNXavE8HHYDuNE5+g5Z6GDA+/l4p9UlKTbaE9o6C48I+jS62l+n2
	 dcwS00gbhQxOXbApp23OL7l6AYF6olcwyy/J87viNdO/gi0GhElrpTtIY1qcunm4C3
	 eJevek+9TeEIZEskdFyubvq9aadKmJICORNRk44dA0r5HAfqwrHOICq/SqxfDYWQrg
	 t5SRY80GKs6kIIzXYA3IM+OCgs4kCwBRnKLwWw78lJ/jb2OfnflVztJ0RItsQokeZb
	 hwLSfx/GYTkvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 103F480D09;
	Mon, 24 Aug 2026 20:56:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60AE7118
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 20:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46C0040083
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 20:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id edFhXe7pYI2M for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 20:56:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DB9C4004C
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 20:56:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 911DB4E4137D;
 Mon, 24 Aug 2026 20:56:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 603A15FFC1;
 Mon, 24 Aug 2026 20:56:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8354011C79C01; 
 Mon, 24 Aug 2026 22:56:19 +0200 (CEST)
Date: Mon, 24 Aug 2026 22:56:18 +0200
To: Ronan Loftus <rlf42@posteo.net>
Cc: buildroot@buildroot.org
Message-ID: <aoyvkaV1_UeTRjrl@windsurf>
References: <20260719031547.3512747-1-rlf42@posteo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260719031547.3512747-1-rlf42@posteo.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/readline: propagate CONF_OPTS
 to host build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Jul 19, 2026 at 03:16:04AM +0000, Ronan Loftus wrote:
> --with-shared-termcap-library is only applied to the target readline
> because CONF_OPTS is not inherited by the host variant. The resulting
> host libreadline.so.8 has no DT_NEEDED on ncurses/tinfo, leaving
> termcap symbols (UP, BC, tgetent, ...) unresolved.
> 
> With recent binutils (--no-copy-dt-needed-entries), any process
> loading this libreadline via LD_LIBRARY_PATH fails at startup. This
> breaks fakeroot-based rootfs generation when host-gdb (which pulls
> host-readline) is selected:
> 
>   /bin/sh: symbol lookup error: .../host/lib/libreadline.so.8:
>   undefined symbol: UP
> 
> Reproduced on Arch Linux (gcc 16.1.1, binutils 2.46.1).

Could you provide some detailed reproduction instructions? I did a
build of host-gdb in an Arch Linux container, and the resulting gdb
binary runs just fine... apparently because it is itself directly
linked with libncurses.

> diff --git a/package/readline/readline.mk b/package/readline/readline.mk
> index f69cbe45..8c49fab8 100644
> --- a/package/readline/readline.mk
> +++ b/package/readline/readline.mk
> @@ -15,6 +15,7 @@ READLINE_CONF_OPTS = \
>  	--disable-install-examples \
>  	--with-curses \
>  	--with-shared-termcap-library
> +HOST_READLINE_CONF_OPTS = $(READLINE_CONF_OPTS)

We don't want to do that, we really want a separate
HOST_READLINE_CONF_OPTS, even if today it will carry the same value as
READLINE_CONF_OPTS. There is in general no reason for the host and
target variants of a package to share the same configuration options.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

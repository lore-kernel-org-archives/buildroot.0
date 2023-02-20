Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8585CC6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D069822D0;
	Mon, 20 Feb 2023 20:50:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D069822D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VYn_fMgiUsJG; Mon, 20 Feb 2023 20:50:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BAA9822C2;
	Mon, 20 Feb 2023 20:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BAA9822C2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E65F91BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C07B34010E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C07B34010E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZJevBVqfzTM2 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:50:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5004E400AF
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5004E400AF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:50:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C204210000A;
 Mon, 20 Feb 2023 20:49:59 +0000 (UTC)
Date: Mon, 20 Feb 2023 21:49:58 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20230220214958.19d88af8@windsurf>
In-Reply-To: <87edqkz1yv.fsf@dell.be.48ers.dk>
References: <20230220090923.2155635-1-thomas.devoogdt@barco.com>
 <20230220090923.2155635-2-thomas.devoogdt@barco.com>
 <87edqkz1yv.fsf@dell.be.48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676926200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xnqQfRunjdc6xxAKSzifYLbCgmFLEeZitYLqyxELgMc=;
 b=gaDhCRmT65mkgTkFJfcPTv+Ae7FM9/bZOHqiyzIA0KY+5f5CPZPt7SKjwl3HGE7nGhKdno
 4cjWJd0NNChwgnuztBjOi1k3RrzcXzkVm8KbOUDflW8oW89CVqsOKOssHkX3X/o6riggtu
 t9jHlIR9668Q9Jb7sCyfCJ1RrVj7jbqXOK+AG3aDTuONeDUM0YfJF+EpFJ4VTYFpnflwGd
 oskjvX+EFS6fORmo88i73BjMP7lXF+jhv8ZyKuJGwBYO6sEYE0H5yCoH6/IdtEkCxU8r0e
 XCmPK6t6RVX8jpJQgcnmGMQ28zKIj7V7Uly4Q7DAGcOyJQ2188Ym+zi8SvBaGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gaDhCRmT
Subject: Re: [Buildroot] [PATCH v1 2/3] package/libgtk3: re-enable atk-bridge
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org,
 Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 20 Feb 2023 18:22:16 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> at-spi2-core depends on xorg7 / xlib-libXtst, so that would mean that we
> would pull that in even for libgtk3 builds with the broadway/wayland
> backends, is that sensible?
> 
> Maybe it is? Does at-spi2 work under wayland?

Please note that we also have a series that removes atk, at-spi2-atk,
and bumps at-spi2-core, which now replaces both atk and at-spi2-atk:

  https://patchwork.ozlabs.org/project/buildroot/list/?series=336254

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

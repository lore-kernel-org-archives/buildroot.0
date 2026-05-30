Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27B3CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98C0942BBC;
	Sat, 30 May 2026 13:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PcnZo8iNQdWO; Sat, 30 May 2026 13:21:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9E2F42D48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780147318;
	bh=QPFHKLEQs8iwoXEikxhEGsM1DniieZJhqQuPR/WtjCY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oKfNGeNKhTa1EkvRzrkJk/ZXjS4WngeQvqKWpsk3IyD88pJF18T3sPUsXWLjokkeB
	 ednknRrQMGDOh+xQdW2s4+yLsYLsZyVxaALQYMM+yBK3DlSP8bX87RLiy/9WSRtMiX
	 N/GV99IZakVnsGLERiymCbU3VgoFy0U7QN6viCkYMoyf5zgwbY/OQmyI55A6Zt2mB6
	 PYj4HM64h/qzZhtgxUNxjYSi7HsRaxGIvTyV+4MrYT0fBECehrlawiuaOGv+pn6B9U
	 uIPkn6DFfD+3ZnmiEaG1/keP1RS5VL5TZIZB8azWL+BtVw3eio6TkgsW1/Gxv0ndPv
	 OrY1By9ihlzyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9E2F42D48;
	Sat, 30 May 2026 13:21:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ED0A7D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA45B42BBC
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ar9170iPnMtL for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:21:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0BB2240909
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BB2240909
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0BB2240909
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:21:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E611D4E42DA2
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:21:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A0F196073B;
 Sat, 30 May 2026 13:21:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B127510888650; 
 Sat, 30 May 2026 15:21:52 +0200 (CEST)
Date: Sat, 30 May 2026 15:21:51 +0200
To: Christopher Obbard <obbardc@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <ahrkGO9sQOwRDDkB@windsurf>
References: <20260420-wip-obbardc-add-package-dtui-v4-1-5be457a32cce@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260420-wip-obbardc-add-package-dtui-v4-1-5be457a32cce@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780147313; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=qZ1JFzsBluwWvKsBCaanuiB2YWs5vweyyvfFZ2+sQgI=;
 b=f7KnFYwTb7nv8Blgvb0WBCLq2gJVKcmhACL2dAWIyr9IVaXA2E8oalRIbyPwPxjybDEnAR
 ZTrUxyVuqS09VMyEGyLYg9QSYHp+L9C4cqSf0vVeO/HYc8R3fAqk6qJ5qArcMeYfSzvLgO
 x7OFVaKEEKmVdrB5/vNbVQye8vFEnSZjI93n6Ng+XPDoLW/GklemPrphhRcbqVnjHTK4cw
 2i/21efWbTqP3AjfDUehXWmhpquz1U43Bg3XGcGTByGphi/7JJO9Tee9JncGVGMZU+220c
 FGgfXCI7fW6pAFYiEAx50O+pxG9WAvxOxQB9YFaSYtDE7S8spZaTFh9BELzV/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=f7KnFYwT
Subject: Re: [Buildroot] [PATCH v4] package/dtui: new package
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

Hello Christopher,

On Mon, Apr 20, 2026 at 02:51:33AM +0100, Christopher Obbard wrote:
> DTUI is a small TUI for introspecting the state of the system/session
> D-Bus. It shows current services and lets you introspect objects and
> their interfaces.
> 
> This package is built with Rust/Cargo.
> 
> Upstream: https://github.com/Troels51/dtui
> License: MIT
> Signed-off-by: Christopher Obbard <obbardc@gmail.com>

Thanks for your patch, which I have (finally!) applied. Some comments
below.

> diff --git a/package/dtui/Config.in b/package/dtui/Config.in
> new file mode 100644
> index 0000000000..524407d272
> --- /dev/null
> +++ b/package/dtui/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_DTUI
> +	bool "dtui"
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
> +	depends on BR2_USE_MMU # dbus
> +	select BR2_PACKAGE_DBUS

I annotated this one as a runtime dependency:

  select BR2_PACKAGE_DBUS # runtime

> +	select BR2_PACKAGE_HOST_RUSTC
> +	help
> +	  dtui is a minimal TUI for introspecting the state of the
> +	  system/session D-Bus. It shows current services and lets
> +	  you introspect objects and their interfaces.
> +
> +	  https://github.com/Troels51/dtui

Here, you forgot to add a comment about the threads dependency:

+comment "dtui needs a toolchain w/ threads"
+       depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+       depends on BR2_USE_MMU
+       depends on !BR2_TOOLCHAIN_HAS_THREADS

> diff --git a/package/dtui/dtui.hash b/package/dtui/dtui.hash
> new file mode 100644
> index 0000000000..18ed484f44
> --- /dev/null
> +++ b/package/dtui/dtui.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  8ccdf97b0b9e949cff11abf0ed505a409bd04f52161a782707ab15b94f622efb  dtui-3.0.0-cargo4.tar.gz

I had to update the hash because we're now at -cargo5.tar.gz (it got
changed since you posted your patch).

Thanks a lot for your contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F9BC3DA6E
	for <buildroot@archiver.kernel.org>; Thu, 28 Dec 2023 08:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C7EF610AF;
	Thu, 28 Dec 2023 08:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C7EF610AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L_sw3yHUgVbX; Thu, 28 Dec 2023 08:51:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AADF610AE;
	Thu, 28 Dec 2023 08:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AADF610AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 70AD81BF41F
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 08:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 564C1418C4
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 08:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 564C1418C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z1bfG9mzvYyG for <buildroot@lists.busybox.net>;
 Thu, 28 Dec 2023 08:51:29 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98348418C7
 for <buildroot@buildroot.org>; Thu, 28 Dec 2023 08:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98348418C7
Received: by mail.gandi.net (Postfix) with ESMTPSA id C197EC0008;
 Thu, 28 Dec 2023 08:51:23 +0000 (UTC)
Date: Thu, 28 Dec 2023 09:51:21 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231228095121.5255f937@booty>
In-Reply-To: <20231227181756.156827-1-bernd@kuhls.net>
References: <20231227181756.156827-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703753486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bm7Iprkdr7hnmX+b2Is9NmSz5uIHID6FDgSz/f/azq0=;
 b=Xre8fUA6CBLlK+MEXbMbBMs38o4wUm/abojI0Bt4zrr+Hesw4wBB12hkucpeHZ5asIB6oi
 +TZXfsNcV58UATLuPVtlV9xjfYUW2RBr5GvY2BQqtFMezIujk4HSR/HxKHjCsP6Om8nGKO
 1J59c8xIQQW+4Abm5s8TIVGclIpG9PlhHJKE9YRJiauSRsjhQR3FFkSRJlmfgXrGRrhsbL
 Ir3FkQT8d6AcHpySNHTaOj73kIoisUGmUe7zqXI3bjLox2Nk3QFXQW/vJzrP0xFQMRRkar
 pxisdHORaC+Yw6XFD5UEOdyusGqPVO+8Ofujb9gvW9nzrxXNPzd0A1+/OqTNDw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Xre8fUA6
Subject: Re: [Buildroot] [PATCH 1/2] package/exim: fix build with libexecinfo
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Wed, 27 Dec 2023 19:17:55 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Upstream added optional support for execinfo
> 
> https://git.exim.org/exim.git/commitdiff/204a7a2c2e8601558905dc34c576a627045a9f21
> https://git.exim.org/exim.git/commitdiff/48ea675fee2d5fee8d33c525e28727b69114cfce
> 
> in version 4.97 which was added to buildroot with commit
> faec3ca30e358575f70a036879029f63f7da9b29
> 
> Fixes:
> http://autobuild.buildroot.net/results/282/282882371e1d8c224c457bf65016f8abd11f8c45/

Thanks for taking care of the build failures!

> @@ -126,6 +127,15 @@ ifeq ($(BR2_STATIC_LIBS),y)
>  EXIM_STATIC_FLAGS = LFLAGS="-pthread --static"
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
> +EXIM_DEPENDENCIES += libexecinfo
> +define EXIM_EXTRALIBS
> +$(call exim-config-add,EXTRALIBS,-lexecinfo)
> +endef
> +else
> +EXIM_C_FLAGS = -DNO_EXECINFO
> +endif

I think this logic is not entirely correct. As I read it:

 * on non-glibc systems it automatically enables the new exim
   stack dump feature if libexecinfo is enabled
 * on glibc systems, which always have the backtrace() and related
   functions without additional libraries, we never enable this feature

For consistency, the else branch should just be removed to avoid
setting NO_EXECINFO, thus enabling the stack dump feature whenever it
is possible.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5D0C2BB41
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 10:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33E1D81D4F;
	Tue, 16 Aug 2022 10:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33E1D81D4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sc_b4vpUI1-f; Tue, 16 Aug 2022 10:01:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3684481CDB;
	Tue, 16 Aug 2022 10:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3684481CDB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CAEB1BF2C8
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 10:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D666981CDB
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 10:01:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D666981CDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P70LkSucf2fd for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 10:01:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6609B817AF
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6609B817AF
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 10:01:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 059D31C0008;
 Tue, 16 Aug 2022 10:01:10 +0000 (UTC)
Date: Tue, 16 Aug 2022 12:01:09 +0200
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20220816120109.1a348d39@windsurf>
In-Reply-To: <20220816094829.377-1-guillaume.bressaix@gmail.com>
References: <20220816094829.377-1-guillaume.bressaix@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660644071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Cc+cSRyALt/BHNsGzC9hfn1+g0RIkjQA1RBdxMjGZc=;
 b=hbNIsYBn1ldEpb4uv/CUZ3DBT3dlL7ku6G0mZoA6kuoYo3f3dFwCEXSo6JCpaHggz2Zwfo
 rkXvTTUd7PQ1MJ0W1DoAAMkbBdmsJfL5kqoIABxUccHgO7n34JAMJMx+QCeF1nhlAc+TL7
 JMKqQZtAeMzGZML3lyvwTovkjUeRUEB15Tugv7B26VBu11hmbCHPLeHuQ0VC8OAykYMTDY
 /lV8UVN9q9kzOWrwYT8yh0r+z/Cm9uSVK3oO7QKMwAwLrX/3+BZLkoyls7fL17PGjCHoXO
 Xcvbb+mAAhoxB1zFyJB8Mr0wEdVOp9BkfGr+s9uMvbwWzbBCC4hxZPxqT7A7Ig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hbNIsYBn
Subject: Re: [Buildroot] [RFC 1/1] package/pkg-meson.mk: handle possibly non
 existing compilers
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
Cc: buildroot@busybox.net, Yann Morin <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 16 Aug 2022 11:48:29 +0200
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> To avoid populating the cross-file with non existing compilers,
> we tie them to /bin/false
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
> I only managed the CXX and FC case,
> assuming all the other ones are always there ?
> ---
>  package/pkg-meson.mk | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index 0632ab21cf..f246a126d1 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -68,15 +68,29 @@ else
>  PKG_MESON_TARGET_CPU_FAMILY = $(ARCH)
>  endif
>  
> +# To avoid populating the cross-file with non existing compilers,
> +# we tie them to /bin/false
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_CXX),y)

This is not correct as this boolean only makes sense when using an
internal toolchain. You should use BR2_INSTALL_LIBSTDCPP (yes, I know
the name is crappy, but it's historical).

> +PKG_MESON_TARGET_CXX = $(TARGET_CXX)
> +else
> +PKG_MESON_TARGET_CXX = /bin/false
> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_FORTRAN),y)

This should be BR2_TOOLCHAIN_HAS_FORTRAN

> +PKG_MESON_TARGET_FC = $(TARGET_FC)
> +else
> +PKG_MESON_TARGET_FC = /bin/false
> +endif

Now, the annoying question: should this be done in pkg-meson.mk, or
should we do it more globally, i.e define TARGET_CXX and TARGET_FC to
correct values only when C++ or Fortran are supported.

Yann, what do you think? Did we ever try to have TARGET_CXX=/bin/false
and TARGET_FC=/bin/false when there is no C++/Fortran support?

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

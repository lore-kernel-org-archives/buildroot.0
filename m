Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A03FC05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 19:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C307C402D2;
	Wed,  8 Feb 2023 19:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C307C402D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 122RwsUvRyDz; Wed,  8 Feb 2023 19:33:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BFD9402BE;
	Wed,  8 Feb 2023 19:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BFD9402BE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 92CA01BF2FE
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 19:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CA91402BE
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 19:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CA91402BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yeQc99eo8yji for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 19:33:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E09B402B5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E09B402B5
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 19:33:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 03E441BF206;
 Wed,  8 Feb 2023 19:33:25 +0000 (UTC)
Date: Wed, 8 Feb 2023 20:33:24 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230208203324.4ccd9dba@windsurf>
In-Reply-To: <20221214151958.3419333-1-james.hilliard1@gmail.com>
References: <20221214151958.3419333-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675884806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SN4rxpdh9YWvNGSLngSdC9eEIwqDvRp5yfJaKbZp9vQ=;
 b=R7176iEz2oxItlEz3zR5ezd9VZp7C5c4Ruz8IDWe8+F0bGSMIaVzwKHLpks/HCM9uW0tMP
 D1LlrirUKanBW9s0+Aw4TPFviXgyzE4PrpEGBHtQAXTbhEGdMhJwDLhTo+mEcjqpSV/sCh
 Hmti8MJfsC6uSMzseR/hT66Gk8EX45TeL+McExvLJ+4IgY8f2rXdIpyrK3Dpdy+NrrETx5
 FrzbLnVkobHVF8lR+37IDl0JZZuxYy267OHvJulcN7jkkAiQBQjhILfNafShJWd+m8mgRW
 9izvy6V957XZntTgyERdJpUFz9RGdJVMHCyFKxI7fkChT+XLO5KSnr2QU/8wzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R7176iEz
Subject: Re: [Buildroot] [PATCH v2 1/1] package/weston: bump to version
 11.0.1
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Thanks for the patch. It overall looks good, but I have one
question/comment.

On Wed, 14 Dec 2022 08:19:58 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> @@ -73,7 +84,9 @@ config BR2_PACKAGE_WESTON_RDP
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_USE_WCHAR # freerdp
>  	depends on BR2_INSTALL_LIBSTDCPP # freerdp
> +	depends on BR2_PACKAGE_XORG7 # freerdp-server

It feels really odd that we need to build half of the X.org planet to
have RDP support in Weston. Is this dependency really needed? Isn't
that something "wrong" in the freerdp package that should be fixed?

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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF693C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 14:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 248A340FEB;
	Fri,  9 Dec 2022 14:50:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 248A340FEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fVuE-NYkPGWh; Fri,  9 Dec 2022 14:50:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E94E40FD1;
	Fri,  9 Dec 2022 14:50:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E94E40FD1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F065C1BF30F
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 14:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7E4060F3F
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 14:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7E4060F3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XBbyC6u--PQq for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 14:50:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6204560F31
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6204560F31
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 14:50:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DCA93240016;
 Fri,  9 Dec 2022 14:50:06 +0000 (UTC)
Date: Fri, 9 Dec 2022 15:50:05 +0100
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Message-ID: <20221209155005.48a59bf8@windsurf>
In-Reply-To: <1670579823-1721-1-git-send-email-gwenj@trabucayre.com>
References: <1670579823-1721-1-git-send-email-gwenj@trabucayre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670597407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9NWoAEy/+tT2EHIv4ZE3mkC82c6GvEd26OAglX/aGQY=;
 b=nx0JLJ+T3cosysS45NrwkbCos1sgAcJJ8Di0LEJCt1pCKlTKdZaGxbTeNvZI+dOJoGMSAg
 ZK7d2gaEGRxi7GG8+4lKELh2FnyTDjsC1o6q+AGGOG526pSVs3BOc2Ljk1RUkE4BzMzpTP
 aNcw0RH6w9rvm8eIlsZELYb5XD1gX9Jn5oF0616IsqEl3OeucpHzUgxL2qxvOBDO4GQu/F
 DL09FZtaMEHQC2X5InYyEPc6iFwvGk1IYsXbLlpLZzjvAaLxtKad3ZnTlx3delLwTtMyzJ
 9tl6LHXqfox6XPeQZ3LUVvNt0coO3viUYPHL1leK3BsV26j3/EVcbsGVDWOd+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nx0JLJ+T
Subject: Re: [Buildroot] [PATCH] package/gnuradio: restrict gcc to >= 9.3.0
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  9 Dec 2022 10:57:03 +0100
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Since commit 5a15095f65c655356989c91e52da1746cd96f41b gnuradio requires
> gcc >= 9.3.0
> 
> This patch add this dependency and removes BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> dependency because it is only required for gcc < 7.
> 
> Also gcc restriction is required because volk needs a toolchain with a gcc > 7.
> 
> fix:
> - http://autobuild.buildroot.net/results/6a82605c58f9ef9eb6c14603777dd8523dd00aa5/
> - http://autobuild.buildroot.net/results/c7c4ae76954e388ab639b39fd521d90acfe4edc9/
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/gnuradio/Config.in | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
> index de19732cfb..2028cfb483 100644
> --- a/package/gnuradio/Config.in
> +++ b/package/gnuradio/Config.in
> @@ -4,10 +4,13 @@ comment "gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library"
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>  		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
>  
> -comment "gnuradio needs a toolchain not affected by GCC bug 43744 and 64735"
> +comment "gnuradio needs a toolchain not affected by GCC bug 43744"
>  	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_43744
>  	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735

You're not really removing it here :-)

> +comment "gnuradio needs a gcc >= 9.3.0"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9

This should be in the main Config.in comment:

comment "gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library, gcc >= 9"

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

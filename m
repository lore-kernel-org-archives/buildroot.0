Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63929C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 04:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5D9960BE8;
	Tue, 17 May 2022 04:35:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id llKmkC78gK8e; Tue, 17 May 2022 04:35:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C32D960B6A;
	Tue, 17 May 2022 04:35:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B09D1BF2A3
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 04:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8840283DF3
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 04:35:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x0ktW5qXCMHf for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 04:35:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BDC483DF2
 for <buildroot@buildroot.org>; Tue, 17 May 2022 04:35:50 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id A866744042A;
 Tue, 17 May 2022 07:34:41 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1652762081;
 bh=hASFKQNgynGpPlIs6wzokUQUPDCuFIvTy+BzE3a7xKM=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=Pszz8dHXMuVf65yFJL9WM/3YD0BD7M8AkC7YvWHZTwzYXrX0UvecGEgX/bKBpY0WO
 gek4G7k8v93FZJRibIml4Y0S1D8o8mKS6R3/UVEe+5Ly2v9SLEtf0Zc0HrO1EWjJh+
 CHc5cz26lyOrifSP1955xxo8deVze11XlOS8mUteDdKATanitXbsrSreHdaSJsyMCv
 adrSc8IdRk4iK22iSD3zmrKX96Bw8SNv8AuPnwuYdV4P0udu7jNCNUZgRKEyFhX5Ii
 chX60hqAx9T02hZZYtCc0BUxVQTQq3UZjKIST1EEi4RZMZ51HxPM2Pz0b02CaVqvrU
 x+bjrFXbYoWxQ==
References: <20220516224655.15730-1-flatmax@flatmax.com>
User-agent: mu4e 1.6.10; emacs 27.1
To: Matt Flax <flatmax@flatmax.com>
Date: Tue, 17 May 2022 07:34:17 +0300
In-reply-to: <20220516224655.15730-1-flatmax@flatmax.com>
Message-ID: <87o7zwzsgt.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [RESEND PATCH v2 1/1] package/gtkiostream: new
 package
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Matt,

On Tue, May 17 2022, Matt Flax wrote:
> This package provides many useful software engineering and signal
> processing libraries.
>
> Signed-off-by: Matt Flax <flatmax@flatmax.com>
> ---
>
> Notes:
>     Changes in v2:
>     
>     - added DEVELOPERS entry
>     - trimmed down Config.in to min. selections.
>     - Cleaned up gtkiostream.mk
>     - Added hash file.
>     - fixed TAB indention

[...]

> diff --git a/package/gtkiostream/Config.in b/package/gtkiostream/Config.in
> new file mode 100644
> index 0000000000..2cbec5a844
> --- /dev/null
> +++ b/package/gtkiostream/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_GTKIOSTREAM
> +	bool "gtkiostream"
> +	depends on BR2_INSTALL_LIBSTDCPP # eigen
> +	select BR2_PACKAGE_EIGEN
> +	select BR2_PACKAGE_EIGEN_UNSUPPORTED_MODULES

This symbol has been removed in commit 74e6d6128b46 ("package/eigen: use
cmake-package infra").

baruch

> +	select BR2_PACKAGE_FFTW
> +	select BR2_PACKAGE_FFTW_DOUBLE
> +	select BR2_PACKAGE_FFTW_SINGLE
> +	help
> +	  This package provides many useful software engineering and signal
> +	  processing includes and linkable library.
> +
> +	  https://github.com/flatmax/gtkiostream
> +
> +comment "gtkiostream needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

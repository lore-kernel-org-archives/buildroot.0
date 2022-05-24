Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AAFC433F5
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 03:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3895560C26;
	Tue, 24 May 2022 03:21:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gu1qWsDZVTtA; Tue, 24 May 2022 03:21:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39A5D6115E;
	Tue, 24 May 2022 03:21:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B5401BF8A8
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 03:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59F3081B69
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 03:21:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9zunucryJGXV for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 03:21:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A54682E5F
 for <buildroot@buildroot.org>; Tue, 24 May 2022 03:21:24 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 0415B440526;
 Tue, 24 May 2022 06:20:07 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1653362408;
 bh=sXa3hkCC8u22hiwUSIQfJ2ZYYYIYQqtv7753/bjTSHo=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=Lp2wEihvS9bPOL1TxTZhR1+ztt5OuVEbvy9OJT1xUoepc/Y3QNXUrE1FWtREmWq1D
 ChYw6TQPbTd++1Ryb9GdcYEGgkBEtR6YdvkZL/sE8k3wZrVd0xnUyisJD5ZvMulnKa
 NNHVaJmveqe1sKmr+fnk8cArWcx1mKkE+NbGu+Czfd+wE84+XjHUIbnLdLdYiP4NXS
 fkuaC87ZWKr01vOFPMjQltJuAG62eD2sEngKFnqHB2pnni8fcz1z3AZu1HuyJbYLin
 iLBoRDzfbKQYcbSMd9SyUSxi7Bt5gJKNNN827wrqgWS2kPwAwFPAqoa66cdHde2jK9
 KFaNpq7+HoAdQ==
References: <20220523221724.677215-1-flatmax@flatmax.com>
User-agent: mu4e 1.6.10; emacs 27.1
To: Matt Flax <flatmax@flatmax.com>
Date: Tue, 24 May 2022 06:12:29 +0300
In-reply-to: <20220523221724.677215-1-flatmax@flatmax.com>
Message-ID: <87ee0jpqds.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [RESEND PATCH v3 1/1] package/gtkiostream: new
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
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Matt Flax <flatmax@flatmax.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Matt,

On Tue, May 24 2022, Matt Flax wrote:
> This package provides many useful software engineering and signal
> processing libraries.
>
> Signed-off-by: Matt Flax <flatmax@flatmax.com>

No need to resend v3. Your previous submission is tracked on patchwork:

  http://patchwork.ozlabs.org/project/buildroot/patch/20220517222516.1385819-1-flatmax@flatmax.com/

Until 2022.05 is released maintainers give priority to fixes for that
release. So it might take time for new features to be considered for the
following release. In the mean time you can mark the state of this
submission in patchwork as Not Applicable.

baruch

> ---
>
> Notes:
>     Changes in v3:
>     - removed BR2_PACKAGE_EIGEN_UNSUPPORTED_MODULES
>
>     Changes in v2:
>     
>     - added DEVELOPERS entry
>     - trimmed down Config.in to min. selections.
>     - Cleaned up gtkiostream.mk
>     - Added hash file.
>     - fixed TAB indention
>
>  DEVELOPERS                           |  3 +++
>  package/Config.in                    |  1 +
>  package/gtkiostream/Config.in        | 15 +++++++++++++++
>  package/gtkiostream/gtkiostream.hash |  3 +++
>  package/gtkiostream/gtkiostream.mk   | 16 ++++++++++++++++
>  5 files changed, 38 insertions(+)
>  create mode 100644 package/gtkiostream/Config.in
>  create mode 100644 package/gtkiostream/gtkiostream.hash
>  create mode 100644 package/gtkiostream/gtkiostream.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 292b919137..0c0fb9646d 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1883,6 +1883,9 @@ F:	board/technologic/ts4900/
>  F:	configs/ts4900_defconfig
>  F:	package/ts4900-fpga/
>  
> +N:	Matt Flax <flatmax@flatmax.org>
> +F:	package/gtkiostream/
> +
>  N:	Matt Weber <matthew.weber@collins.com>
>  F:	board/freescale/p*
>  F:	board/freescale/t*
> diff --git a/package/Config.in b/package/Config.in
> index befeadc27b..8e3dd0c08d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1328,6 +1328,7 @@ menu "Audio/Sound"
>  	source "package/bcg729/Config.in"
>  	source "package/caps/Config.in"
>  	source "package/fdk-aac/Config.in"
> +	source "package/gtkiostream/Config.in"
>  	source "package/libao/Config.in"
>  	source "package/libasplib/Config.in"
>  	source "package/libbroadvoice/Config.in"
> diff --git a/package/gtkiostream/Config.in b/package/gtkiostream/Config.in
> new file mode 100644
> index 0000000000..a56d93c562
> --- /dev/null
> +++ b/package/gtkiostream/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_GTKIOSTREAM
> +	bool "gtkiostream"
> +	depends on BR2_INSTALL_LIBSTDCPP # eigen
> +	select BR2_PACKAGE_EIGEN
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
> diff --git a/package/gtkiostream/gtkiostream.hash b/package/gtkiostream/gtkiostream.hash
> new file mode 100644
> index 0000000000..472dd2e9d2
> --- /dev/null
> +++ b/package/gtkiostream/gtkiostream.hash
> @@ -0,0 +1,3 @@
> +# locally computed hash
> +sha256 9edf7d034796ac79a24ef1de14023a9c7f0f9b8bf7fdd6fc3437839c4fdc0aa0 gtkiostream-7b5056be13135a5526d39afbaaaff7cfd879b5ca.tar.gz
> +sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 gpl.txt
> diff --git a/package/gtkiostream/gtkiostream.mk b/package/gtkiostream/gtkiostream.mk
> new file mode 100644
> index 0000000000..41cdd4e4a5
> --- /dev/null
> +++ b/package/gtkiostream/gtkiostream.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# GTKIOSTREAM
> +#
> +################################################################################
> +GTKIOSTREAM_VERSION = 7b5056be13135a5526d39afbaaaff7cfd879b5ca
> +GTKIOSTREAM_SITE = $(call github,flatmax,gtkiostream,$(GTKIOSTREAM_VERSION))
> +
> +GTKIOSTREAM_LICENSE = GPL-2.0+
> +GTKIOSTREAM_CONF_OPTS = --disable-octave
> +GTKIOSTREAM_DEPENDENCIES = eigen fftw-double fftw-single host-pkgconf
> +
> +# Fetched from git, no configure script
> +GTKIOSTREAM_AUTORECONF = YES
> +
> +$(eval $(autotools-package))


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

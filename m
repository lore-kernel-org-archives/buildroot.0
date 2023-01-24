Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E4FC38142
	for <buildroot@archiver.kernel.org>; Tue, 24 Jan 2023 09:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F33226102A;
	Tue, 24 Jan 2023 09:38:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F33226102A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EG7XaxCuEAdU; Tue, 24 Jan 2023 09:38:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AE8E61021;
	Tue, 24 Jan 2023 09:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AE8E61021
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB4F01BF2B0
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 09:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D229061021
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 09:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D229061021
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qFRNw0PyY12Q for <buildroot@lists.busybox.net>;
 Tue, 24 Jan 2023 09:38:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EF5E61001
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7EF5E61001
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 09:38:14 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id D279A440534;
 Tue, 24 Jan 2023 11:34:21 +0200 (IST)
References: <20230124092235.806969-1-james.hilliard1@gmail.com>
 <20230124092235.806969-6-james.hilliard1@gmail.com>
User-agent: mu4e 1.8.10; emacs 28.2
To: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 24 Jan 2023 11:37:13 +0200
In-reply-to: <20230124092235.806969-6-james.hilliard1@gmail.com>
Message-ID: <87r0vkff25.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1674552861;
 bh=qNO30AlwEDcVVi6e+Ltg/I9afxNr7hPIozsqh6ldSU4=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=fk6FA/0JdB4BQ9ypeiKLKDAy6z3TMoBS8ti++9p940/x0KX+5t1hot/3fc/Aal8c+
 hjwnz/wiYkbr//aUUepquu5LNeprrUTpSTgyOHeVW6YL+BssVLTtJav8LKQKHSwupq
 q7PeqVpKbmdMiJhn219i2FShWUbd/0dyRJvUHD4R5ERmPebhGanMRZHejlissVOD9g
 QliMFUw7ZWelA52dFJe9h9jVr0wcKrtv4HJvoqjHe9WCXK3aIcONoVD2QpDs1DBMxP
 hGSMseXlxYtvtG2oAs0uktn2yMpem6onQyf6ks0te13U6yztnwzpDNrhYQ3040MG2n
 xO2Dpaa8C5xOg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=fk6FA/0J
Subject: Re: [Buildroot] [PATCH v3 6/8] package/fft2d: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

On Tue, Jan 24 2023, James Hilliard wrote:

> From: Stefan Hager <stefan.hager@ginzinger.com>
>
> This package is required by tensorflow-lite.
>
> This package doesn't provide a conventional install mechanism so
> we need to install it manually.
>
> Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
> Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  DEVELOPERS               |  1 +
>  package/Config.in        |  1 +
>  package/fft2d/Config.in  |  7 +++++++
>  package/fft2d/fft2d.hash |  4 ++++
>  package/fft2d/fft2d.mk   | 22 ++++++++++++++++++++++
>  5 files changed, 35 insertions(+)
>  create mode 100644 package/fft2d/Config.in
>  create mode 100644 package/fft2d/fft2d.hash
>  create mode 100644 package/fft2d/fft2d.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index a711f9f1ee..a2411bc749 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2703,6 +2703,7 @@ F:	package/ti-gfx/
>  
>  N:	Stefan Hager <stefan.hager@ginzinger.com>
>  F:	package/cpuinfo/
> +F:	package/fft2d/
>  F:	package/gemmlowp/
>  F:	package/neon-2-sse/
>  F:	package/ruy/
> diff --git a/package/Config.in b/package/Config.in
> index 6377ddd2e5..dd16df061c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2003,6 +2003,7 @@ menu "Other"
>  	source "package/elfutils/Config.in"
>  	source "package/ell/Config.in"
>  	source "package/falcosecurity-libs/Config.in"
> +	source "package/fft2d/Config.in"
>  	source "package/fftw/Config.in"
>  	source "package/flann/Config.in"
>  	source "package/flatbuffers/Config.in"
> diff --git a/package/fft2d/Config.in b/package/fft2d/Config.in
> new file mode 100644
> index 0000000000..38394f6170
> --- /dev/null
> +++ b/package/fft2d/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_FFT2D
> +	bool "fft2d"
> +	help
> +	  This is a package to calculate Discrete Fourier/Cosine/Sine
> +	  Transforms of 2,3-dimensional sequences of length 2^N.
> +
> +	  http://www.kurims.kyoto-u.ac.jp/~ooura/fft.html
> diff --git a/package/fft2d/fft2d.hash b/package/fft2d/fft2d.hash
> new file mode 100644
> index 0000000000..a1b1a326ae
> --- /dev/null
> +++ b/package/fft2d/fft2d.hash
> @@ -0,0 +1,4 @@
> +# Locally calculated
> +sha256  ada7e99087c4ed477bfdf11413f2ba8db8a840ba9bbf8ac94f4f3972e2a7cec9  fft2d.tgz
> +# License files, locally calculated
> +sha256  0b2a2082537735a2a576dbec2e8f9c1a09812eac6df6a389502a6ba860072906  readme2d.txt
> diff --git a/package/fft2d/fft2d.mk b/package/fft2d/fft2d.mk
> new file mode 100644
> index 0000000000..6263b1af38
> --- /dev/null
> +++ b/package/fft2d/fft2d.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# fft2d
> +#
> +################################################################################
> +
> +FFT2D_VERSION = 2006.12.28
> +FFT2D_SITE = https://www.kurims.kyoto-u.ac.jp/~ooura
> +FFT2D_SOURCE = fft2d.tgz
> +FFT2D_LICENSE = readme2d.txt

This does not look like a known license name.

baruch

> +FFT2D_LICENSE_FILES = readme2d.txt
> +FFT2D_INSTALL_STAGING = YES
> +FFT2D_INSTALL_TARGET = NO
> +
> +define FFT2D_INSTALL_STAGING_CMDS
> +	mkdir -p $(STAGING_DIR)/usr/include/fft2d
> +	$(INSTALL) -m 0644 $(@D)/*.c $(STAGING_DIR)/usr/include/fft2d
> +	$(INSTALL) -m 0644 $(@D)/*.f $(STAGING_DIR)/usr/include/fft2d
> +	$(INSTALL) -m 0644 $(@D)/*.h $(STAGING_DIR)/usr/include/fft2d
> +endef
> +
> +$(eval $(generic-package))


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

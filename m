Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7D0C38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 20:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15B0A81E50;
	Sat, 28 Jan 2023 20:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15B0A81E50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fCSh0QjcW7R1; Sat, 28 Jan 2023 20:27:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 412C981E05;
	Sat, 28 Jan 2023 20:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 412C981E05
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED5321BF327
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 20:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4D7D81E05
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 20:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4D7D81E05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g7Yg76NnhOQo for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 20:27:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E69381DF6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E69381DF6
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 20:27:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CFA1AE0004;
 Sat, 28 Jan 2023 20:27:45 +0000 (UTC)
Date: Sat, 28 Jan 2023 21:27:44 +0100
To: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Message-ID: <20230128212744.37ea8317@windsurf>
In-Reply-To: <20230124103149.588288-1-fido_max@inbox.ru>
References: <20230124103149.588288-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674937666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wSDa/PxbpX4XJGAgVfci/Ag23Kp7p9vzExucAe4kF3E=;
 b=I4j1FqEuppsumLH0/vG68UAEI4s6iOfE37nJe1StR7OuqeqbzSo/8ODFqAoRerjTKKMUEM
 tetYgeO/dCwq2wfPIrslfVxlEv75dlYt9w4bALz057RmO7AUnooRtOOFxZnKYxH6ThZGFV
 JCW0QGowXIrqFJwAlIPoKnsA1RTE3WQra8iZhgr4+Cu+bb78Ub0r+huLdGKbSLa6pw5QjE
 8wcJwaR3Y90VEFJYdOSjg6J4xjsBYPluanY8NjxaSiqO51roGlYmBn7HYTbLZg3Wf1u0dC
 boOyZTC/NUKUS8dHR6UqkXeEiP5WghVasjY685sdcBNvsYrtaBKKGhSNG/s1NA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I4j1FqEu
Subject: Re: [Buildroot] [PATCH 1/1] package/gdal: switch to cmake build
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
Cc: dmrauh@posteo.de, Maxim Kochetkov <fido_max@inbox.ru>,
 himaralonso+buildroot@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 24 Jan 2023 13:31:49 +0300
Maxim Kochetkov via buildroot <buildroot@buildroot.org> wrote:

> GDAL autoconf has wrong libgeotiff detection. It uses host's
> library if installed instead of buildroot one.
> Modern versions of gdal have no autoconf build scripts, just cmake only.
> 
> So move to cmake build variant.
> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=15281

There was a missing empty line here before the Signed-off-by.

> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/gdal/gdal.mk | 166 ++++++++++++++++++++++---------------------
>  1 file changed, 85 insertions(+), 81 deletions(-)
> 
> diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
> index 33e7ba724a..a777834083 100644
> --- a/package/gdal/gdal.mk
> +++ b/package/gdal/gdal.mk
> @@ -12,6 +12,13 @@ GDAL_LICENSE_FILES = LICENSE.TXT
>  GDAL_CPE_ID_VENDOR = osgeo
>  GDAL_INSTALL_STAGING = YES
>  GDAL_CONFIG_SCRIPTS = gdal-config
> +GDAL_SUPPORTS_IN_SOURCE_BUILD=NO

Missing spaces around "="

> +
> +# Using 'make' with the Makefile generator will not work,
> +# as it will try the GNUmakefile.
> +# GNUmakefile and autoconf are dropped in 3.6 so may be dropped in future version.

I slightly reworded this explanation.

> +GDAL_MAKE_OPTS += -f Makefile
> +
>  # gdal at its core only needs host-pkgconf, libgeotiff, proj and tiff
>  # but since by default mrf driver support is enabled, it also needs
>  # jpeg, libpng and zlib. By default there are also many other drivers
> @@ -20,97 +27,94 @@ GDAL_CONFIG_SCRIPTS = gdal-config
>  # respectively needed dependencies.
>  GDAL_DEPENDENCIES = host-pkgconf jpeg json-c libgeotiff libpng proj tiff zlib
>  
> -# Yes, even though they have --with options, these few libraries are
> +# Yes, even though they have DGDAL_USE, these few libraries are

DGAL_USE should have been "-DGAL_USE options". 

I fixed those minor details, and applied your patch. Thanks a lot!

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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3B1E748E9
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 16:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57DAE81FB0;
	Sun,  1 Oct 2023 16:53:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57DAE81FB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4pNM--yOEOUG; Sun,  1 Oct 2023 16:53:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 515B181F1F;
	Sun,  1 Oct 2023 16:53:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 515B181F1F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EEE191BF4D7
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C82E681F1F
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C82E681F1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RIGMa19jwI79 for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 16:53:49 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 188B181EF4
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 16:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 188B181EF4
Received: by mail.gandi.net (Postfix) with ESMTPSA id E088240004;
 Sun,  1 Oct 2023 16:53:45 +0000 (UTC)
Date: Sun, 1 Oct 2023 18:53:45 +0200
To: Sebastian Weyer <sebastian.weyer@smile.fr>
Message-ID: <20231001185345.6c023fff@windsurf>
In-Reply-To: <20230725173102.543874-6-sebastian.weyer@smile.fr>
References: <20230725173102.543874-1-sebastian.weyer@smile.fr>
 <20230725173102.543874-6-sebastian.weyer@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696179226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tviQpDtUd4xBtDEgHN2J0UzjocBO4nG9v0H0R5tcE3M=;
 b=LLn1lUvNA0s4h6yplGY4nDvPV6CGZLAqMBV/yA6sfHZU6Ogj5kAQlY7V9lfZrvC7HCp+ht
 9axKpIn+HhTSfOLxAv3BmnMnHujZh+fbjlEB1gJgHTwBLBHfH3cJ9uxfJ9JNexayfvs7hs
 IfA/JAsrT66IpLsak7mduUfthjwV4/mj1NXwQql44UPGqRd00MKQ1q4Ijs+T6/Bla70UX4
 QqFUxOoFahnPUHFf9/wEmqtYKCCDaiyYnd27NIrF/JPEh5nNTZE6e36WX+3NsZo2g0a9Dc
 QMMcm6rQtCsdMEeIoEK0I3gWlb4NGvlEDYstetY6kTxaASvA+qBN0DaH4PlHOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LLn1lUvN
Subject: Re: [Buildroot] [PATCH v2 5/9] package/spirv-tools: new package
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
Cc: Romain Naour <romain.naour@smile.fr>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 25 Jul 2023 19:30:57 +0200
Sebastian Weyer <sebastian.weyer@smile.fr> wrote:

> From: Romain Naour <romain.naour@smile.fr>
> 
> This package is required by mesa3d for building rusticl:
> 
> https://docs.mesa3d.org/rusticl.html
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> ---
>  package/Config.in                    |  1 +
>  package/spirv-tools/Config.in        | 12 ++++++++++++
>  package/spirv-tools/spirv-tools.hash |  2 ++
>  package/spirv-tools/spirv-tools.mk   | 22 ++++++++++++++++++++++
>  4 files changed, 37 insertions(+)

Entry in DEVELOPERS file was missing.

> diff --git a/package/spirv-tools/Config.in b/package/spirv-tools/Config.in
> new file mode 100644
> index 0000000000..21b3852779
> --- /dev/null
> +++ b/package/spirv-tools/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_SPIRV_TOOLS
> +	bool "spirv-tools"
> +	depends on BR2_USE_WCHAR # python3
> +	depends on BR2_USE_MMU # python3
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
> +	depends on !BR2_STATIC_LIBS # python3
> +	select BR2_PACKAGE_PYTHON3

Not sure why you thought python3 was needed on the target. Reading
things a bit about spirv-tools, it doesn't seem like Python is needed,
so I dropped this.

However, it needs spirv-headers, and you had forgotten "select
BR2_PACKAGE_SPIRV_HEADERS" here.


> diff --git a/package/spirv-tools/spirv-tools.hash b/package/spirv-tools/spirv-tools.hash
> new file mode 100644
> index 0000000000..6861f543ea
> --- /dev/null
> +++ b/package/spirv-tools/spirv-tools.hash
> @@ -0,0 +1,2 @@

Missing "Locally calculated" comment here.

> +sha256  645c4585c207cbdfda81a09f8ab180773c18df50fad9644d2d9a53b4464c692b  spirv-tools-1.3.246.1.tar.gz
> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/spirv-tools/spirv-tools.mk b/package/spirv-tools/spirv-tools.mk
> new file mode 100644
> index 0000000000..758c01343c
> --- /dev/null
> +++ b/package/spirv-tools/spirv-tools.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# spirv-tools
> +#
> +################################################################################
> +
> +SPIRV_TOOLS_VERSION = 1.3.246.1

I bumped to a newer version to match spirv-headers, as otherwise
spirv-tools would fail to build. I also added a comment in both
spirv-headers and spirv-tools to hint that they should be kept in sync
in terms of version.

> +SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,sdk-$(SPIRV_TOOLS_VERSION))
> +SPIRV_TOOLS_LICENSE = Apache-2.0
> +SPIRV_TOOLS_LICENSE_FILES = LICENSE
> +
> +SPIRV_TOOLS_DEPENDENCIES = python3 spirv-headers

Dropped python3 here.

> +
> +SPIRV_TOOLS_INSTALL_STAGING = YES
> +
> +SPIRV_TOOLS_CONF_OPTS = \
> +    -DSPIRV-Headers_SOURCE_DIR=${STAGING_DIR}/usr \
> +    -DSPIRV_TOOLS_BUILD_STATIC=OFF \
> +    -DBUILD_SHARED_LIBS=ON \
> +    -DSPIRV_SKIP_TESTS=ON \

Indentation here was wrong (spaces used instead of tab), and
${STAGING_DIR} should have been $(STAGING_DIR). Both of these issues
were reported by "make check-package".

Also BUILD_SHARED_LIBS=ON is already passed by the cmake-package
infrastructure as required.

I've added -DSPIRV_WERROR=OFF because it exists, and -Werror is
annoying in the context of Buildroot.

Applied with those various changes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

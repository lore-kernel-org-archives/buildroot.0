Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4B6C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 17:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A1A184C6B;
	Wed,  1 Nov 2023 17:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A1A184C6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NYoGHJhiCJU4; Wed,  1 Nov 2023 17:28:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E12E884B25;
	Wed,  1 Nov 2023 17:28:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E12E884B25
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 402271BF2F1
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE09E84B27
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE09E84B27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rMv_YPzeoN1G for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 17:28:35 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FB108123C
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 17:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FB108123C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4086920003;
 Wed,  1 Nov 2023 17:28:33 +0000 (UTC)
Date: Wed, 1 Nov 2023 18:28:32 +0100
To: Michel Alex <Alex.Michel@wiedemann-group.com>
Message-ID: <20231101182832.1e9dc92e@windsurf>
In-Reply-To: <AS1P250MB0608055A4067BEE19E37EAA4A9D4A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
References: <AS1P250MB0608055A4067BEE19E37EAA4A9D4A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698859713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nuBt4cue6PyCUUytlW+0eIIMD4yKxMhrJ9zkaLqfeWM=;
 b=KwPaNfxQkkkRjwK3He54+39x2z5AYVloIwa8ZWT6b1Bm4pudrLHbDh9dTM7GUA7wnHsEXa
 vZkKgD8clxynHMA1IBdSIXkaz8tkjcX3DksmGNBYL6cvJ8Wi3km2zqhu8Iw8/DFSPuF1wg
 UFyhq3dvievTJ8PQfoxlL7zglE9ByqyutKoKMUnxFEUJeZ1wGoPLeva2Pv6WB8pd/v2tZj
 obKsHNke0wfNrBUVz7XQOgSNrVCNdAg6K5Ijn/QK7Q7UAeB+SCS6Ua7nrVM47dFkdJg0uF
 DeiYMUEc5kjVyGD3CpBXzRcLX/a2v2ao12fwyDwfB20yEo0Us69JN4bOSeteIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KwPaNfxQ
Subject: Re: [Buildroot] [PATCH] package/libzenoh-pico: new package
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alex,

Thanks a lot! I have applied your patch, after doing a number of
changes to fix issues. See below the details.

On Thu, 19 Oct 2023 06:08:07 +0000
Michel Alex <Alex.Michel@wiedemann-group.com> wrote:

> zenoh-pico is the Eclipse zenoh implementation that targets constrained
> devices and offers a native C API. It is fully compatible with its main
> Rust Zenoh implementation, providing a lightweight implementation of
> most functionalities.
> 
> https://github.com/eclipse-zenoh/zenoh-pico
> 
> Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
> ---
>  package/Config.in                        |  1 +
>  package/libzenoh-pico/Config.in          |  9 +++++++++
>  package/libzenoh-pico/libzenoh-pico.hash |  3 +++
>  package/libzenoh-pico/libzenoh-pico.mk   | 19 +++++++++++++++++++
>  4 files changed, 32 insertions(+)

You forgot to add an entry in DEVELOPERS file.

> diff --git a/package/libzenoh-pico/Config.in b/package/libzenoh-pico/Config.in
> new file mode 100644
> index 0000000000..3baa76da3d
> --- /dev/null
> +++ b/package/libzenoh-pico/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_LIBZENOH_PICO
> +       bool "libzenoh-pico"
> +       help
> +         zenoh-pico is the Eclipse zenoh implementation that targets constrained
> +         devices and offers a native C API. It is fully compatible with its main
> +         Rust Zenoh implementation, providing a lightweight implementation of
> +         most functionalities.
> +
> +         https://github.com/eclipse-zenoh/zenoh-pico

There were some coding style issues in this file (indentation, mostly),
reported by "make check-package".

> diff --git a/package/libzenoh-pico/libzenoh-pico.hash b/package/libzenoh-pico/libzenoh-pico.hash
> new file mode 100644
> index 0000000000..edd4c3df4a
> --- /dev/null
> +++ b/package/libzenoh-pico/libzenoh-pico.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  752acec56236fca41dcc438307f4a76e69900383b06803d47f32c480643dc794  zenoh-pico-0.10.0-rc.tar.gz

This didn't work: the tarball is named libzenoh-pico-0.10.0-rc.tar.gz,
not zenoh-pico-0.10.0-rc.tar.gz.

> +LIBZENOH_PICO_VERSION = 0.10.0-rc
> +LIBZENOH_PICO_SITE = $(call github,eclipse-zenoh,zenoh-pico,$(LIBZENOH_PICO_VERSION))
> +LIBZENOH_PICO_LICENSE = EPL-2.0

The license is actually Apache-2.0 or EPL-2.0

> +LIBZENOH_PICO_LICENSE_FILES = LICENSE
> +LIBZENOH_PICO_SUPPORTS_IN_SOURCE_BUILD = NO
> +LIBZENOH_PICO_INSTALL_STAGING = YES
> +
> +# - disable all examples
> +LIBZENOH_PICO_CONF_OPTS += \
> +       -DBUILD_EXAMPLES=OFF

This is not needed, as -DBUILD_EXAMPLES=OFF is always passed when
configuring CMake packages, by the cmake-package infrastructure in
package/pkg-cmake.mk.

> +
> +$(eval $(cmake-package))
> +

This final empty newline was causing another "make check-package"
complaint.

As said above: I fixed those issues, and applied to master. Thanks for
your contribution!

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

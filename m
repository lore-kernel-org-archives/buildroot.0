Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B967EEB570
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 20:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 487F3415FD;
	Fri,  8 Sep 2023 20:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 487F3415FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4flaeiJc6lNA; Fri,  8 Sep 2023 20:57:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3427417FB;
	Fri,  8 Sep 2023 20:57:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3427417FB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3579E1BF2BA
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEDAF60BBE
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEDAF60BBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cLVRGRWklMzY for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 20:57:09 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B0E760A6F
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 20:57:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B0E760A6F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19454240002;
 Fri,  8 Sep 2023 20:57:05 +0000 (UTC)
Date: Fri, 8 Sep 2023 22:57:04 +0200
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20230908225704.0aafa7eb@windsurf>
In-Reply-To: <20230908082741.409005-1-marcus.folkesson@gmail.com>
References: <20230908082741.409005-1-marcus.folkesson@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694206626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J8SBB5/quptKcyz7WWj2+srZxt5bN4OWZG2Sr66Gu7I=;
 b=JBhNCvqJFSF3TRBU7lMclixLyhXMpsd5gRGgvVW6/wNZSX3NotE7YUODzto21KY6Fuuoz+
 iVPj0Z5l3V38nR6OaZje3vtU+8l8khqRjd9U7pfdiTpP9XjN47ufkr4Qy5ojeeaO7ZQ1Vn
 E6CVM2kGKGfd/QYT0vpC1HEFOOqcByyPqDok6Iv7CxiOYr5mboiLLdgXKPYlXbAuQZJR+m
 mSBUlz/920z2iQ1g/BuNY0zkQSg3oh8g0gbR+fDMBdyLHwkhI0cIXfD6g3vn/DCnS9kjDs
 2Lon6+CecxAu/NcZp3j6tG+P4wXY1sTDMR2VHixfUUfkJS0w6Ga2JQPIndeLGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JBhNCvqJ
Subject: Re: [Buildroot] [PATCH 1/2] package/criu: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Marcus,

Thanks for your contribution! See some suggestions below.

On Fri,  8 Sep 2023 10:27:40 +0200
Marcus Folkesson <marcus.folkesson@gmail.com> wrote:

> Checkpoint/Restore In Userspace (CRIU), is a software tool for the Linux operating system to make it possible to freeze a running
> application and checkpoint it to persistent storage as a collection of files.

Commit log should be wrapped to ~80 columns.

> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  package/Config.in      |  1 +
>  package/criu/Config.in | 28 ++++++++++++++++++++++++++++
>  package/criu/criu.hash |  3 +++
>  package/criu/criu.mk   | 42 ++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 74 insertions(+)

An entry in the DEVELOPERS file should be added in this commit (not as
a separate patch).


> diff --git a/package/criu/Config.in b/package/criu/Config.in
> new file mode 100644
> index 0000000000..158e7ced57
> --- /dev/null
> +++ b/package/criu/Config.in
> @@ -0,0 +1,28 @@
> +menuconfig BR2_PACKAGE_CRIU
> +	bool "criu"
> +	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
> +	depends on BR2_INSTALL_LIBSTDCPP # protobuf
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, libnl
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
> +	depends on !BR2_TOOLCHAIN_USES_MUSL

Where does this dependency come from?

> +	depends on !BR2_STATIC_LIBS # protobuf, libbsd
> +	depends on BR2_USE_WCHAR #libbsd
> +	depends on BR2_USE_MMU #libcap

Spaces after # sign.

	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c

is missing.

> +	select BR2_PACKAGE_HOST_PYTHON3_SSL
> +	select BR2_PACKAGE_PROTOBUF
> +	select BR2_PACKAGE_PROTOBUF_C
> +	select BR2_PACKAGE_LIBAIO
> +	select BR2_PACKAGE_LIBBSD
> +	select BR2_PACKAGE_LIBCAP
> +	select BR2_PACKAGE_LIBNET
> +	select BR2_PACKAGE_LIBNL
> +	select BR2_PACKAGE_PYTHON3
> +	select BR2_PACKAGE_PYTHON_PIP

It needs pip on the target? Seems odd.

> +	help
> +	  Checkpoint/Restore In Userspace (CRIU), is a software tool for the Linux operating system to make it possible to freeze a running 
> +	  application and checkpoint it to persistent storage as a collection of files.

This needs to be wrapped to the proper length. Run "make check-package"
to get the details.

Also we need the help text to end with a blank line, followed by the
URL of the upstream project.

> diff --git a/package/criu/criu.mk b/package/criu/criu.mk
> new file mode 100644
> index 0000000000..01b07e3f3f
> --- /dev/null
> +++ b/package/criu/criu.mk
> @@ -0,0 +1,42 @@
> +################################################################################
> +#
> +# CRIU
> +#
> +################################################################################
> +
> +CRIU_VERSION = 3.18
> +CRIU_SOURCE = criu-$(CRIU_VERSION).tar.gz
> +CRIU_SITE = https://github.com/checkpoint-restore/criu/archive/refs/tags/v$(CRIU_VERSION)
> +
> +CRIU_LICENSE = GPL-2.0
> +CRIU_LICENSE_FILES = COPYING
> +CRIU_DEPENDENCIES = host-pkgconf host-protobuf-c host-python3 host-python-pip libaio libbsd libcap libnet libnl protobuf protobuf-c python3

You can split this long line:

CRIU_DEPENDENCIES = \
	foo \
	bar \
	baz

> +
> +CRIU_CFLAGS = $(TARGET_CFLAGS)
> +CRIU_CFLAGS += -D__WORDSIZE -D__USE_GNU -D_GNU_SOURCE

Can be:

CRIU_CFLAGS = \
	$(TARGET_CFLAGS) \
	-D__WORDSIZE \
	-D...

However, this is odd. Why aren't those flags set by the package
Makefile?

> +
> +CRIU_MAKE_ENV = $(TARGET_MAKE_ENV)
> +CRIU_MAKE_ENV += WERROR=0

CRIU_MAKE_ENV = \
	$(TARGET_MAKE_ENV) \
	WERROR=0

> +
> +#Needed as it adds strange paths to the tool otherwise. E.g.  $CROSS_COMPILE/usr/bin/gcc
> +CRIU_MAKE_ENV += HOSTLD=ld
> +CRIU_MAKE_ENV += HOSTCC=gcc

Meh. Not sure to understand here. Maybe you want to pass
$(TARGET_CONFIGURE_OPTS), which does include HOSTCC, HOSTLD, and more.

> +
> +#x86_64 is treated as x86 in criu
> +ifeq ($(BR2_ARCH),x86_64)
> +	CRIU_MAKE_ENV += ARCH=x86

Don't indent this line.

> +else
> +	CRIU_MAKE_ENV += ARCH=$(BR2_ARCH)

Ditto.

In the Makefile:

ifneq ($(filter-out x86 arm aarch64 ppc64 s390 mips loongarch64,$(ARCH)),)
        $(error "The architecture $(ARCH) isn't supported")
endif

So you need a BR2_PACKAGE_CRIU_ARCH_SUPPORTS option that lists those
architectures only.

> +endif
> +
> +define CRIU_BUILD_CMDS
> +    rm -rf $(@D)/images/google/protobuf/descriptor.proto
> +    ln -s  $(STAGING_DIR)/usr/include/google/protobuf/descriptor.proto $(@D)/images/google/protobuf/descriptor.proto

Please indent those lines with one tab.

> +	$(CRIU_MAKE_ENV) $(MAKE) USERCFLAGS="$(CRIU_CFLAGS)" -C $(@D)

I don't understand how this can know which cross-compiler to use, you
are not passing it anywhere as far as I can see.

Could you have a look at addressing those comments and sending an
updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

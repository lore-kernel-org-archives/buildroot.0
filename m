Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70388C7EE2C
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 21:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D557781282;
	Fri, 25 Aug 2023 21:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D557781282
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TslE5hg5uJXT; Fri, 25 Aug 2023 21:33:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E897081251;
	Fri, 25 Aug 2023 21:33:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E897081251
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55D281BF2A5
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 21:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D74241A32
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 21:33:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D74241A32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VTym_drAc_Ck for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 21:33:36 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 508B041951
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 21:33:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 508B041951
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36C131BF208;
 Fri, 25 Aug 2023 21:33:30 +0000 (UTC)
Date: Fri, 25 Aug 2023 23:33:28 +0200
To: Sergey Romanov via buildroot <buildroot@buildroot.org>
Message-ID: <20230825233328.35c4a920@windsurf>
In-Reply-To: <20230525215103.37218-2-svromanov@sberdevices.ru>
References: <20230525215103.37218-1-svromanov@sberdevices.ru>
 <20230525215103.37218-2-svromanov@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692999212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hjZqKoOXYfk0igORkNh9k3pNvpe1R3Yot+Lb005OzX4=;
 b=Egh23hkvNxA9RJl9lm8/VWiszudIMosqmSWOoC2eVzMeZfRJo/84K4G3aJhIW3HM2S3aEw
 wiCDJJkA02sCod2DtOE0MaNP7YCnxDFT9OkN5GhlNkwQel/bI3f9m/Tm+qjaYQo0XGi/NS
 zUOdIfhGB9/QDLGqlBgEjYzSVd8/84+xVVtiAL3u/d/I8zGrOmC+68/MbWe4wra5Lb1ezl
 l3yo+WpAB4JkweXg4+3dI6M1bagAKQkyEhBM7OuS1vSzVsRTUyXCWa1mRuqzJVEW7159f7
 QHr53CAxQOfqorTjNjU2kBbOGWAsKgcghKN8p2Sp0daTLgl21AhlOS6fv8tevA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Egh23hkv
Subject: Re: [Buildroot] [RFC PATCH v1 1/2] package/ck: new package
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
Cc: Sergey Romanov <svromanov@sberdevices.ru>, chip-club@ya.ru,
 akopytov@gmail.com, sbahra@repnop.org, sdfw_system_team@sberdevices.ru,
 kernel@sberdevices.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Sergey,

On Fri, 26 May 2023 00:51:02 +0300
Sergey Romanov via buildroot <buildroot@buildroot.org> wrote:

> Concurrency primitives, safe memory reclamation
> mechanisms and non-blocking data structures
> for the research, design and implementation
> of high performance concurrent systems.
> 
> https://github.com/concurrencykit/ck.git
> 
> Signed-off-by: Sergey Romanov <svromanov@sberdevices.ru>

Sorry for the very slow feedback. I wanted to push this, but it doesn't
build, and I don't see how it can build in a cross-compilation
environment. Indeed, the configure script does this:

$CC -o .1 .1.c
COMPILER=`./.1 2> /dev/null`
r=$?
rm -f .1.c .1

if test "$r" -ne 0; then
        assert "" "update compiler"
else
        echo "success [$CC]"
fi

So it builds a program called .1 with the cross-compiler, and then it
tries to run it. This obviously will never work in a cross-compilation
context.

Some more comments below (which I had addressed locally, but had to
give up because of the above issue)

> diff --git a/.checkpackageignore b/.checkpackageignore
> index f2dea0dfd9..1be4e79a2b 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -286,6 +286,7 @@ package/cgroupfs-mount/S30cgroupfs Indent Shellcheck Variables
>  package/chipmunk/0001-Fix-build-failure-on-musl.patch Upstream
>  package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch Upstream
>  package/chrony/S49chrony Indent Shellcheck Variables
> +package/ck/0001-Avoid-buildroot-s-influence-on-LDFLAGS.patch Upstream

Please add a proper Upstream: tag instead of adding an exception. We
don't want to add new entries in .checkpackageignore, only remove
existing entries.

> diff --git a/package/ck/0001-Avoid-buildroot-s-influence-on-LDFLAGS.patch b/package/ck/0001-Avoid-buildroot-s-influence-on-LDFLAGS.patch
> new file mode 100644
> index 0000000000..7e2cc85ba6
> --- /dev/null
> +++ b/package/ck/0001-Avoid-buildroot-s-influence-on-LDFLAGS.patch
> @@ -0,0 +1,191 @@
> +From 0b30b184538c0de485fe292e2ebb6bfea3c255bc Mon Sep 17 00:00:00 2001
> +From: Sergey Romanov <svromanov@sberdevices.ru>
> +Date: Thu, 25 May 2023 19:01:28 +0300
> +Subject: [PATCH] Avoid buildroot's influence on LDFLAGS
> +
> +Upstream-status: Pending

Pending where? Could you please provide some link to a pull request?

Also, could you provide some more details on why this patch is needed.
Apparently, the configure script is designed to allow passing custom
LDFLAGS through the LDFLAGS variable, so why doesn't that just work?

> diff --git a/package/ck/Config.in b/package/ck/Config.in
> new file mode 100644
> index 0000000000..d88eaa8413
> --- /dev/null
> +++ b/package/ck/Config.in
> @@ -0,0 +1,23 @@
> +config BR2_PACKAGE_CK_ARCH_SUPPORTS
> +	bool
> +	default y if ((BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5 && \
> +		!BR2_ARM_CPU_ARMV7M) || BR2_aarch64 || \
> +		BR2_powerpc || BR2_powerpc64 || BR2_RISCV_64 || \
> +		BR2_s390x || BR2_sparc_v9 || BR2_x86 || BR2_x86_64)

BR2_x86 doesn't exist, it's BR2_i386. Also, please reformat as such:

config BR2_PACKAGE_CK_ARCH_SUPPORTS
        bool
        default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5 && !BR2_ARM_CPU_ARMV7M
        default y if BR2_aarch64
        default y if BR2_i386
        default y if BR2_powerpc || BR2_powerpc64
        default y if BR2_RISCV_64
        default y if BR2_s390x
        default y if BR2_sparc_v9
        default y if BR2_x86_64

> +config BR2_PACKAGE_CK_TOOLCHAIN_SUPPORTS
> +	bool
> +	default y if ((BR2_TOOLCHAIN_USES_MUSL || BR2_TOOLCHAIN_USES_GLIBC) && \
> +		!BR2_TOOLCHAIN_USES_UCLIBC)

Please drop this.

> +
> +config BR2_PACKAGE_CK
> +	bool "concurrency kit"
> +	depends on BR2_PACKAGE_CK_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_CK_TOOLCHAIN_SUPPORTS

And use:

	# some comment here to explain the issue
	depends on !BR2_TOOLCHAIN_USES_UCLIBC

> +	help
> +	  Concurrency primitives, safe memory reclamation
> +	  mechanisms and non-blocking data structures
> +	  for the research, design and implementation
> +	  of high performance concurrent systems.
> +
> +	  https://github.com/concurrencykit/ck.git

And add:

comment "ck needs a toolchain w/ glibc or musl"
        depends on BR2_PACKAGE_CK_ARCH_SUPPORTS
        depends on BR2_TOOLCHAIN_USES_UCLIBC

> +CK_INSTALL_STAGING = YES
> +
> +CK_PROFILE_PARAMS += --platform=$(BR2_ARCH)
> +CK_PROFILE_PARAMS += --prefix="/usr"

Please use:

CK_CONF_OPTS = \
	--platform=$(BR2_ARCH) \
	--prefix="/usr"

> +
> +define CK_CONFIGURE_CMDS
> +	( cd $(@D); \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	$(CK_PROFILE_CONF_ENV) \

This variable doesn't exist.

> +	./configure $(CK_PROFILE_PARAMS) )

Please simplify to:

        cd $(@D); \
                $(TARGET_CONFIGURE_OPTS) \
                ./configure $(CK_CONF_OPTS)


> +endef
> +
> +define CK_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS) \
> +	$(CK_PROFILE_CONF_ENV) \
> +	$(MAKE) -C $(@D)

If you can simplify to:

        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)

it would be great.

> +endef
> +
> +define CK_INSTALL_TARGET_CMDS
> +	$(TARGET_CONFIGURE_OPTS) \
> +	$(CK_PROFILE_CONF_ENV) \
> +	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install

Simplify to:

        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install

if possible.

> +endef
> +
> +define CK_INSTALL_STAGING_CMDS
> +	$(TARGET_CONFIGURE_OPTS) \
> +	$(CK_PROFILE_CONF_ENV) \
> +	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install

Simplify to:

        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install

if possible.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

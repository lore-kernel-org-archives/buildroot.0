Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C965C433EF
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 20:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F24E833DB;
	Tue,  3 May 2022 20:08:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ig9A-5u3Zg9; Tue,  3 May 2022 20:08:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED9EE833C7;
	Tue,  3 May 2022 20:08:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E531C1BF2C1
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB3674052B
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:08:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lXzYDxjEaGyX for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 20:08:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B62D40528
 for <buildroot@buildroot.org>; Tue,  3 May 2022 20:08:38 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id m20so35432712ejj.10
 for <buildroot@buildroot.org>; Tue, 03 May 2022 13:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=x50zlMaJZCRWmg6dfLYdwRbgtLkW4CLrKFuO6wyVrg8=;
 b=PpHQByLD1yy71vp0pJwGXemxDfNN38WQVRycUK3+bp+JVYKA0utM3JDGJXrXeoSeM/
 d+WCX92DZa/4hRiNHsEMdRioOO3OaiP9BVABmMwu3SXIMKRiPLtkaBeJPGCpDfMme9Kg
 WEREtOQErbiVlrwqXsKdmbqiXWwiwKVp/2p5VkGMiksxfAXOm39geiSpyktb8EVAVGQ+
 A76pgHKPjoeJscczG8Hq0KXWVXeoAhxKB/AjqyCeJ30di0+OJ1O+ahXvtgHhTnGgEb2v
 l/jQCI0Ep8YtrD7tUjCjkk5Fhjac7Zm6SlxQLhAPB1ZsOQtlWWfgwzFy57iMfwZ74Tp+
 2z2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=x50zlMaJZCRWmg6dfLYdwRbgtLkW4CLrKFuO6wyVrg8=;
 b=TayXeKgW0OJC4MiSYiDuq9/k7o4PtBBeFhGM7SObiqJ8FxoMDGJpjHPiZzOPMcGD7z
 8If1ljgdpTNtT4W9JTs/eQjwvpkn+kl3PCD1QNR2sP1miPdlEtCsDhGq3oIyedoo7sch
 RRYPqGUap4f/n/ITRPEFGo8zU0fTF6LPItZqv4JV9cC2P1oIOo1VShRe4Kw7Lz1F+PTM
 VhmE66EcEcD8RxYc7cMnJY3JbfIWI4hsPUiv8G19z2PGGJ2UXHgoA3T3E+y3wETOes4J
 bfzyNQaYsUriq2en7pGdVJ4luINEWd8K9svEgcOez/mKigVxfsCTBKrIrGcC9f7ZdLmq
 lRGw==
X-Gm-Message-State: AOAM533Q4VEon5NjfJ8Hjg9oOMyVddRDsiLrQrSkhQu5AimkEotIdM46
 O/8sFHWwtmOiU/ya4gEPwcCfwzD8JucQgQ==
X-Google-Smtp-Source: ABdhPJxfPuvVXolv8LNWCJ+SV3WB5m9DCuhHWty+plpa32X7E7NBU6oW57BzRoK/j75lIxa4VxrOBQ==
X-Received: by 2002:a17:907:e8e:b0:6f4:64aa:5813 with SMTP id
 ho14-20020a1709070e8e00b006f464aa5813mr8525469ejc.648.1651608516981; 
 Tue, 03 May 2022 13:08:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 cw27-20020a056402229b00b0042617ba6387sm8140796edb.17.2022.05.03.13.08.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 13:08:35 -0700 (PDT)
Message-ID: <0b397523-f972-97ff-39d0-1b3bb8229599@mind.be>
Date: Tue, 3 May 2022 22:08:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20220305200730.11060-1-ju.o@free.fr>
 <20220501201843.1692535-1-ju.o@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220501201843.1692535-1-ju.o@free.fr>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/octave: new package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/05/2022 22:18, Julien Olivain wrote:
> GNU Octave is a high-level language, primarily intended for numerical
> computations. It provides a convenient command line interface for
> solving linear and nonlinear problems numerically, and for performing
> other numerical experiments using a language that is mostly compatible
> with Matlab. It may also be used as a batch-oriented language. Octave
> has extensive tools for solving common numerical linear algebra
> problems, finding the roots of nonlinear equations, integrating
> ordinary functions, manipulating polynomials, and integrating ordinary
> differential and differential-algebraic equations. It is easily
> extensible and customizable via user-defined functions written in
> Octave's own language, or using dynamically loaded modules written in
> C++, C, Fortran, or other languages.
> 
> https://www.octave.org/
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

[snip]
> diff --git a/package/octave/Config.in b/package/octave/Config.in
> new file mode 100644
> index 0000000000..b504310d19
> --- /dev/null
> +++ b/package/octave/Config.in
> @@ -0,0 +1,42 @@
> +config BR2_PACKAGE_OCTAVE
> +	bool "octave"
> +	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
> +	depends on BR2_TOOLCHAIN_HAS_FORTRAN
> +	# Some Bootlin x86_64 toolchains (like version
> +	# bleeding-edge-2021.11-1) has a file
> +	# "x86_64-buildroot-linux-gnu/lib64/libgfortran.la" including
> +	# a "dependency_libs=" entry with an incorrect absolute path
> +	# to linquadmath.la on the bootlin build host. This breaks
> +	# builds using libtool with libgfortran. Those toolchains are
> +	# used by the "utils/test-pkg" script.
> +	depends on !BR2_TOOLCHAIN_EXTERNAL_BOOTLIN || !BR2_x86_64

  I've applied as is, but it would be better to simply fix those toolchains with 
a POST_PATCH hook in toolchain-external-bootlin.mk.

  And of course they should be fixed upstream :-)

> +	select BR2_PACKAGE_OPENBLAS
> +	select BR2_PACKAGE_PCRE
> +	select BR2_PACKAGE_PCRE_UTF
> +	help
> +	  GNU Octave is a high-level language, primarily intended for
> +	  numerical computations. It provides a convenient command
> +	  line interface for solving linear and nonlinear problems
> +	  numerically, and for performing other numerical experiments
> +	  using a language that is mostly compatible with Matlab. It
> +	  may also be used as a batch-oriented language. Octave has
> +	  extensive tools for solving common numerical linear algebra
> +	  problems, finding the roots of nonlinear equations,
> +	  integrating ordinary functions, manipulating polynomials,
> +	  and integrating ordinary differential and
> +	  differential-algebraic equations. It is easily extensible
> +	  and customizable via user-defined functions written in
> +	  Octave's own language, or using dynamically loaded modules
> +	  written in C++, C, Fortran, or other languages.
> +
> +	  https://www.octave.org/
> +
> +comment "octave needs a toolchain w/ C++11 and fortran"
> +	depends on !BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
> +		!BR2_TOOLCHAIN_HAS_FORTRAN
> +
> +comment "octave needs the openblas package"
> +	depends on !BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS

  We don't add comments for architecture dependencies. So I removed this.

  Applied to master with those changes, thanks.

  Regards,
  Arnout

> diff --git a/package/octave/octave.hash b/package/octave/octave.hash
> new file mode 100644
> index 0000000000..72d47cdf54
> --- /dev/null
> +++ b/package/octave/octave.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  9e8d1f4d64fa1bcfa30a571e240dc83715dbaede1de96a982bdc89cac7ced42c  octave-7.1.0.tar.lz
> +sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> diff --git a/package/octave/octave.mk b/package/octave/octave.mk
> new file mode 100644
> index 0000000000..4e828eb734
> --- /dev/null
> +++ b/package/octave/octave.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# octave
> +#
> +################################################################################
> +
> +OCTAVE_VERSION = 7.1.0
> +OCTAVE_SITE = https://ftp.gnu.org/gnu/octave
> +OCTAVE_SOURCE = octave-$(OCTAVE_VERSION).tar.lz
> +OCTAVE_LICENSE = GPL-3.0+
> +OCTAVE_LICENSE_FILES = COPYING
> +OCTAVE_AUTORECONF = YES
> +
> +OCTAVE_CONF_OPTS = --disable-java
> +
> +OCTAVE_DEPENDENCIES = \
> +	host-gperf \
> +	openblas \
> +	pcre
> +
> +ifeq ($(BR2_PACKAGE_READLINE),y)
> +OCTAVE_CONF_OPTS += --enable-readline
> +OCTAVE_DEPENDENCIES += readline
> +else
> +OCTAVE_CONF_OPTS += --disable-readline
> +endif
> +
> +$(eval $(autotools-package))
> diff --git a/support/testing/tests/package/test_octave.py b/support/testing/tests/package/test_octave.py
> new file mode 100644
> index 0000000000..31d0105503
> --- /dev/null
> +++ b/support/testing/tests/package/test_octave.py
> @@ -0,0 +1,79 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestOctave(infra.basetest.BRTest):
> +    # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it does
> +    # not include gfortran.
> +    config = \
> +        """
> +        BR2_aarch64=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.26"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_TARGET_ROOTFS_CPIO_GZIP=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        BR2_PACKAGE_OCTAVE=y
> +        """
> +    timeout = 60
> +
> +    def octave_cmd(self, octave_expr):
> +        return "octave --quiet --eval '{}'".format(octave_expr)
> +
> +    def test_run(self):
> +        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
> +        kern = os.path.join(self.builddir, "images", "Image")
> +        self.emulator.boot(arch="aarch64",
> +                           kernel=kern,
> +                           kernel_cmdline=["console=ttyAMA0"],
> +                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "512M", "-initrd", img])
> +        self.emulator.login()
> +
> +        # Check Euler identity
> +        cmd = self.octave_cmd("assert (exp(i*pi)+1, 0, 1e-10)")
> +        self.assertRunOk(cmd)
> +
> +        # Solve equation system example from Octave homepage
> +        octave_expr = "b = [4; 9; 2]; "
> +        octave_expr += "A = [ 3 4 5; 1 3 1; 3 5 9 ]; "
> +        octave_expr += "x = A \ b; "
> +        octave_expr += "assert(x, [-1.5; 4; -1.5], 1e-10)"
> +        cmd = self.octave_cmd(octave_expr)
> +        self.assertRunOk(cmd)
> +
> +        # Check octave can fail
> +        cmd = self.octave_cmd("assert(false)")
> +        _, exit_code = self.emulator.run(cmd)
> +        self.assertNotEqual(exit_code, 0)
> +
> +        # Check string output
> +        string = "Hello World"
> +        cmd = self.octave_cmd("printf(\"{}\\n\")".format(string))
> +        output, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +        self.assertEqual(output, [string])
> +
> +        # Run some octave self tests
> +        octave_modules = [
> +            "elfun/atan2d",
> +            "elfun/sind",
> +            "general/gradient",
> +            "general/num2str",
> +            "polynomial/poly",
> +            "signal/fftconv",
> +            "special-matrix/magic",
> +            "specfun/isprime",
> +            "statistics/corr",
> +            "strings/str2num"
> +        ]
> +
> +        for mod in octave_modules:
> +            cmd = self.octave_cmd('assert(test(\"{}\"),true)'.format(mod))
> +            self.assertRunOk(cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

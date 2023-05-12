Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA4DC77B7F
	for <buildroot@archiver.kernel.org>; Fri, 12 May 2023 22:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B76D242D3B;
	Fri, 12 May 2023 22:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B76D242D3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t_aS7tp6cTDW; Fri, 12 May 2023 22:08:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47906401D2;
	Fri, 12 May 2023 22:08:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47906401D2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E43361BF834
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 22:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAFE542DE8
 for <buildroot@lists.busybox.net>; Fri, 12 May 2023 22:08:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAFE542DE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rpqhAaUQFAUe for <buildroot@lists.busybox.net>;
 Fri, 12 May 2023 22:08:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A17DF42DE7
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A17DF42DE7
 for <buildroot@buildroot.org>; Fri, 12 May 2023 22:07:59 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.117]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mv31c-1qF7mN2fwW-00r2kb; Sat, 13
 May 2023 00:07:55 +0200
Date: Sat, 13 May 2023 00:07:54 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Sourabh Hegde <hrsourabh011@gmail.com>
Message-ID: <20230513000754.57c0ac48@gmx.net>
In-Reply-To: <CADYjeSuD1_iZ8qpTwmAyTmbJT6Ah9gFENtge+inogwmcg=i1Ng@mail.gmail.com>
References: <CADYjeSuD1_iZ8qpTwmAyTmbJT6Ah9gFENtge+inogwmcg=i1Ng@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:Ih0Eg1NT5RnwaXcUCOLeXpNy8RYoAxhDhYZhPv4S4wDrtvPoNoc
 QnGiOSCQ9TmWCFg0003u1aFytEeGYgRLmcsLY2ODI0yifvVM1jmygUvFPpDjCcTPz61ETCE
 y0lcPW6lnP924UYupdcLisYIjih173DbbvlhwoHgRFqLy3WCtMgLs3djbIJVgDcGAi3jA6z
 jU9gdh80mjYwJV6ycaVgA==
UI-OutboundReport: notjunk:1;M01:P0:zXyVYEfaBjU=;Fo+2P6+a1NOdJEmN7mzDdfqgRZt
 +drwugMsH1nNmghJXd+ToQ2LCbHqWV2MDEBvqJOqAsr+jxwhPcoua9MDo4nICMZsTmJ0wjxnz
 M8YFJb3crYE/1wqaPbdBC9XVa423/9brewIOk7s5cydRcDnDPJ1Wl3PBCZhUm2xdi7KdWRZJy
 OHwLRsyVmYjz4YjnhEnIAfzjnQeC8hXJ17LXh1E2UQL8KXtq2st0kWFqFnUS/ONJqnJ5EJcXe
 t6Ez3ZFr2BAc1rj41EOwjAH3MsP2yN2luSsm/9wzhd/WcnDfqnrayUhdbzhIjAFp2N0XYGKqv
 vinTHht9/H1eL1oTnoZJkJvQliG3uWN34srQlrmuXJ7zOyyR67riVFOcK9ywg6atH1Umo+2Di
 vqxo+d5hxH7tRWsMTyjiYVMFHeqvMcZn6sUimlIpF9JTtiiQaRMgAedV+aCh6ZtoxfTVLhWku
 KBLnP2+9GjPIaa0KQdf+5aRAIR9lZ772d/DuaX+294Jc3w7vx2fq0TsOuw6OfXqyN+4OYwIR8
 0KDefssWuZheZJnZLLsXAVnrrq/PO9UaVH4+VzvmByL8f+UwU+RoO9sv5UwD4HoY6cOjjry0l
 6i+kP6855uctcqIe9DV/QcVLP3SJIx/oo2qKzKF1skYRMUIPwUt5EhUMZNYbgA9UscyI07+dR
 hlO3QawRKHodEJqfLuM2VK7o/irty4HjDxCnUX/5qjPStFcjD99DRG6vPKs4CYzV0IQBfjJY9
 pqZGretmCTvZ+po5uiefqUZzzmu5sSF3YTidnShADb2RhqNLfRWsBOWZy49Utv3ToHpkJzWzs
 dC9w5qyAXIptr/6QYYh69j0pz9mz1mMImf3d3OBZwxLaFTBSkewdAFanVlnSzzPVwP2P4kao2
 b/4FKj0fICeb8ZKokGLTrgdd7Ca0lW6fGcJLLpiHV4wQIZ/RIbD+nGikOjhHxM1NoR+TYkg3E
 sOcVuJJ+osdjRL0t+Ud0az2om2U=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1683929275; i=ps.report@gmx.net;
 bh=0yawE1H8SsGiR0k/XV8WNlH7ANqPV42SXWkC9tcDLkQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=U9YJLn+eXD2SkM7erQHBdP34KxZ4bIrqplJ9W3/R5f1mMONanRDqXgM86aqFKHZnb
 BiPzzcWrBMLKQ+z1aNMqvDYhxMXi3IFH4GBcy6tN4t9p+IC9WbNNY7t9Q9Tu/T/UV4
 3p6cGAVBJxB6TaRor8M6TaB+BRWHacFRcJPMqHEiFym3X29D3piSDF1G393ti+keiK
 4U+K5fOuea02RDWDiljwYOsYFUM0VXGqtxAW9vD+t2rwBSBGV/0cveYRAU6cxNzofl
 bAmq2YQkoDSyZeigysDWioL/jR4AdT3GaBXDDL6vRPCbOX3ysQ/JTnCDmoljzj15kT
 hKULgAAtWSovA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=U9YJLn+e
Subject: Re: [Buildroot] Compiling issue while adding tpm2-tss-engine as
 Buildroot package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Sourabh,

On Fri, 12 May 2023 14:27:09 +0200, Sourabh Hegde <hrsourabh011@gmail.com> wrote:

> Hello,
>
> I am trying to add tpm2-tss-engine (OpenSSL Engine for TPM2 devices) (
> https://github.com/tpm2-software/tpm2-tss-engine) as a Buildroot package
> and below is the tpm2-tss-engine.mk file
>
> ################################################################################
> #
> # tpm2-tss-engine
> #
> ################################################################################
>
> TPM2_TSS_ENGINE_VERSION = 1.2.0
> TPM2_TSS_ENGINE_SITE =
> https://github.com/tpm2-software/tpm2-tss-engine/releases/download/$(TPM2_TSS_ENGINE_VERSION)
> TPM2_TSS_ENGINE_LICENSE = BSD-3-Clause
> TPM2_TSS_ENGINE_LICENSE_FILES = LICENSE
> TPM2_TSS_ENGINE_DEPENDENCIES = libqrencode tpm2-tss host-pkgconf
> host-autoconf-archive
> TPM2_TSS_ENGINE_AUTORECONF = YES
> TPM2_TSS_ENGINE_AUTORECONF_OPTS = -I $(HOST_DIR)/share/autoconf-archive
> TPM2_TSS_ENGINE_CONF_OPTS = \
>         --disable-defaultflags \
>         --disable-doxygen-doc \
>         --disable-plymouth \
>         --without-initramfstoolsdir \
>         --without-mkinitcpiodir
>
> # uses C99 code but forgets to pass -std=c99 when --disable-defaultflags is
> used
> TPM2_TSS_ENGINE_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
>
> # do not build man pages
> TPM2_TSS_ENGINE_CONF_ENV += ac_cv_path_PANDOC=''
>
> $(eval $(autotools-package))
>
> Source code is being downloaded from Git and building. But in the next step
> I am getting below error:
>
> >>> tpm2-tss-engine 1.2.0 Building
> PATH="/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin:/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
>  /usr/bin/make -j17  -C
> /home/[...]/tmp/br.test.standard/build/tpm2-tss-engine-1.2.0/
> make[2]: Nothing to be done for 'all'.
> >>> tpm2-tss-engine 1.2.0 Installing to target
> PATH="/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin:/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
>  /usr/bin/make -j17
> DESTDIR=/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target
> install -C /home/[...]/tmp/br.test.standard/build/tpm2-tss-engine-1.2.0/
> ([ -e
> /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1
> ] || \
>          /usr/bin/mkdir -p
> /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1)
>  /usr/bin/mkdir -p
> '/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/bin'
>  /usr/bin/mkdir -p
> '/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/share/bash-completion/completions'
>  /usr/bin/mkdir -p
> '/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/include'
>  /usr/bin/mkdir -p
> '/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1'
>  /usr/bin/mkdir -p
> '/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/share/man/man1'
>  /usr/bin/mkdir -p
> '/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/share/man/man3'
>  /bin/bash ./libtool   --mode=install /usr/bin/install -c   libtpm2tss.la
> '/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1'
>   /bin/bash ./libtool   --mode=install /usr/bin/install -c tpm2tss-genkey
> '/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/bin'
>  /usr/bin/install -c -m 644 bash-completion/tpm2tss-genkey
> '/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/share/bash-completion/completions'
>  /usr/bin/install -c -m 644 include/tpm2-tss-engine.h
> '/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/include'
>  /usr/bin/install -c -m 644 man/man1/tpm2tss-genkey.1
> '/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/share/man/man1'
>  /usr/bin/install -c -m 644 man/man3/tpm2tss_tpm2data_write.3
> man/man3/tpm2tss_rsa_makekey.3 man/man3/tpm2tss_rsa_genkey.3
> man/man3/tpm2tss_ecc_makekey.3 man/man3/tpm2tss_ecc_genkey.3
> man/man3/tpm2tss_ecc_getappdata.3 man/man3/tpm2tss_tpm2data_read.3
> man/man3/tpm2tss_ecc_setappdata.3
> '/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/share/man/man3'
> libtool: install: /usr/bin/install -c .libs/libtpm2tss.so
> /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1/libtpm2tss.so
> libtool: install: /usr/bin/install -c tpm2tss-genkey
> /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/bin/tpm2tss-genkey
> libtool: install: /usr/bin/install -c .libs/libtpm2tss.lai
> /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1/
> libtpm2tss.la
> /usr/bin/make  install-exec-hook
> (cd
> /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1
> && \
>          ln -s -f libtpm2tss.so tpm2tss.so)
> libtool: warning: remember to run 'libtool --finish
> /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1'
> tpm2-tss-engine: installs files in
> /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target//home/[...]/tmp/br.test.standard

This is a check for files installed into target replicating your build path, e.g.
in case your build in /home/my_name/buildroot_build_001 and your package installs
files into /home/my_name/buildroot_build_001/target/home/my_name/buildroot_build_001/usr/lib/...
instead into /home/my_name/buildroot_build_001/target/usr/lib/...

In your case this can be fixed by adding '--with-enginesdir=/usr/lib/engines-1.1' to
TPM2_TSS_ENGINE_CONF_OPTS options...

Regards,
Peter


> make[1]: *** [package/pkg-generic.mk:390:
> /home/[...]/tmp/br.test.standard/build/tpm2-tss-engine-1.2.0/.stamp_target_installed]
> Error 1
> make: *** [Makefile:23: _all] Error 2
>
>
> I have also added `libtool` (`BR2_PACKAGE_LIBTOOL`) in the `make
> menuconfig`.
> I am not sure what the actual error is.
>
> Can anyone please let me know how to resolve the above issue?
>
> Thank you,
> Sourabh

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

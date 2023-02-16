Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EF5C61DA4
	for <buildroot@archiver.kernel.org>; Thu, 16 Feb 2023 14:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CD9460783;
	Thu, 16 Feb 2023 14:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CD9460783
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XQDFAfzGT2kA; Thu, 16 Feb 2023 14:48:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D90260A84;
	Thu, 16 Feb 2023 14:48:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D90260A84
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 887EA1BF5A5
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 14:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6269981FA7
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 14:48:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6269981FA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o4Qr1yCVGDzH for <buildroot@lists.busybox.net>;
 Thu, 16 Feb 2023 14:48:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E8D881F90
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E8D881F90
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 14:48:41 +0000 (UTC)
Received: from pwmachine.localnet (77.119.92.79.rev.sfr.net [79.92.119.77])
 by linux.microsoft.com (Postfix) with ESMTPSA id 05D7B20B9C3D;
 Thu, 16 Feb 2023 06:48:39 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 05D7B20B9C3D
From: Francis Laniel <flaniel@linux.microsoft.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Lang Daniel <d.lang@abatec.at>
Date: Thu, 16 Feb 2023 15:48:37 +0100
Message-ID: <4807202.31r3eYUQgx@pwmachine>
In-Reply-To: <12152275.O9o76ZdvQC@pwmachine>
References: <VI1P190MB04930BE811E350544617950D9FA39@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 <12152275.O9o76ZdvQC@pwmachine>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1676558920;
 bh=pgD986WWbJRKsHLGJ4Gyv6A4DL++zCZZDO68cLS5SQI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oNkPDlVUtAiD3hdTVpQu+/Oi9QknAWwHKeQoDwc9xCImTv1tt0FIeqlZxHtwfH2sy
 TfhMx2HONqZGuSrZIwW9GO19bacCcD8Iixj9576bOMeKk1xd5NQAeRvOg64Ny3dCjC
 yJhSqMFtNo476H1S82dyPcOXafBhn4aG/TDUWVtw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=oNkPDlVU
Subject: Re: [Buildroot] [PATCH v2 2/2] linux: use -isystem instead of -I in
 HOSTCC
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Le jeudi 16 f=E9vrier 2023, 15:23:35 CET Francis Laniel a =E9crit :
> Hi.
> =

> Le mercredi 15 f=E9vrier 2023, 10:58:51 CET Lang Daniel a =E9crit :
> > A package might install headers that are incompatible with the kernel's
> > header. One example is the most recent version of pahole (1.24).
> > HOST_CC includes -I$(HOST_DIR)/include which comes before any include
> > logic the kernel might have thus forcing the kernel to prefer headers in
> > HOST_DIR.
> > =

> > The logic to substituting -I with -isystem is taken from
> > boot/uboot/uboot.mk.
> > =

> > Signed-off-by: Daniel Lang <d.lang@abatec.at>
> =

> Thank you for this patch!
> I tested it and got the same error as you:
> FAILED: load BTF from vmlinux: Invalid argument
> =

> I tested with qemu_x86_64_defconfig to which I added the same options as
> you. I will test with a kernel younger than 5.15.18 and I come back here!

I tested with latest kernel and everything works like a charm:
Welcome to Buildroot
buildroot login: root
# uname -r
6.1.11
# ls /sys/kernel/btf/
vmlinux
Thank you for it!

Reviewed-by: Francis Laniel <flaniel@linux.microsoft.com>
Tested-by: Francis Laniel <flaniel@linux.microsoft.com>

> > ---
> > =

> > v1 -> v2:
> >  - Patch was added to the series
> > =

> > Tested with:
> > =

> > BR2_aarch64=3Dy
> > BR2_TOOLCHAIN_EXTERNAL=3Dy
> > BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=3Dy
> > BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=3Dy
> > BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=3Dy
> > BR2_LINUX_KERNEL=3Dy
> > BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"{VERSION}"
> > BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy
> > BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D"pahole-kernel.config"
> > BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
> > BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE=3Dy
> > =

> > and with a fragment for linux:
> > =

> > CONFIG_BPF_SYSCALL=3Dy
> > CONFIG_BPF_UNPRIV_DEFAULT_OFF=3Dn
> > CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=3Dy
> > CONFIG_DEBUG_INFO_REDUCED=3Dn
> > CONFIG_DEBUG_INFO_COMPRESSED=3Dn
> > CONFIG_DEBUG_INFO_BTF=3Dy
> > CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> > =

> > where VERSION is one of:
> > 5.2.21 5.3.18 5.4.231 5.5.19 5.6.19 5.7.19 5.8.18 5.9.16 5.10.167 5.11.=
22
> > 5.12.19 5.13.19 5.14.21 5.15.93 5.16.20 5.17.15 5.18.19 5.19.17 6.0.19
> > 6.1.11
> > =

> > Version 5.2, as far as I could work it out, is the version that introdu=
ced
> > the pahole dependency when CONFIG_DEBUG_INFO_BTF is set.
> > =

> > None-LTS versions after 5.10 and before 5.19 fail with:
> >   LD      vmlinux.o
> >   MODPOST vmlinux.symvers
> >   MODINFO modules.builtin.modinfo
> >   GEN     modules.builtin
> >   LD      .tmp_vmlinux.btf
> >   BTF     .btf.vmlinux.bin.o
> >   LD      .tmp_vmlinux.kallsyms1
> >   KSYMS   .tmp_vmlinux.kallsyms1.S
> >   AS      .tmp_vmlinux.kallsyms1.S
> >   LD      .tmp_vmlinux.kallsyms2
> >   KSYMS   .tmp_vmlinux.kallsyms2.S
> >   AS      .tmp_vmlinux.kallsyms2.S
> >   LD      vmlinux
> >   BTFIDS  vmlinux
> > =

> > FAILED: load BTF from vmlinux: Invalid argument
> > make[2]: *** [Makefile:1177: vmlinux] Error 255
> > make[1]: *** [package/pkg-generic.mk:293:
> > /home/d.lang/ws/other/buildroot/output/build/linux-5.11.22/.stamp_built]
> > Error 2 make: *** [Makefile:82: _all] Error 2
> > =

> > These version miss BTF_KIND_ENUM64 support and require a patch [0] that
> > has
> > been added to LTS versions.
> > =

> > [0]:
> > https://lore.kernel.org/bpf/20221019085604.1017583-6-jolsa@kernel.org/
> > =

> > Signed-off-by: Daniel Lang <d.lang@abatec.at>
> > ---
> > =

> >  linux/linux.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/linux/linux.mk b/linux/linux.mk
> > index 7645b5f507..03d89cd204 100644
> > --- a/linux/linux.mk
> > +++ b/linux/linux.mk
> > @@ -150,7 +150,7 @@ endif
> > =

> >  # Disable building host tools with -Werror: newer gcc versions can be
> >  # extra picky about some code
> > =

> > (https://bugs.busybox.net/show_bug.cgi?id=3D14826) LINUX_MAKE_FLAGS =3D=
 \
> > -	HOSTCC=3D"$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
> > +	HOSTCC=3D"$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem
> > /,$(HOST_CFLAGS))) $(HOST_LDFLAGS)" \ ARCH=3D$(KERNEL_ARCH) \
> > =

> >  	INSTALL_MOD_PATH=3D$(TARGET_DIR) \
> >  	CROSS_COMPILE=3D"$(TARGET_CROSS)" \
> =

> Best regards.


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFAEC54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 12:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC0E681E0A;
	Sun,  1 Jun 2025 12:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wbWxO2aqdpF2; Sun,  1 Jun 2025 12:59:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0697981DFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0697981DFE;
	Sun,  1 Jun 2025 12:59:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D91D1F7
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 12:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1ECC46087F
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 12:59:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5bqPL9e66hiT for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 12:59:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.109;
 helo=smtp-outgoing-2002.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EAB81606E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAB81606E8
Received: from smtp-outgoing-2002.laposte.net (smtp-outgoing-2002.laposte.net
 [160.92.124.109])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EAB81606E8
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 12:59:06 +0000 (UTC)
X-mail-filterd: {"version":"1.9.1","queueID":"4b9H9L6BYyzWf0M","contextId":
 "f661d55b-2f82-475f-8391-023523818227"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0107.laposte.net (SMTP Server) with ESMTP id 4b9H9L6BYyzWf0M;
 Sun,  1 Jun 2025 14:59:02 +0200 (CEST)
X-mail-filterd: {"version":"1.9.1","queueID":"4b9H9L517WzWf07","contextId":
 "ce2d5132-aa13-4eb5-8c78-7bc3b015c97f"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net
 [88.169.129.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mlpnf0107.laposte.net (SMTP Server) with ESMTPSA id 4b9H9L517WzWf07;
 Sun,  1 Jun 2025 14:59:02 +0200 (CEST)
Received: by romuald.bergerie (Postfix, from userid 1000)
 id 55F6F67525EE; Sun, 01 Jun 2025 14:59:13 +0200 (CEST)
Date: Sun, 1 Jun 2025 14:59:13 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <aDxOoa4O0rMuMaIw@romuald.bergerie>
Mail-Followup-To: Romain Naour <romain.naour@smile.fr>,
 buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250523174313.7056-1-vincent.stehle@laposte.net>
 <20250523174313.7056-6-vincent.stehle@laposte.net>
 <a1c7723c-0cef-4c11-9566-99fefde68738@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a1c7723c-0cef-4c11-9566-99fefde68738@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1748782744;
 bh=mCkgnr3+OZtel0Y0+gN1gBI3dQ6vl2Q5JDDc00QEExA=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:Content-Transfer-Encoding;
 b=qAMp+lZ24Jz4O8dTUq0O6zS0T/S1a8lUbIExVx7DghPmc6rDtzN7QLKzZab7Fybrpwb+ZxyoaFbmQ3hykIO+EkwXq4soY0KJqBcmOfVnXUS4d/BPVipYLPPeEsF5D8s73nhgeUcfaYwm7B1UagYrB9baVJum352eCCShJkYE2oWurAy4PUSkMCEs8ZWx803t7SUpbnsK6vyI1sMXD4N47dBKmNqa7aubu/Et7Vf/ve8ub4w7GpDelNbZ2O09vVYwRDRQR/SsnbA2TFSp1Iui83eLZASqrsr1yBLzVjTjNsC2DZnWve7Gg8kCc+nCACCNPkMVFZ+jeWfnL4biutV+nw==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256
 header.s=lpn-wlmd header.b=qAMp+lZ2
Subject: Re: [Buildroot] [PATCH 5/5] configs/qemu_hppa_b160l: new defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Vincent_Stehl=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, May 23, 2025 at 10:53:55PM +0200, Romain Naour wrote:
> Hello Vincent, All,

Dear Romain,

Thank you very much for reviewing and testing!
I will fix everything that you reported and send a v2 soon.

Best regards,
Vincent.

> =

> Le 23/05/2025 =E0 19:43, Vincent Stehl=E9 via buildroot a =E9crit=A0:
> > Add a defconfig to run Linux on a HP Visualize B160L PA-RISC Workstatio=
n,
> > emulated with Qemu.
> > =

> > While at it, add myself in DEVELOPERS.
> =

> # uname -a
> Linux buildroot 6.12.27-32bit #1 SMP Fri May 23 20:22:04 UTC 2025 parisc =
GNU/Linux
> =

> # cat /proc/cpuinfo
> processor	: 0
> cpu family	: PA-RISC 1.1e
> cpu		: PA7300LC (PCX-L2)
> cpu MHz		: 250.000000
> physical id	: 0
> siblings	: 1
> core id		: 0
> capabilities	: os32 nva_supported (0x02)
> model		: 9000/778/B160L - Merlin L2 160 (9000/778/B160L)
> [...]
> =

> Well, it works maybe the next step is to add GNU/Hurd support in Buildroo=
t ? :)
> =

> Best regards,
> Romain
> =

> =

> > =

> > Signed-off-by: Vincent Stehl=E9 <vincent.stehle@laposte.net>
> > Cc: Romain Naour <romain.naour@gmail.com>
> > ---
> >  DEVELOPERS                        |  2 ++
> >  board/qemu/hppa-b160l/readme.txt  | 31 +++++++++++++++++++++++++++++++
> >  configs/qemu_hppa_b160l_defconfig | 18 ++++++++++++++++++
> >  3 files changed, 51 insertions(+)
> >  create mode 100644 board/qemu/hppa-b160l/readme.txt
> >  create mode 100644 configs/qemu_hppa_b160l_defconfig
> > =

> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 47f3e030e5..f185307f60 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -3385,8 +3385,10 @@ F:	arch/Config.in.hppa
> >  F:	arch/arch.mk.hppa
> >  F:	board/arm/foundation-v8/
> >  F:	board/bananapi/bananapi-m2-zero/
> > +F:	board/qemu/hppa-b160l/
> >  F:	configs/arm_foundationv8_defconfig
> >  F:	configs/bananapi_m2_zero_defconfig
> > +F:	configs/qemu_hppa_b160l_defconfig
> >  F:	configs/uevm5432_defconfig
> >  F:	package/i7z/
> >  F:	package/msr-tools/
> > diff --git a/board/qemu/hppa-b160l/readme.txt b/board/qemu/hppa-b160l/r=
eadme.txt
> > new file mode 100644
> > index 0000000000..75e50e451b
> > --- /dev/null
> > +++ b/board/qemu/hppa-b160l/readme.txt
> > @@ -0,0 +1,31 @@
> > +Introduction
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The qemu_hppa_b160l_defconfig is meant to run Linux on a HP Visualize =
B160L
> > +PA-RISC Workstation, emulated with Qemu.
> > +
> > +Building
> > +=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +  $ make qemu_hppa_b160l_defconfig
> > +  $ make
> > +
> > +Generated files under output/images:
> > +
> > +* rootfs.ext4: the root filesystem.
> > +* vmlinux: the Linux kernel.
> > +
> > +Running under Qemu
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Run the emulation with:
> > +
> > +  qemu-system-hppa \
> > +      -machine B160L \
> > +      -append "rootwait root=3D/dev/sda" \
> > +      -hda output/images/rootfs.ext4 \
> > +      -kernel output/images/vmlinux \
> > +      -nographic \
> > +      -smp 2 # qemu_hppa_b160l_defconfig
> > +
> > +The login prompt will appear in the terminal that started Qemu.
> > diff --git a/configs/qemu_hppa_b160l_defconfig b/configs/qemu_hppa_b160=
l_defconfig
> > new file mode 100644
> > index 0000000000..188f195f76
> > --- /dev/null
> > +++ b/configs/qemu_hppa_b160l_defconfig
> > @@ -0,0 +1,18 @@
> > +BR2_hppa=3Dy
> > +BR2_parisc11=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=3Dy
> > +BR2_GLOBAL_PATCH_DIR=3D"board/qemu/patches"
> > +BR2_DOWNLOAD_FORCE_CHECK_HASHES=3Dy
> > +BR2_SYSTEM_DHCP=3D"eth0"
> > +BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> > +BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> > +BR2_LINUX_KERNEL=3Dy
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.12.27"
> > +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy
> > +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
> > +BR2_TARGET_ROOTFS_EXT2=3Dy
> > +BR2_TARGET_ROOTFS_EXT2_4=3Dy
> > +# BR2_TARGET_ROOTFS_TAR is not set
> > +BR2_PACKAGE_HOST_QEMU=3Dy
> > +BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=3Dy
> =

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

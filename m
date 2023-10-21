Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5104CC001E0
	for <buildroot@archiver.kernel.org>; Sat, 21 Oct 2023 15:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE0B384FBE;
	Sat, 21 Oct 2023 15:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE0B384FBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OrI9a6ZCWT0N; Sat, 21 Oct 2023 15:21:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D558284FC1;
	Sat, 21 Oct 2023 15:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D558284FC1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDBD31BF41C
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 15:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B64B160FB9
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 15:21:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B64B160FB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZNSzT5m5Qj_b for <buildroot@lists.busybox.net>;
 Sat, 21 Oct 2023 15:21:21 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DC4060A65
 for <buildroot@buildroot.org>; Sat, 21 Oct 2023 15:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DC4060A65
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-507bd64814fso2598947e87.1
 for <buildroot@buildroot.org>; Sat, 21 Oct 2023 08:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697901679; x=1698506479;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Fc4QF24ooyyO92Q60h8TTVxbPlu3h26TZ1dfqMY/7o=;
 b=bmKJBNn0iN27A5EK0c6Rmfkuxy3sUBRlq8Ig7ygDFY5PwPFQu6hMJsNCdWb4i/zbVN
 21uzUjLHZugWpZBtTruUltaGFVoSOzHEEkMK6psO9OecInS3feSho3sla0xrcPfVDGIO
 yEBw7g29I/Nlk4oQibZIfrsLfuqosr26y9/h3jadeGSPCwt9MlX3BRB86SoZvokv3rHI
 pEObTHYxZSxqx0txG+xlZ2prp09BcQu5cw4b9Ex2jsLiBM6rnW9aEou0gQG7VNhgD3NW
 Mr4TZEaBfv3I+ENVU8xQAChlajtICG4wypNH8Sz+mLw7EXuqzcGsTby4PBQEiVbiGOTX
 /Aog==
X-Gm-Message-State: AOJu0Yx34s7EKvP0w60FkXFy+dSPpu/gvgi9t4F6pXh/k/35C+W/7F8U
 OCfBHkYbUhV9SoTyYNdqdFg=
X-Google-Smtp-Source: AGHT+IHX4BGLUx6bh9x9G8DNBMNlJQMSg5k7yta6QAbARiSpDoAAwdEOrHum/PnP7L3NxnSoVthMsg==
X-Received: by 2002:a19:4f04:0:b0:507:a001:792e with SMTP id
 d4-20020a194f04000000b00507a001792emr3263210lfb.46.1697901679007; 
 Sat, 21 Oct 2023 08:21:19 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 w17-20020ac25991000000b00500cede2786sm897043lfn.65.2023.10.21.08.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Oct 2023 08:21:18 -0700 (PDT)
Date: Sat, 21 Oct 2023 17:25:22 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZTPtYruqfAvaqHCj@gmail.com>
References: <20231020060236.3725194-1-marcus.folkesson@gmail.com>
 <7a3a5533d8fc664535be030d5d1242f1@free.fr>
MIME-Version: 1.0
In-Reply-To: <7a3a5533d8fc664535be030d5d1242f1@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697901679; x=1698506479; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3Fc4QF24ooyyO92Q60h8TTVxbPlu3h26TZ1dfqMY/7o=;
 b=YkM0Zy0ZEtisNhE/AcuuVQPn33suzdSKXrOi4mGnbwBGmjs5DH50t/UxaOH2rZX8/y
 jvJmDGR1eMEasKbNHVnESL6u3r6YSemIXgtzjVMMkwh0hTyfJ34asm4G5xNN2DBVcr4x
 i2u2kCuPa4qdr68VsO5rGbmcrNo8Nv7Xc1aRVjk1i17Ev7ulJA+jvgWPd6EDFq3HfwzX
 wiabpty4x8xhMUiFr4EN8x8UUb9bWhsAXPeC+z3n9owLiNM6Az39XT7H/lKgv4GpwFR+
 HV6tZjGFAy7niJnzLTql3js/3hW2werUYruwIHLc+9Qte/1cgVcq4TFCoKcOGcLzvaHg
 U1lA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YkM0Zy0Z
Subject: Re: [Buildroot] [PATCH v4] package/criu: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5248438926355636829=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============5248438926355636829==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xHUemHXJsZF4kqF7"
Content-Disposition: inline


--xHUemHXJsZF4kqF7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Julien,

Thank you for your solid review!

I will apply all changes you suggested.

On Sat, Oct 21, 2023 at 01:15:10PM +0200, Julien Olivain wrote:
> Hi Marcus,
>=20
> Thanks for the updated patch!
>=20

[...]
>            bootlin-x86-64-uclibc [26/45]: FAILED
>=20
> Build fails with output:
>=20
>     criu/fsnotify.c:18:10: fatal error: aio.h: No such file or directory
>        18 | #include <aio.h>
>           |          ^~~~~~~

Not sure that to do about this. It already depends on libaio.
>=20
>            bootlin-xtensa-uclibc [27/45]: SKIPPED
>                     br-arm-basic [28/45]: SKIPPED
>             br-arm-full-nothread [29/45]: SKIPPED
>               br-arm-full-static [30/45]: SKIPPED
>            br-i386-pentium4-full [31/45]: FAILED
>=20

[...]

>=20
>               br-mips64-n64-full [33/45]: SKIPPED
>          br-mips64r6-el-hf-glibc [34/45]: SKIPPED
>        br-powerpc-603e-basic-cpp [35/45]: SKIPPED
>        br-powerpc64-power7-glibc [36/45]: FAILED
>=20
> Build fails with output:
>=20
>     In file included from compel/plugins/std/infect.c:14:
>     compel/include/uapi/compel/asm/sigframe.h:27:2: error: #error Only
> supporting ABIv2.
>        27 | #error Only supporting ABIv2.
>           |  ^~~~~

I will only support PPC64 with LE. The GCC says that:
`
-mabi=3Delfv1
Change the current ABI to use the ELFv1 ABI. This is the default ABI for bi=
g-endian PowerPC 64-bit Linux. Overriding the default ABI requires special =
system support and is likely to fail in spectacular ways.

-mabi=3Delfv2
Change the current ABI to use the ELFv2 ABI. This is the default ABI for li=
ttle-endian PowerPC 64-bit Linux. Overriding the default ABI requires speci=
al system support and is likely to fail in spectacular ways.
`

[...]
>                    sourcery-mips [44/45]: FAILED
>=20
> Fails with output:
>=20
>     compel/arch/mips/plugins/std/memcpy.S: Assembler messages:
>     compel/arch/mips/plugins/std/memcpy.S:7: Error: opcode not supported =
on
> this processor: mips32r2 (mips32r2) 'dadd $2,$0,$4'
>     compel/arch/mips/plugins/std/memcpy.S:8: Error: opcode not supported =
on
> this processor: mips32r2 (mips32r2) 'daddiu $13,$0,0'
>     compel/arch/mips/plugins/std/memcpy.S:14: Error: opcode not supported=
 on
> this processor: mips32r2 (mips32r2) 'daddiu $13,$13,1'
>     compel/arch/mips/plugins/std/memcpy.S:15: Error: opcode not supported=
 on
> this processor: mips32r2 (mips32r2) 'daddiu $4,$4,1'
>     compel/arch/mips/plugins/std/memcpy.S:16: Error: opcode not supported=
 on
> this processor: mips32r2 (mips32r2) 'daddiu $5,$5,1'
>=20
> There is maybe few extra condtions missing in the _ARCH_SUPPORTS for mips.

Hrm, will have a look. Thanks.
>=20
>                   sourcery-nios2 [45/45]: SKIPPED
> 45 builds, 29 skipped, 10 build failed, 0 legal-info failed, 0 show-info
> failed
>=20
> To test thoroughly your package with a specific list of toolchains, you c=
an
> use the
> following commands:
>=20
>     cp support/config-fragments/autobuild/toolchain-configs.csv
> criu-toolchains.csv
>     # edit criu-toolchains.csv to keep your toolchains of interest.
>     utils/test-pkg -a -t criu-toolchains.csv -c criu.config -p criu
>=20
> This will retest only the toolchains kept in the csv.

Thanks for the tip!

[...]
> > +
> > +menuconfig BR2_PACKAGE_CRIU
> > +	bool "criu"
> > +	depends on BR2_PACKAGE_CRIU_ARCH_SUPPORTS
> > +	depends on BR2_PACKAGE_HOST_PYTHON3 # host-python3-ssl
> > +	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
> > +	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> > +	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
> > +	depends on BR2_INSTALL_LIBSTDCPP # protobuf
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, libnl
>=20
> A dependency on kernel header >=3D 4.18 should be added:
>=20
>     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18 # rseq.h


This makes the bootlin-x86-64-musl test to be skipped as it has
BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 at highest.

The build used to succeed though :-/

[...]
> > +######################################################################=
##########
> > +#
> > +# CRIU
> > +#
> > +######################################################################=
##########
> > +
> > +CRIU_VERSION =3D 3.18
> > +CRIU_SITE =3D $(call github,checkpoint-restore,criu,v$(CRIU_VERSION))
> > +
> > +CRIU_LICENSE =3D GPL-2.0
> > +CRIU_LICENSE_FILES =3D COPYING
> > +CRIU_DEPENDENCIES =3D\
> > +	host-pkgconf \
> > +	host-protobuf-c \
> > +	host-python3 \
> > +	host-python-pip \
> > +	libaio \
> > +	libbsd \
> > +	libcap \
> > +	libnet \
> > +	libnl \
> > +	protobuf \
> > +	protobuf-c \
> > +	python3
> > +
> > +CRIU_MAKE_ENV =3D\
> > +	$(TARGET_MAKE_ENV) \
> > +	$(TARGET_CONFIGURE_OPTS) \
> > +	CROSS_COMPILE=3D$(TARGET_CROSS) \
> > +	WERROR=3D0
> > +
> > +#x86_64 is treated as x86 in criu
> > +#Also, powerpc64 is refered to as ppc64 in criu.
>=20
> There is possibly some rework needed here to fix architecture
> related build failures described earlier.
>=20

I will go for $(BR2_NORMALIZED_ARCH) instead of $(BR2_ARCH), it will
solve the most of these type of errors.

>=20
> Best regards,
>=20
> Julien.

--xHUemHXJsZF4kqF7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmUz7V4ACgkQiIBOb1ld
UjJnqxAAumDPu4XHZ62RT5c27tCHpzslmmfE5CIMdB65AbARU0iC9TZky4QrXiT8
4EdRjMYw3sdpVlZGZA+DJFWQLH2YBKV5J1N8aSdMFSmtn7GP1ZpK8cMSU27FGWZH
OMR+n9JCPkiuvSNZzGO/eSMaAkJ288WxMv6RK77q+UnPagK/p+ZgRNUo0lvlVA0u
1nvhugzo0Mh2JxUjzU5yexH469/AzmBukuF3nHTrGQMgG/OZrXvv46Eqr7SHHwh0
UeAt5yFWOs5owWhJdhNtewLX4MKJ+POTZr/ATo2dESnwNV+hx3/W11gOY9FCHUGM
fTKBPq1/H+wInhT5kS+HauNBooEraPw1kUfPVE7drjVYjO+w5ICYQz4W5Q+Xppsa
IFznGGLXr0Yd/lvLljLyBnFllQPpt9IU2RU4W8ixQXjtaHVBNDsvlYIwC8rOZz6H
D+dWYYBKcZSImLqHUZbT/ejQxRcEu+qKbw8uf65SI5XbvZINgPfIkJw93ujp3eKf
SPUr+DGxddpvotsM2QKlK3QoGEvbD71mBwXXL3OJ9Mi01xZb/isGS2tnfQvkz8FC
JfFn4SLyDvka7Js9jBASHCHYLOqW+qnuT3FT+L+br61+jjd0rdAg8yQ6ojY0C+/W
YwTx3yu/w40EzIpyqMvSldrnYFTDigSqwQ2J79YyXvmKFzRqstg=
=56rh
-----END PGP SIGNATURE-----

--xHUemHXJsZF4kqF7--

--===============5248438926355636829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5248438926355636829==--

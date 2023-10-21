Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859C5C004C0
	for <buildroot@archiver.kernel.org>; Sat, 21 Oct 2023 16:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D76CD4F2EA;
	Sat, 21 Oct 2023 16:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D76CD4F2EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KC2YjaJAdvE9; Sat, 21 Oct 2023 16:23:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2D764F2EB;
	Sat, 21 Oct 2023 16:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2D764F2EB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 758651BF34B
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 16:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E93660F7A
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 16:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E93660F7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IVRihNG7JYNB for <buildroot@lists.busybox.net>;
 Sat, 21 Oct 2023 16:22:59 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A04B60F2D
 for <buildroot@buildroot.org>; Sat, 21 Oct 2023 16:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A04B60F2D
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c509f2c46cso26484101fa.1
 for <buildroot@buildroot.org>; Sat, 21 Oct 2023 09:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697905377; x=1698510177;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lRYMxqO2Kra8q2T72JlylgVP1GkDBffqxXgurXwlW4M=;
 b=Wq0TQn0fpwMcy6C+Zqm8MGbxu8mffLUvPKwn424OV7a/lRReEqIi5HQxc26o+BEIS9
 b0qMf1b5WEkP4cnBaRXr9tvgro2740xQe1INF8kcAxhSKGgtqjmXjPzPD4VG5qv1TpAP
 nfMhieCp77gpoNR5uYxgboi1sC4nrvJkcMR639iI4D/a5WsZ7qpYaxs2yxfXXzHx5LY5
 i4/yoAHZYfccsRQ3tBTpj91TnCkLuaiiqZ3d1zQoMMAbE7v2IRBaNTdxEnQ+mI+35dMz
 ofv7BLeRHKTk9BDSlgrdOi9DL+kd/uIG8fUYNM9TsEqZaU1UhAbIFdWz97qtHgzVdtuM
 9TrA==
X-Gm-Message-State: AOJu0Yz8jOK43WRgWruYgrtdCsyrlZxT9a/tsonMYQyUy9LlBHFd9gfp
 lZkXVkubjUKPUdX+xhoahqBzTIL4EV4=
X-Google-Smtp-Source: AGHT+IEcCZIYmVoYVrjfDqRTOWvL/cuvzcGpwUbTPnC8U705FkNJajXu4LCF1maWjImmJEB+8f3Ckg==
X-Received: by 2002:a2e:a99e:0:b0:2c5:31e6:e8e2 with SMTP id
 x30-20020a2ea99e000000b002c531e6e8e2mr3551965ljq.25.1697905376500; 
 Sat, 21 Oct 2023 09:22:56 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a2ea4aa000000b002c50ba4a047sm877569ljm.80.2023.10.21.09.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Oct 2023 09:22:55 -0700 (PDT)
Date: Sat, 21 Oct 2023 18:27:00 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZTP71KY22hz0U3fT@gmail.com>
References: <20231020060236.3725194-1-marcus.folkesson@gmail.com>
 <7a3a5533d8fc664535be030d5d1242f1@free.fr>
MIME-Version: 1.0
In-Reply-To: <7a3a5533d8fc664535be030d5d1242f1@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697905377; x=1698510177; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lRYMxqO2Kra8q2T72JlylgVP1GkDBffqxXgurXwlW4M=;
 b=SzWWx/f7izjOxza8ltJnFtieTF1t3RlAaw6MP41XRpYxfozds6UtW9j8pSJ792F57F
 Vgu+6Kh2UDAZdGiAeVFPApDt1nCkaTHu/BM7oYBrbcDWPu5nn29Yr1KyBo+ZlKNrpaHQ
 YPW3MYBsXCMbxyqjSTnq0f6MBtEfbndhPsdBQAPk50kFYMBZZtjKC2OjwfOqFECZHjeY
 7bowQRmS5MbrnIn4m92MN5hkM4hwLVAQvf9r5kQmRaOKPGNwJ12fuQ9IFNg3VbQoKu9B
 Ka+NEJwbEAU10jutzUE/MYebZnzm9XCWHbJtiLsw3uD6qV2c07HkJbBEV7e8VvW7VwBN
 JzyA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SzWWx/f7
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
Content-Type: multipart/mixed; boundary="===============1419825664742374401=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1419825664742374401==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4eBhfCov3T87iBbr"
Content-Disposition: inline


--4eBhfCov3T87iBbr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi again,

On Sat, Oct 21, 2023 at 01:15:10PM +0200, Julien Olivain wrote:
> Hi Marcus,
>=20
> Thanks for the updated patch!
>=20
> I confirm the normal test-pkg is passing. Then, I ran a "test-pkg -a"
> (which test more toolchains/arches) and observed few new minor
> failures. I'll comment a bit each failures and provide hints for
> improvements, when possible.
>=20
>     cat >criu.config <<EOF
>     BR2_PACKAGE_HOST_PYTHON3=3Dy
>     BR2_PACKAGE_CRIU=3Dy
>     EOF
>     utils/test-pkg -a -c criu.config -p criu
>                      arm-aarch64 [ 1/45]: OK
>            bootlin-aarch64-glibc [ 2/45]: FAILED
>=20
> criu uses restartable sequences, see:
> https://github.com/checkpoint-restore/criu/blob/v3.18/criu/include/linux/=
rseq.h#L7
>=20
> Criu seems to have a header detection on "sys/rseq.h" (i.e. on the
> libc side). But the sys/rseq.h then includes linux/rseq.h (i.e. on the
> kernel side), which is not checked. Some configurations like
> bootlin-aarch64-glibc includes the glibc header, but also have older
> kernel. Restartable sequences were introduced in kernel >=3D 4.18. So
> this can be handled by adding a dependency on kernel.
>=20
>        bootlin-arcle-hs38-uclibc [ 3/45]: SKIPPED
>             bootlin-armv5-uclibc [ 4/45]: SKIPPED
>              bootlin-armv7-glibc [ 5/45]: OK
>            bootlin-armv7m-uclibc [ 6/45]: SKIPPED
>               bootlin-armv7-musl [ 7/45]: OK
>         bootlin-m68k-5208-uclibc [ 8/45]: SKIPPED
>        bootlin-m68k-68040-uclibc [ 9/45]: SKIPPED
>      bootlin-microblazeel-uclibc [10/45]: SKIPPED
>         bootlin-mipsel32r6-glibc [11/45]: SKIPPED
>            bootlin-mipsel-uclibc [12/45]: SKIPPED
>              bootlin-nios2-glibc [13/45]: SKIPPED
>          bootlin-openrisc-uclibc [14/45]: SKIPPED
> bootlin-powerpc64le-power8-glibc [15/45]: SKIPPED
>    bootlin-powerpc-e500mc-uclibc [16/45]: SKIPPED
>            bootlin-riscv32-glibc [17/45]: SKIPPED
>            bootlin-riscv64-glibc [18/45]: SKIPPED
>             bootlin-riscv64-musl [19/45]: SKIPPED
>          bootlin-s390x-z13-glibc [20/45]: FAILED
>=20
> Build fails with output:
>=20
>     Makefile:23: *** "The architecture s390x isn't supported".  Stop.

Another problem that occured...
After I use $(BR2_NORMALIZED_ARCH) instead of $(BR2_ARCH), the arch
is at least supported. But it fails with

Error (compel/src/lib/handle-elf-host.c:161): Unsupported header detected
make[3]: *** [criu/pie/Makefile:58: criu/pie/parasite-blob.h] Error 255

After some more investigation, it ended up here:

static bool is_header_supported(Elf_Ehdr *hdr)
{
	if (!arch_is_machine_supported(hdr->e_machine))
		return false;
	if ((hdr->e_type !=3D ET_REL
#ifdef NO_RELOCS
	     && hdr->e_type !=3D ET_EXEC
#endif
	     ) ||
	    hdr->e_version !=3D EV_CURRENT)
		return false;
	return true;
}

I've added debug trace to see why it fails and got this:
Error (compel/src/lib/handle-elf-host.c:155): 	type 0x100 machine 0x1600 ve=
rsion 0x1000000
Error (compel/src/lib/handle-elf-host.c:158): 	ET_REL 0x1 EM_s390 0x16, EV_=
CURRENT 0x1

It is a tool that runs on host (little endian), but read data of an elf
compiled for s390 (big endian), so bytes is read swapped.

Right now I thinking of not list s390 as a compatible architecture for
this package.

Do you think it is reasonable?


/Marcus

--4eBhfCov3T87iBbr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmUz+88ACgkQiIBOb1ld
UjLxMhAAlz5hVndP4aZGGepUOoGfjzddC22Fp3J/CiSWzX3CUlnAMx6T/GBRvcjB
z9XgU65m7UZST+HG3o6/zDoCFEoZW1oU3GMoGEKJNiohCFBZMqxSm2LXLx+3NR+a
SocEulRJX32EVY+R1Z1aXpcCiejlwQyRgrjPF7bMJjoCSF7RgV/IJCEcWYaz/TPQ
Jf3rzTQ57cj6NSLwnch0DeAyrx5Oi14ipV/x03mQpofME03cO93qp0u6QBF7LAp1
pMvnnva3WLzKdgOT8OD8jn1b+sW81OahPmJkat/SKwrEHlBIlYMcNaAGfJcerigp
abQQ5K8EhtbVvw7L6NR7bRn+Aq4Z+x+hU63bsVMeas1BcROJYlqxsPCi1KOngrES
a2dBD2mTSVd8orjmqJkhpXk2M4kLK8aBbgJ7GJnsEpJP2JgB6PzJarQ3nMRjLLoE
kqdnlnNTK1sO1pZX2xLGfLykSXhSSFSFDCoHre/SF3Tu4axGSBa+YSCBJRcHlHRX
D6mHKtzzszQ81YzhODjhXBWUbeocqZkmkMfXsqOur0YTSPJCsCiFm42ibUtAFxDV
U6kHXRIsAnigXMxuQaFsIB6NizD54xsXw6QULJ+EylDpPQ1oDKpPgTJd0bGiancv
FJYSond70sB27ZlEfOjR5BcuCARbf1It1Zu0q5OtSQH9sE3cJTU=
=BSOC
-----END PGP SIGNATURE-----

--4eBhfCov3T87iBbr--

--===============1419825664742374401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1419825664742374401==--

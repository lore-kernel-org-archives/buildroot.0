Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EBC606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 10:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Po26AKGY
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7595B40B1D;
	Sat, 31 Oct 2026 10:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KenpimL30xOe; Sat, 31 Oct 2026 10:08:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2485640B2A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793441283;
	b=boQp7q86tdaKbFfcEKsIwNCCUfIkCdjG7h8UFe6O5TTRqYaqDltVZz/YBXp/B1BuPflU
	 uYW5wsAu0Zus21IFKMJjoF2UjuQK6TxA1apyCxfYVdeT+2CjAAER972n35fGNy5+8UbK8
	 rFS8jMlfY5f2TF7vrwVQIxQzv1O1CtD7HH53zf3B2qx+XuefI8AB5Yg69FwiVxFMDxYdI
	 sO4d8guTDJhDOMgLjcY49BAf+V4CZJiGdbojkHho+JHhS6aDFYYpFY5DY6S6DwyMfr+RF
	 koYxrprd5ODBcUBnRPzizucKNxulrprR+iWxxsUqLbADMatyNwktYRjjNyY+S39FGjQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793441283;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=gIxxLgt60rhjRM4suZ1Wv8ZlvLKY76+Cr1IZMJpd1I8=;
	b=Yjrx/czXCMtTFkBh0+7flEZeMvwnA+nz5ubsnMS5vk9OW6Eng+MWuvVZ6iYicZXYeUIZ
	 KSVD5HKfT+EIXcFAFfJbruLNmOWNh7r8ZK+ebksLNPNg+L/OoPLak8od93ULKouCWQF6V
	 KkBfOEEOWwEKAvWfzABYlyHIV9MCHoAU7n9gW+MXR14sTjNqmZs+rGwDMfKZVLvMxeGln
	 7sBqMchht7J6DAoG7SXYt/powheIbyBBUwPk69jQYnJlxZhWb3H+1IJPi+6RSw2sxTeW+
	 QpF9F3KztRhCTqoNolEVXVNfPvsj7sktCTHHGjjhzqee6yz5/SQdn3/OStTz67Uh4xw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793441283;
	bh=gIxxLgt60rhjRM4suZ1Wv8ZlvLKY76+Cr1IZMJpd1I8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Po26AKGYfdUbRGe/kYq06K4CLtyBUsuT6Vp1pRYeUO6N22mvZ3EpJM/K00tJVWXcs
	 46x9k0txF6BCAClaT8/Ip9CvaZ/4ekzAVY6iBaT/Irf96MYoJEypUbubmKytghNuQN
	 6HuRr3k1CTFBnTS88tEQogxZwSSs81RNFwmyXghjJmiq/C/tZiwPAgz6Zrp1mLHvFP
	 2zDYTPz8lxVg+DAC9FZ1OC0YOis91Bab9nmN1gc1iKk6rpR9MeR8ZCk94WFY8fQUAf
	 TskK0MlXGDS8cJfJ3OY7Pfd3kjwvUcpJsCTIHOYfWf08PMStjLS6jZnMP1ChDzOcF4
	 oFa1KFIJyIZ4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2485640B2A;
	Sat, 31 Oct 2026 10:08:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CDCC332A
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEF01607A0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:08:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ifte3J0vYI77 for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 10:08:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 195A06079D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793441280;
 b=m6lUtjjf9tTVvBexE/aDnctxvn6losbaQ/ENpHRcKwFK21R2Sh4T2ZA2+ozjr7DQl6xs
 lpq3OCI1auxLeFb2mUz5AITi0BGCCZS0Vc/Xl0o8DNuc2NNobQBlCWiPX07t6gn7yj4OQ
 wVz4tXSvb8VitWYsZhrUJWpa5L0oWu0D2QTkkwuhT9/fx++9SI8rPvmUe2pakK+XpzXlD
 H2Nbe/rtemySgaa7TYUj4kzJXCEpPFTUEXGKOm1SexH7AVrgn6X7/WTubvbp7Ux0cLQ+W
 Rew2mtD3a0eJkEpUlHgb0o3GF8GG35fMYPN5iER8WOEu5wKnP2lyrZaVx/M2M71AtzA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793441280;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=Fua9abHIx/W/SKnwml1tpW2fcrjH6rhOAbO8V3kSDtA=;
 b=VA4ZAfnZ1T5as1eXsOCZZaOEIacxLprAJwkW1VdvJ+WceucDJjZdqSY6UMEZ93YL6wXu
 btlbidQ1WedvnRLpNbIfAUF58getT0Hhs4jCPeQVUhUWcGyoGhraUpSSzQ0hBgE8AQTlT
 lEnmr1+pKdwUX2Osr3AbbqE296k5Y+iADpW53zXSQFte/ao6WAcDXkdkvOzieh8CSpVJI
 Sw2Sqx+yVYAHQYh25HgAnBfYmv4ElM2AeJKi8uq0yxiLFmo/BfRAQp5wLWrkmCNNY73qJ
 YaqiiMz9aZCvlCq+wNQcTdcYcTPeizpmyb0eapgY1gppjgQu39k9Deb09lnGPDvsIXw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lcRxe52f; 
 arc=none smtp.remote-ip=212.27.42.2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 195A06079D
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:07:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id EE9922003DD;
 Sat, 31 Oct 2026 11:07:55 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 31 Oct 2026 11:07:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 31 Oct 2026 11:07:55 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261030114225.2918102-1-angelo.compagnucci@gmail.com>
References: <20261030114225.2918102-1-angelo.compagnucci@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <ee837d5c08af9760a19d88f18da3e4aa@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-pillow: security bump to
 version 13.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,BOMB_FREEM,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Angelo,

Thanks for the patch.

On 30/10/2026 12:42, Angelo Compagnucci wrote:
> Fixes the following security issues:
> 
> - CVE-2026-96639, GHSA-v9pv-5gc8-w2m6: Stale native image storage 
> reused
>   after mode transitions
> - GHSA-5x8w-8jj5-q52h, GHSA-8g5g-8vmr-9782: JPEG decoder buffer 
> overflow
>   from scanlines wider than tile extents
> - CVE-2026-96644, GHSA-9v9v-9qvf-h2hj: WMF/EMF heap out-of-bounds read
>   from dimension truncation
> - CVE-2026-96637, GHSA-g842-9rc4-69pw: SPIDER decompression bomb bypass
>   via seek()
> - CVE-2026-96643, GHSA-g4qv-2jxx-769h: Unbounded Exif header 
> replacement
>   loop
> - CVE-2026-96778, GHSA-g7cr-3p24-7wf7: JPEG comment write after ICC
>   profile fills encoder buffer
> - GHSA-462x-pgg6-55fp, GHSA-c6hw-5grf-ff96: TIFF tile and YCbCr 
> decoding
>   out-of-bounds read from undersized libtiff buffers
> - GHSA-p4wg-p73j-c528: PDF parsing stack exhaustion from long trailer
>   chains and deep or cyclic page trees
> - CVE-2026-96640, GHSA-mrfp-p49p-3hf2: PDF append resource exhaustion
>   from repeated page tree references
> - GHSA-pchr-8j38-3x4p: TIFF encoder accepted an incorrectly sized
>   Colormap for non-8-bit images
> - GHSA-332p-7hrc-92wf: TIFF encoder heap buffer overflow when saving to
>   a file object
> - GHSA-xcvg-w56q-r89m: TIFF encoder heap buffer overflow when tags
>   override the image size
> - GHSA-xvh5-g6gv-559v: TIFF encoder memory disclosure and crash from
>   mismatched tag values
> - GHSA-q45j-58j2-45rg: TIFF decoding returned uninitialized memory for
>   short JPEG strips
> - GHSA-78g4-xqwv-q3g8: Bundled OpenJPEG heap buffer overflow when
>   reading tile-part data
> - GHSA-4rr5-89j8-mwwm: TIFF encoder use-after-free write
> - CVE-2026-96636, GHSA-p8hx-v2p6-rp84: MPO, DCX and MIC decompression
>   bomb bypass via seek()
> - GHSA-f2g6-542v-9j58: PDF page tree stack exhaustion via cyclic /Kids
>   reference
> - GHSA-5xm2-6676-qcp9: APNG decompression bomb bypass via delayed
>   disposal-frame sizing
> - CVE-2026-96642, GHSA-3j72-p6qg-6xp7: TarIO negative size field causes
>   infinite CPU-spin loop
> - CVE-2026-96638, GHSA-24rc-8hj2-v98c: BMP RLE decoder
>   memory-amplification denial of service
> - GHSA-gg2r-wvfm-q9rx: MSP RLE decoder expands a tiny file into
>   unbounded memory
> - GHSA-wqgw-9xfh-qf2g: TIFF and Exif IFD parsing memory and CPU
>   amplification from shared tag data
> - GHSA-jg86-v3jv-hrpm: Quadratic time when writing many objects to a 
> PDF
> - GHSA-254f-3936-288h: PdfParser unbounded recursion via deeply nested
>   objects
> - GHSA-rfgq-q3w2-pmv2: Image.quantize() crash from an empty target
>   palette
> - GHSA-xgh8-jp6q-p5x8: XBM header parsing regular expression denial of
>   service
> - GHSA-22hg-r758-rrw9, GHSA-74r2-7ff9-mjj2, GHSA-fc9g-5qg7-mf45: GIF
>   comment handling quadratic-time blowup from repeated concatenation
> - GHSA-27h8-gf7j-v5hc: Out-of-bounds read in rank-based filters for
>   zero-dimension images
> - CVE-2026-96641, GHSA-4rm8-3hmm-39fg: Integer underflow in PILfont 
> text
>   width calculation
> - GHSA-cp9v-662q-vvx9: Image.merge() buffer overflow when merging 
> 32-bit
>   images as narrower bands
> - GHSA-j4m9-6w36-pw47: Uninitialized glyph pointer freed on font
>   rendering error path
> - GHSA-7mwm-ghpf-9vrm: Double free in Image.transform() after an
>   allocation failure
> - GHSA-4558-3h8r-v8xp: P;2L and P;4L raw mode decoders read past the 
> end
>   of their input
> - GHSA-w889-685w-c8fh: EPS filename argument injection into Ghostscript
> - GHSA-65qm-jvmh-6pqg: GIF decompression bomb check used a size
>   discarded on failure
> - GHSA-vx6w-vv9f-6gvg: EPS decompression bomb bypass via Ghostscript
>   rendering
> - GHSA-58r4-6rv3-gfh8: ImageMorph.MorphOp.apply() out-of-bounds write 
> on
>   zero-width images
> 
> Fix the AVIF build option: Pillow names it avif, the -Clibavif setting
> was silently ignored, so AVIF support was only auto-detected instead of
> following BR2_PACKAGE_LIBAVIF.
> 
> Release notes:
> https://pillow.readthedocs.io/en/stable/releasenotes/13.0.0.html
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  package/python-pillow/python-pillow.hash | 4 ++--
>  package/python-pillow/python-pillow.mk   | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-pillow/python-pillow.hash 
> b/package/python-pillow/python-pillow.hash
> index 6f9c5d2cb1..2bc0206258 100644
> --- a/package/python-pillow/python-pillow.hash
> +++ b/package/python-pillow/python-pillow.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pillow/json
> -md5  c714771477fa686ba789092cf84234c7  pillow-12.3.0.tar.gz
> -sha256  
> 3b8182a766685eaa002637e28b4ec8d6b18819a0c71f579bf0dbaa5830297cce  
> pillow-12.3.0.tar.gz
> +md5  c774e5aef5897704ccd528d0781a9b37  pillow-13.0.0.tar.gz
> +sha256  
> cdcd1ba258178f7356d74170c9a81ba4eab6a5d55748bc402a5a2a6fe6be3510  
> pillow-13.0.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 15181e7363dca9aed78b79bebebc7fde7f1814b8bd311ea3b87ae8ccadfc185b  
> LICENSE
> diff --git a/package/python-pillow/python-pillow.mk 
> b/package/python-pillow/python-pillow.mk
> index 433cbae5e5..240353eda3 100644
> --- a/package/python-pillow/python-pillow.mk
> +++ b/package/python-pillow/python-pillow.mk
> @@ -4,8 +4,8 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_PILLOW_VERSION = 12.3.0
> -PYTHON_PILLOW_SITE = 
> https://files.pythonhosted.org/packages/1c/3d/bb7fca845737cf9d7dbde16ed1843984665ff2e0a518f5db43e77ec540b9
> +PYTHON_PILLOW_VERSION = 13.0.0
> +PYTHON_PILLOW_SITE = 
> https://files.pythonhosted.org/packages/ce/a4/9cc30690a394a8305e8be4c9036aa16d0dfddadd09079860b582f562496d

Trying to build this new version with commands:

cat >.config <<EOF
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PYTHON3=y
BR2_PYTHON_PILLOW=y
EOF
make olddefconfig
make python-pillow

fails with the error:

aarch64-none-linux-gnu-gcc: ERROR: unsafe header/library path used in 
cross-compilation: '-I/usr/include'

Could you have a look, please?

>  PYTHON_PILLOW_SOURCE = pillow-$(PYTHON_PILLOW_VERSION).tar.gz
>  PYTHON_PILLOW_LICENSE = MIT-CMU
>  PYTHON_PILLOW_LICENSE_FILES = LICENSE
> @@ -43,9 +43,9 @@ endif
> 
>  ifeq ($(BR2_PACKAGE_LIBAVIF),y)
>  PYTHON_PILLOW_DEPENDENCIES += libavif
> -PYTHON_PILLOW_BUILD_OPTS += -Clibavif=enable
> +PYTHON_PILLOW_BUILD_OPTS += -Cavif=enable
>  else
> -PYTHON_PILLOW_BUILD_OPTS += -Clibavif=disable
> +PYTHON_PILLOW_BUILD_OPTS += -Cavif=disable
>  endif
> 
>  ifeq ($(BR2_PACKAGE_LIBXCB),y)
> --
> 2.34.1

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7FDC04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 11:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ECD84235A;
	Sat, 11 May 2024 11:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dd6SkceiGIPG; Sat, 11 May 2024 11:43:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DE2541620
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DE2541620;
	Sat, 11 May 2024 11:43:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 03C501BF5A5
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 11:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4A2C400C7
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 11:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yZSSmj9EoDwn for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 11:43:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 658A0400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 658A0400BA
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 658A0400BA
 for <buildroot@buildroot.org>; Sat, 11 May 2024 11:43:05 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 235CB352111B; Sat, 11 May 2024 13:43:03 +0200 (CEST)
Date: Sat, 11 May 2024 13:43:02 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <Zj9Zxueq6fFSbCt8@waldemar-brodkorb.de>
References: <20240509170112.7381E86D42@busybox.osuosl.org>
 <20240511090009.11809921@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240511090009.11809921@windsurf>
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1715427783; bh=u09yvrH6LCF9tiAynNK6bbOdoBjpRndv/0L86UVJlyM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nMIRDi/YdBfaw+TvlrX/MbEYTWpuUZcLQwxSKxuVobDUzhuubc5xDzPqp5EpkH5nU
 Gl0i8jkxYLGUsjzvvBUzrR42o7OMvfsCXch+i4EQwEN2Vh9h7UZgPNtrxnSy6rm4Hm
 nh01NMZ/vzfCqSeID0EvC+Pa9XcWvKhcaYLakU6xnZeoGZUyPAOe2LQYNegi4qbhhh
 TVpRoZC0OuPvEVdrtv/b+zOqWqPf+z0ZO2SMKVSoPoPqSmAXyUIV3pYELppVcuU1d+
 dobrpLCjbQ3oiUESQwI/6M+3gqYhzlNdl2+gM1Yx626gqiS9U4H1rUEbXitM90XnoH
 jJDVcmQmKvS1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=nMIRDi/Y
Subject: Re: [Buildroot] [git commit] package/kodi: bump version to
 21.0-Omega
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

I have another build issue when compiling for uClibc-ng:

/home/wbx/buildroot/output/host/lib/gcc/aarch64-buildroot-linux-uclibc/12.3.0/../../../../aarch64-buildroot-linux-uclibc/bin/ld:
build/utils/utils.a(CharsetConverter.cpp.o): undefined reference to symbol 'libiconv_open'
/home/wbx/buildroot/output/host/lib/gcc/aarch64-buildroot-linux-uclibc/12.3.0/../../../../aarch64-buildroot-linux-uclibc/bin/ld:
/home/wbx/buildroot/output/host/aarch64-buildroot-linux-uclibc/sysroot/usr/lib64/libiconv.so.2:
error adding symbols: DSO missing from command line
collect2: error: ld returned 1 exit status
make[3]: *** [CMakeFiles/kodi.dir/build.make:535: kodi.bin] Error 1

What is the best fix for adding -liconv to the target LDFLAGS?

> Hello Bernd,
> 
> On Thu, 9 May 2024 19:00:54 +0200
> Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:
> 
> > Added new required dependency to libudfread: Since upstream commit
> > https://github.com/xbmc/xbmc/commit/5f9b9cfa26f274e381e92d73cfa33fb55582436e
> > kodi does not build anymore without libudfread.
> 
> There is a mistake in your patch on this, causing a build failure, see
> below.
> 
> >  	depends on !BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
> > @@ -56,6 +58,7 @@ menuconfig BR2_PACKAGE_KODI
> >  	depends on BR2_INSTALL_LIBSTDCPP
> >  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libass -> harfbuzz
> >  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # C++17
> > +	depends on BR2_HOST_GCC_AT_LEAST_9 # C++17
> >  	depends on BR2_TOOLCHAIN_HAS_THREADS
> >  	depends on !BR2_TOOLCHAIN_USES_MUSL
> >  	depends on BR2_USE_WCHAR
> > @@ -103,6 +106,7 @@ menuconfig BR2_PACKAGE_KODI
> >  	select BR2_PACKAGE_SQLITE
> >  	select BR2_PACKAGE_TAGLIB
> >  	select BR2_PACKAGE_TINYXML
> > +	select BR2_PACKAGE_TINYXML2
> >  	select BR2_PACKAGE_ZLIB
> >  	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC # runtime UTF conversion support
> >  	select BR2_PACKAGE_LIBINPUT if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
> > @@ -162,6 +166,7 @@ config BR2_PACKAGE_KODI_EVENTCLIENTS
> >  config BR2_PACKAGE_KODI_LIBBLURAY
> >  	bool "blu-ray"
> >  	select BR2_PACKAGE_LIBBLURAY
> > +	select BR2_PACKAGE_LIBUDFREAD
> 
> You're indeed adding the "select" on BR2_PACKAGE_LIBUDFREAD, but in a
> sub-option of kodi, BR2_PACKAGE_KODI_LIBBLURAY, while...
> 
> >  KODI_LICENSE = GPL-2.0
> > @@ -45,6 +45,7 @@ KODI_DEPENDENCIES = \
> >  	libfribidi \
> >  	libplist \
> >  	libpng \
> > +	libudfread \
> 
> here you're adding libudfread to the unconditional dependencies,
> unrelated to the sub-option.
> 
> Which one is correct? Having a sub-option, or marking libudfread a
> mandatory dependency whenever kodi is enabled?

Thanks
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

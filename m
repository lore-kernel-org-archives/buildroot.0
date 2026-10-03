Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399E2CA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 21:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 078CB6064C;
	Sat,  3 Oct 2026 21:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O2tV4LZitImo; Sat,  3 Oct 2026 21:19:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 27691606D3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791062392;
	b=SQLVXsvj2cZ+EkYTzV46GbXknrbWe3fTx62dpgAOhj3ZH7LY/VYu30S9XgjfhOMPcj8Z
	 XHzQ9EzuksoyJMG4X9+FS6R2swG18LtuzJTPPTf7+TUXCQYqzXH/XZKSDNcfFJJ1NS1s1
	 gYGRc/myszLKkAcr469UMPcyy2D5ZMUuy39sW/WjMNfz2pNrH74t17ZPZgvleJt3nvFPJ
	 E2BPcHPhC8SbB8HrXuiw/rFsOGC0YVj2PDLlPkvtrmRDxOqO0qa6bIpcTZDliCbJ/ULRj
	 07qobtT+OVAQ+NLvBbDWn8yn0plWfpM7ezKufjLijRqNZGhnaxOtcghTfZoLao1ZSIQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791062392;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=OV52rRrPJ5WIjlXFomKGTL7XhEHwDXzWna+qdfiZ0O0=;
	b=HJLTyp5UdOjGxUYjGlY5hUc8noZ+FM6SyP5uvWv8mazeC6fjlfO1kobvO+Q4K8Lj1jWV
	 BNjbYa0OjZJuJNTS1TKv1ljeJWehGBHPRlNBuRZNIWaaCcyn6eiy1aQzZRP42Tur1U452
	 pi6nValiS9dd0YBCPEEHBTN1jg5bTkOxEB7GGiMJQm7/Mf2ZoHClRWSHqD4cmHD05FGxH
	 /fbVnu3f5ASLQ1WosmoU2xjSqFxqPgm70VGlsM6VzIA44whOeoTLBUGOkqyUD/XlfdHBj
	 GUBGT78CaVPsdyVMZASy8leKncZnuV3XnSc+ZDf8q0INICALp99jccRQ55QtW1tMCoA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791062392;
	bh=OV52rRrPJ5WIjlXFomKGTL7XhEHwDXzWna+qdfiZ0O0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=avlEB1SY6l2B4Lvh5/griFnuwyOjxNkOGBNr+ZwmFRR4M80uqu5Cj3qi/HHe9q+hF
	 oTqoEvSwdISSedHGQr+wFsufQNRAW24M0/uTEAhuTqH8rP0eKv+bSSRgEKRH5I9KJw
	 DEovMa26WkpNEfStXjNqh5369KkgbPw7DQzGKsNbNZoGmpOjnAuhCd8GrOJ7zx8rCl
	 2rKqiAU/VJYgO2H7KMcoc115v33ML5vvXTLRltfgxQphiX6ztZ9DQquBtCIrvv8YjW
	 QhUQU4c3YdebOjqIOdEob1GoMzp5oqNvhXVoHHbW/7i7FW0doViwGM+BLe0UD5/qRm
	 ulZ6IMKxYeqSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27691606D3;
	Sat,  3 Oct 2026 21:19:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EF22A2E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4F3A4007E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kF8PjPsp2qdG for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 21:19:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org ABF1D40055
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791062388;
 b=dBy6GpUDusdqt4qXa528v48rSbQLtqS8PtQo1ed8QlMVNWmJy3caeZG1j4Mnpxn+z1kN
 33+WWy0dILoZMEpkWavOcAqEOGvaxyLv8yhjgm+d3Vm4ON8AKF22P/aluw7+Q1+2i7NGm
 cPZ7qj6Fi+OeQCIyfLijLY1cUFU343gcVL2JeRwez0OgpiXm4EJfzgn/ZbEWzLzIYWPdE
 hRK5HrzzkZD3JuJhfCDVIMR2n1SEm0W7jZ/WVKEJB+jsCFnURriKLcbIEuTkeFJUiUSJb
 8PZ06atNfEOd3VF1fXsXWgsULU/e2myiyrNtgwCZanP6OQPE+AQXmoaS6fmmYZHJacA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791062388;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=MVtzcRXFZDu6/SRCC2qz4o5UKst0H4/AYjpH+TA9/Zw=;
 b=jidc5Vc3Ee+cWTj4ahWPCxLsnRJU5WVDbvriPUvrlghydkTn60474Qcd1gTrZKUoYJVJ
 o/YKYLscUlrYENH3ccgFHI0dcBqLjGIE7zOmAvOXfafnB8Q2r8WjkKRTq+ZnDAz0yg9ZB
 2RL32iYSRSPl1tMSePkXQGiEs0MVp9htYO3uOXir2gJyS0wwzd/weBV6Ni6HPBgBRlScI
 1dYXdJgum3nVJN1rLU2jolRli/qduYHPSGWAVE246Gkus2JUTfUkSFLCv2XLC819g/YyN
 CGFRm0WMcni58ctN9w9ro9BSpA3JGVvu5Kp7reDQ2ippnflmnhuawSxyoozBbpkRMIg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RV9JpVz8; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABF1D40055
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:19:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 55C5A13F861;
 Sat,  3 Oct 2026 23:19:39 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:50784])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 03 Oct 2026 23:19:39 +0200
MIME-Version: 1.0
Date: Sat, 03 Oct 2026 23:19:39 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>, El Mehdi YOUNES
 <elmehdi.younes@smile.fr>, Joseph Kogut <joseph.kogut@gmail.com>, Romain
 Naour <romain.naour@gmail.com>, Valentin Korenblit
 <valentinkorenblit@gmail.com>
In-Reply-To: <20260920213906.905956-6-bernd@kuhls.net>
References: <20260920213906.905956-1-bernd@kuhls.net>
 <20260920213906.905956-6-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <169068322b16ebff3a18ef16c8a52373@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v2 6/6] package/{mesa3d,
 mesa3d-headers}: bump version to 26.2.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

Thanks for the patch.

On 20/09/2026 23:39, Bernd Kuhls wrote:
> https://lists.freedesktop.org/archives/mesa-announce/2026-September/000869.html
> https://lists.freedesktop.org/archives/mesa-announce/2026-September/000868.html
> https://lists.freedesktop.org/archives/mesa-announce/2026-August/000867.html
> https://lists.freedesktop.org/archives/mesa-announce/2026-August/000863.html
> 
> Removed patch which was applied to fix a build error with gcc < 13 seen
> with mesa 26.1.x.
> 
> Upstream commit
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/3f9451b54c42a37b41246de3ceea991111389c37
> added rusticl to the variable with_driver_using_cl which creates a new
> dependency to the precomp-compiler:
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.2.2/meson.build?ref_type=tags#L973
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
[...]
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 04112eea8e..d68988ff22 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -5,7 +5,7 @@
>  
> ################################################################################
> 
>  # When updating the version, please also update mesa3d-headers
> -MESA3D_VERSION = 26.1.8
> +MESA3D_VERSION = 26.2.3

The mesa3d runtime test (which is testing Rusticl) is failing
with this series. The issue can be reproduced with the command:

utils/docker-run support/testing/run-tests \
     -k -d dl -o output_folder \
     tests.package.test_mesa3d

The test fail at runtime because the opencl driver cannot loaded.

There is warnings in the execution log:

RUSTICL_ENABLE=llvmpipe clinfo
Libclc failed to load. Please make sure it is installed and provides
                 spirv-mesa3d-.spv and/or spirv64-mesa3d-.spv

and:

ICD loader properties
[...]
   ICD loader Profile                              OpenCL 3.0
         NOTE:   your OpenCL library only supports OpenCL 3.0,
                 but some installed platforms support OpenCL 3.1.
                 Programs using 3.1 features may crash
                 or behave unexpectedly

Note that other tests using mesa3d, such as test_weston, are working.

Could you have a look please?

>  MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
>  MESA3D_SITE = https://archive.mesa3d.org
>  MESA3D_LICENSE = MIT, SGI, Khronos
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

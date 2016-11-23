From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 23 Nov 2016 08:23:44 +0200
Subject: [Buildroot] [RFC] external toolchain scanner
In-Reply-To: <303be768-557b-3b02-c4fd-ae11ec2858ec@mentor.com>
References: <303be768-557b-3b02-c4fd-ae11ec2858ec@mentor.com>
Message-ID: <20161123062344.imch5hb3duepqgfz@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Hollis,

On Tue, Nov 22, 2016 at 05:32:51PM -0800, Hollis Blanchard wrote:
> It also works with multi-arch toolchains (this one from Mentor Graphics):
> 
>    aurora:buildroot$ ./support/scripts/scan-ext-toolchain /foo/codesourcery/codebench/
>    Toolchain supports multiple targets. Please choose one of the following: ['aarch64-linux-gnu', 'arm-none-eabi', 'arm-none-linux-gnueabi']
>    aurora:buildroot$ ./support/scripts/scan-ext-toolchain -t arm-none-linux-gnueabi /foo/codesourcery/codebench/
>    BR2_TOOLCHAIN_EXTERNAL=y
>    BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_16=y
>    BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
>    BR2_TOOLCHAIN_EXTERNAL_CXX=y
>    BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>    BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX=arm-none-linux-gnueabi
>    BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
>    BR2_TOOLCHAIN_EXTERNAL_PATH="/foo/codesourcery/codebench/"

Just curious, is this a publicly available toolchain? The latest Sourcery 
CodeBench ARM toolchain that Buildroot knows about is 2014.05, which is based 
on gcc 4.8.3.

[...]

> #!/usr/bin/env python
> 
> # Copyright 2016 Mentor Graphics Corporation
> # All Rights Reserved
> #
> # THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY
> # INFORMATION WHICH ARE THE PROPERTY OF MENTOR
> # GRAPHICS CORPORATION OR ITS LICENSORS AND IS
> # SUBJECT TO LICENSE TERMS.

Are you sure about that?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

From: Pavel Roskin <proski@gnu.org>
Date: Fri, 01 Dec 2006 03:11:39 -0500
Subject: [Buildroot] Impossible to build EABI ARM gcc toolchain
	using	Buildroot ?
In-Reply-To: <loom.20061130T112254-849@post.gmane.org>
References: <loom.20061129T130728-811@post.gmane.org>
	<1164848869.23643.60.camel@dv>
	<loom.20061130T112254-849@post.gmane.org>
Message-ID: <1164960699.4870.67.camel@dv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2006-11-30 at 11:14 +0000, MikeW wrote:
> This seems to be due to an incompatibility between:
> 1) toolchain.../gcc-x.x.x/config/arm/linux-elf.h
> 2) toolchain.../binutils-x.x.x/ld/earmelf_linux_eabi.c
> 
> In 1) there is a setting TARGET_LINKER_EMULATION "armelf_linux"
> In 2) there is a string (part of a struct initialiser) "armelf_linux_eabi"
> 
> so unless I can find matching strings in a version of gcc and ld,
> buildroot will never be able to build a toolchain.

There are already patches for gcc in buildroot that change
TARGET_LINKER_EMULATION for bigendian systems and uClibc.  I think
support for EABI belongs there too.

-- 
Regards,
Pavel Roskin

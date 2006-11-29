From: MikeW <mw_phil@yahoo.co.uk>
Date: Wed, 29 Nov 2006 13:25:41 +0000 (UTC)
Subject: [Buildroot] Impossible to build EABI ARM gcc toolchain using
	Buildroot ?
Message-ID: <loom.20061129T130728-811@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc-3.4.3
binutils-2.16.91.0.7
buildroot-20061031

Target Architecture: arm
Target Architecture Variant: arm926t
Target ABI: EABI
Build Options: GNU Target Suffix: ????
Toolchain options: Kernel Headers 2.6.11

Is there a way of building an EABI ARM toolchain using Buildroot ?
Or is it one of those things that is not currently possible ?

If I set the target suffix to 'elf-linux' the toolchain build
completes, but objects created with it have EABI version=0 (= no EABI).
(These will not link with a 3rd-party-built library with EABI version=4.)

If I set to to 'armelf-linux-eabi' or one of the other likely-
looking values, I get a build error from ld: 
 in/ld: unrecognised emulation mode: armelf_linux
 Supported emulations: armelf_linux_eabi

I can't see any other likely setting to change ...

Any ideas ?
Or do a need a newer version of Buildroot ... or a patch ?

Thanks,
MikeW

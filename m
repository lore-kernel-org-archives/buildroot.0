From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 05 Jun 2012 01:08:31 +0200
Subject: [Buildroot] generated shared libraries are not ARM but Intel -
 why ?
In-Reply-To: <CAGXs5wWx3-kTe9T5OQDLqfh80K9hz0OOkkqT+aNKYjQhjRbn3g@mail.gmail.com>
References: <CAGXs5wWx3-kTe9T5OQDLqfh80K9hz0OOkkqT+aNKYjQhjRbn3g@mail.gmail.com>
Message-ID: <4FCD3FEF.40001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/04/12 14:22, Kevin Wilson wrote:
> I want to make a filesystem for Arm running 32 bit V7 arm processor.
> My host machine is x86_64 Intel machine
> I downloaded buildroot-2012.02.tar.bz2
> buildroot-2012.02
> I selected
> Test architecure - arm
>   Target Architecture Variant - generic arm
>
> I selected very few packages like gcc
>
> I ran "make" and a rootfs tar file was generated.
>
> After extracting it,  I  could not boot from it ;
> chekling further into the filesystem I created got:
>
>   file /lib/libdl-0.9.32.1.so
> libdl-0.9.32.1.so: ELF 32-bit LSB shared object, Intel 80386, version
> 1 (SYSV), dynamically linked (uses shared libs), stripped
> file  lib/libgcc_s.so.1
> lib/libgcc_s.so.1: ELF 32-bit LSB shared object, Intel 80386, version
> 1 (SYSV), dynamically linked, stripped
>
>
> It should have been an ARM object library.
> What did I do wrong ?

  This is very strange.

  Can you check the top of the .config file to make sure that you indeed
have an ARM configuration?

  You didn't, by any chance, compile first and only changed the architecture
to ARM afterwards?  buildroot doesn't automatically detect when the
configuration has changed in an incompatible way, and the default architecture
is i386.  So you may still be using a toolchain for i386 even if you reconfigured
for ARM.  To be sure, remove the output directory (or run 'make clean').

  If all that fails, can you post the defconfig?  Run 'make savedefconfig' and it
is saved in the file 'defconfig'.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

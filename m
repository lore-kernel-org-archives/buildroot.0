From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Oct 2009 12:01:28 +0000 (UTC)
Subject: [Buildroot] [Bug 687] New: Are AT91 patches supplied with
 Buildroot-2009.08 out of date?
Message-ID: <bug-687-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=687

              Host: Fedora 10
            Target: AT91SAM9G20-EK
             Build: Buildroot-2009.08
           Summary: Are AT91 patches supplied with Buildroot-2009.08 out of
                    date?
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P3
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: steven.tupper at calrec.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hello 

We are currently evaluating a AT91SAM9G20-EK board but I have hit a bit of a
wall when it comes to building using Buildroot under Linux that I hope you can
help me with.

I am completely new to cross-compilation so forgive any lack of insight on my
part.

I have downloaded and installed Buildroot-2009.08 from
http://buildroot.net/downloads

I think I have successfully configured and built the tool chain, root file
system and Linux Kernel (2.6.30) for this board.

My problem is when the build process comes to building the UBoot.

I have selected to build U-Boot version u-boot-1.2.0-atmel and to add
architecture specific patches.

Trouble is, when it comes to applying the patches the build system falls over
with:

    Applying u-boot-2009.01-001-at91rm9200.patch using plaintext: 
    patching file include/asm-arm/arch-at91rm9200/at91_pio.h
    patching file include/asm-arm/arch-at91rm9200/at91_pmc.h
    patching file include/asm-arm/arch-at91rm9200/AT91RM9200.h
    Hunk #1 FAILED at 28.
    1 out of 1 hunk FAILED -- saving rejects to file
include/asm-arm/arch-at91rm9200/AT91RM9200.h.rej
    patching file include/asm-arm/arch-at91rm9200/gpio.h
    patching file include/asm-arm/arch-at91rm9200/io.h
    Patch failed!  Please fix u-boot-2009.01-001-at91rm9200.patch!
    make: ***
[/home/dez/buildroot-2009.08/project_build_arm/uclibc/u-boot-1.2.0-atmel/.patched]
Error 1 

The patches are copied during the build process from a directory called:

    buildroot-2009.08/target/device/Atmel/arch-arm/u-boot/2009.01

In an attempt to skip over the patches that I assume I don't need and just
apply the AT91SAM9G20 one I tried to edit and cut away patch text to make each
work in turn until I got to the AT91SAM9G20 ones. Trouble is it seems that none
of the AT91 patches in this build are correct (including the AT91SAM9G20 one)!

If I don't elect to have the patches included I, predictably, get:

    *** No rule to make target 'at91sam9g20ek_config' 

So I suppose what I am saying is that i think that the AT91 patches supplied
with Buildroot-2009.08 are out of date or just wrong or i am doing something
stupid that i can't see (i find it hard to believe i am the only person with
this issue).



Possibly surplus info:

I have been through all the various guides on the AT91 website with varying
results, crc check issues at boot, kernel panics and kernels that run but don't
allow a user to log in (I assume a problem building busybox).

I have, through combining the various guides and using a boot loader build that
has no mention of our board, managed to build something that does work (I
assume that the boot loader manages to get by because our card is so similar to
the at91sam9260) but the process is messy and undesirable, perhaps even
unrepeatable for future developers here at our company and using a bootloader
for a different card makes me a little nervous, so I am very keen to be able to
build from the latest buildroot distribution of files.

demo apps from the AT91 website work ok and I am using the Linux version of
SAM-BA to flash files.

Incidentally I notice that the AT91 website only has patches up to kernel
2.6.27. I have assumed that these mods are built into the 2.6.30 kernel
already, is that naive? My 2.6.30 kernel does run on the board but will there
be some nasty surprises lurking somewhere?

Is there anything you can do to help me build U-Boot for our board? Updated
patches or any guidance would be great.

Many thanks in advance
Steve


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

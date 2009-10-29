From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Oct 2009 20:01:02 +0000 (UTC)
Subject: [Buildroot] [Bug 687] Are AT91 patches supplied with
 Buildroot-2009.08 out of date?
In-Reply-To: <bug-687-163@https.bugs.busybox.net/>
References: <bug-687-163@https.bugs.busybox.net/>
Message-ID: <20091029200102.9CBC377708@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=687


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-10-29 20:01:01 UTC ---
(In reply to comment #0)

> Trouble is, when it comes to applying the patches the build system falls over
> with:
> 
>     Applying u-boot-2009.01-001-at91rm9200.patch using plaintext: 
>     patching file include/asm-arm/arch-at91rm9200/at91_pio.h
>     patching file include/asm-arm/arch-at91rm9200/at91_pmc.h
>     patching file include/asm-arm/arch-at91rm9200/AT91RM9200.h
>     Hunk #1 FAILED at 28.

It sounds like you have enabled BR2_TARGET_U_BOOT_2009_01_ARCH_AT91 (AT91
patches for u-boot-2009.01). Don't do that if you are not using the 2009.01
version of u-boot. I'll fix up kconfig so you won't be able to do so in the
future.

On a related note, you won't find support for the 9g20 in the ancient
1.2.0-atmel release, you better use the 2009.08 release instead.

> So I suppose what I am saying is that i think that the AT91 patches supplied
> with Buildroot-2009.08 are out of date or just wrong or i am doing something
> stupid that i can't see (i find it hard to believe i am the only person with
> this issue).

The AT91 patches we have are indeed fairly old, but most AT91 stuff is in
mainline nowadays, so you don't need (many) patches.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

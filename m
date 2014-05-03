From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 May 2014 22:08:05 +0200
Subject: [Buildroot] [PATCH 08/12] boot/syslinux: bump version
In-Reply-To: <ebb3e343a568496b9406bce20eb802be33bcec3c.1399050467.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Fri, 2 May 2014 19:10:34 +0200")
References: <cover.1399050467.git.yann.morin.1998@free.fr>
 <ebb3e343a568496b9406bce20eb802be33bcec3c.1399050467.git.yann.morin.1998@free.fr>
Message-ID: <87fvkqmxqy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > This new version has a very, very weird build system. There are different
 > images that syslinux can now build:
 >   - the plain legacy-bios images we already supported previously
 >   - two new EFI32 and EFI64 applications

 > To build one or the other, the Makefile accepts one or more of:
 >     make (bios|efi32|efi64)

 > Specify all of them, and it builds all. Specify 'install', and it installs
 > all of them, as one may expect.

 > Still a regular behaviour, is to build only a subset (down to one):
 >     make bios           <-- builds just the legacy-bios images
 >     make efi32 bios     <-- builds just the legacy-bios and efi32 images

 > Where it gets weird is the install procedure. Can you guess how it's done?
 > Hint: the syslinux guys have invented the multiple-argument parsing in
 > pure Makefiles. To build then install only the bios images, one would do:
 >     make bios
 >     make bios install

 > Yep, that's it. make bios install. Two arguments, one action.

 > That makes for some funky workarounds in our install procedure...

Is that so odd? If you don't have an explicit configure step, then there
isn't really anything for the install step to know what configuration
you have built (besides looking for what binaries are available).

Committed this and the rest of the series, thanks.

-- 
Bye, Peter Korsgaard

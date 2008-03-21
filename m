From: Nigel Kukard <nkukard@lbsd.net>
Date: Fri, 21 Mar 2008 06:00:32 +0000
Subject: [Buildroot] avr32 patches vs. x86 breakage
Message-ID: <1206079232.2562.60.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guys,

Will this proposal to fix the problem work ...

- Make a dir under arch-avr32, for gcc-x.y.z

- Add a make file to set something like
BOARD_EXTRA_PATCH_PATH=target/device/arch-avr32  this will be set if the
board is AVR32 based 

- In GCC / binutils/ uclibc and where ever else avr32 patches are
applied, we can tst if BOARD_EXTRA_PATCH_PATH is available. If it is to
add those patches into the patch set being applied. This should be
simplistic as we know the version for instance GCC_VERSION, we'd just
have to test the path exists and do something like    \*.patch
$(MORE_PATCHES)  , where we set a few lines up.  MORE_PATCHES=
$(BOARD_EXTRA_PATCH_PATH)/gcc-$(GCC_VERSION)


I think this is a good fix to only apply board specific patches if we
need them ... and by simply creating a dir off the board name dir with
the package name in it for each package we muck with.

Good/bad idea? or any combination of idea above.

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080321/586f4f2b/attachment-0001.pgp 

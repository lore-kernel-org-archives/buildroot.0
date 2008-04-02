From: digitalpeer <buildroot@digitalpeer.com>
Date: Tue, 1 Apr 2008 18:11:46 -0700
Subject: [Buildroot] Compiling bootloader with gcc 4.2.1
Message-ID: <3530b0eb0804011811h636acdb0gc2e7b93e6a99c66b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm hoping somebody has run across this when compiling bootloaders with
buildroot toolchains.  When compiling uMon with a buildroot/uClibc created
gcc 4.2.1 cross compiler I get the following link error, something I do not
get when using the exact same configuration with gcc 3.4.6:

/lib/gcc/arm-linux-uclibc/4.2.1/libgcc.a(_dvmd_lnx.o): In function `__div0':
gcc-4.2.1/gcc/config/arm/lib1funcs.asm:1000: undefined reference to `raise'

libgcc is obviously using the GNU/Linux version of the division-by zero
handler which is not available.  The toolchain works fine for everything
else, but falls short here.  How do I get it to use the L_dvmd_tls functions
instead of the L_dvmd_lnx functions in lib1funcs.asm?  Will compiling the
bootloader require a separate toolchain or is there some gcc option i'm
overlooking?

Josh
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080401/68668a4a/attachment.htm 

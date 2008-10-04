From: Micha Nelissen <micha@neli.hopto.org>
Date: Sat, 04 Oct 2008 21:22:02 +0200
Subject: [Buildroot] proftpd does not compile
Message-ID: <gc8fta$bif$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am using revision 23387, and proftpd does not compile for me. It 
complains about redeclared mode_t in usr/include/asm/types.h vs 
usr/include/sys/types.h in staging_dir.

If I comment the build_i686/proftpd-1.3.1/config.h file:
#define umode_t mode_t

(to /* ... */)

then the compile is fine. Further some warnings about bcopy also, I guess:

#undef HAVE_BCOPY
should be
#define HAVE_BCOPY 1

Obviously this is not a correct patch, but not sure about correct one? 
Kernel headers broken? configure script broken? toolchain headers?

Please advise, thanks.

Micha

From: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
Date: Wed, 01 Jul 2009 01:50:50 +0200
Subject: [Buildroot] External toolchain improvements
In-Reply-To: <mailman.0.1246405094.1110.buildroot@busybox.net>
References: <mailman.0.1246405094.1110.buildroot@busybox.net>
Message-ID: <1246405850.21132.10.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I'm interested by your patches, I'm using a STLinux external toolchain
(Linux for SH4 SetTop Boxes).

The problem is that copying only libraries is not enough to build even a
simple program like this one :

int main (void) { return 0; }

With my current toolchain, I also need :

      * crt1.o crti.o crtn.o
      * All headers from the libc & linux

After that, I also have problems with packages using pkg-config.
Pkg-config returns paths relatives to the build directory ( -L/usr/lib
for example). This tries to link with 

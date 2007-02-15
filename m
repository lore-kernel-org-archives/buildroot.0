From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 15 Feb 2007 15:09:55 +0100
Subject: [Buildroot] strange error during make
In-Reply-To: <585346.36396.qm@web50902.mail.yahoo.com>
References: <585346.36396.qm@web50902.mail.yahoo.com>
Message-ID: <20070215140955.GC18188@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 12, 2007 at 05:43:14AM -0800, izak marais wrote:
>Hi all
>
>I'm trying to build a toolchain for my SH4-based board. It already has a version of uClinux installed, so I only want the compilation tool chain. I've  run make config, selecting 'No' for most of the non-toolchain related options (if you think this is causing me trouble, I can include the .config in a future post).
>
>Eventually make exists with an error that I can't decipher (see below). There's a warning about makeinfo that doesn't make sense (I didn't alter any .texi of .texinfo files and reinstalled GNU make just to be on the safe side), but I don't know if it is the cause of the error. It appeards as if something has gone awry in the generated directory structure...
>
>If anybody can help I would greatly appreciate it! Sorry if this is a newbie question; I did search the archives but found nothing similar.
>
>Thanks
>Izak
>
>Here's the output:
>
>izak at izak-desktop:~/buildroot$ make
>
>Checking build system dependencies:
>CC clean:                                       Ok
>CXX clean:                                      Ok
>CPP clean:                                      Ok
>CFLAGS clean:                                   Ok
>CXXFLAGS clean:                                 Ok
>sed works:                                      Ok
>which installed:                                Ok
>GNU make version '3.81beta4':                   Ok
>C compiler '/usr/bin/gcc'
>C compiler version '4.0.3':                     Ok
>bison installed:                                Ok
>flex installed:                                 Ok
>gettext installed:                              Ok
>Build system dependencies:                      Ok

This will now print a nice warning about missing makeinfo, fwiw.

>WARNING: `makeinfo' is missing on your system.  You should only need it if
>         you modified a `.texi' or `.texinfo' file, or any other file
>         indirectly affecting the aspect of the manual.  The spurious
>         call might also be the consequence of using a buggy `make' (AIX,
>         DU, IRIX).  You might want to install the `Texinfo' package or
>         the `GNU make' package.  Grab either from any GNU archive site.
>make[4]: *** [/home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc/bfd.info] Error 1
>make[4]: Leaving directory `/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/bfd/doc'
>Making info in po

Install the makeinfo package for your host or fix binutils

Passing in MAKEINFO=/bin/false to make work too, didn't try

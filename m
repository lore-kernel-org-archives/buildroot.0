From: Christopher Reder <creder@digitalcpt.com>
Date: Mon, 13 Aug 2007 13:12:10 -0500
Subject: [Buildroot] fontconfig fails using latest snapshot
In-Reply-To: <021c01c7ddcc$a7a9f9f0$dcc4af0a@atmel.com>
Message-ID: <009a01c7ddd5$779933d0$2600a8c0@engineering5>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----Original Message-----
From: Ulf Samuelsson [mailto:ulf at atmel.com] 
Sent: Monday, August 13, 2007 10:52 AM
To: creder at digitalcpt.com; buildroot at uclibc.org
Subject: Re: [Buildroot] fontconfig fails using latest snapshot

> linuxbox:/home/christopher/sb/buildroot# make fontconfig
> . <snip> .
> /usr/include/ft2build.h:56:38: error: freetype/config/ftheader.h: No such
file or directory


You need to build freetype2 before fontconfig.


Sorry as I think I sent the wrong output.  I did end up going and building
freetype and then fontconfig.  I have attached the output below.  It looks
like it is using the native gcc to build this.  Is that right?  Also, it
doesn't seem to like the CFLAGS or LDFLAGS.  Do I have something not setup
correctly for this to be using this gcc and not seeing these?  This is
latest as of this morning. 


/usr/bin/gcc @CFLAGS_FOR_BUILD@ @LDFLAGS_FOR_BUILD@ -o fc-lang fc-lang.o
gcc: @CFLAGS_FOR_BUILD@: No such file or directory
gcc: @LDFLAGS_FOR_BUILD@: No such file or directory
make[4]: *** [fc-lang] Error 1
make[4]: Leaving directory
`/home/christopher/sb/buildroot/build_arm/fontconfig-2.4.2/fc-lang'
make[3]: *** [all] Error 2
make[3]: Leaving directory
`/home/christopher/sb/buildroot/build_arm/fontconfig-2.4.2/fc-lang'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/christopher/sb/buildroot/build_arm/fontconfig-2.4.2'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/christopher/sb/buildroot/build_arm/fontconfig-2.4.2'
make: ***
[/home/christopher/sb/buildroot/build_arm/fontconfig-2.4.2/.compiled] Error
2
linuxbox:/home/christopher/sb/buildroot#

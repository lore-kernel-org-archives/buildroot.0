From: d giddy <rickyrockrat@yahoo.com>
Date: Fri, 2 Feb 2007 09:00:54 -0800 (PST)
Subject: [Buildroot] binutils 2.16.1,
	mipsel (au1200) broken build and solution (PACKAGE bucomm.c app.c)
Message-ID: <734298.32859.qm@web62005.mail.re1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I don't know if it is my environment or what, but
binutils won't compile as-is, so here are my notes on
how to get it to build:

Add #define PACKAGE "intl" to top of config.h in
toolchain_build_mipsel/binutils-2.16.1-build/intl

When it fails about TARGET undefined in bucomm.c,
create a link from   
toolchain_build_mipsel/binutils-2.16.1-build/binutils/config.h
    to
toolchain_build_mipsel/binutils-2.16.1/binutils/config.h

When app.c fails, create another link from 
   
toolchain_build_mipsel/binutils-2.16.1-build/gas/config.h
to
toolchain_build_mipsel/binutils-2.16.1/gas/config.h

Cheers,
Doug


 
____________________________________________________________________________________
Be a PS3 game guru.
Get your game face on with the latest PS3 news and previews at Yahoo! Games.
http://videogames.yahoo.com/platform?platform=120121

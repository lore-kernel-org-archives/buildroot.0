From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 13 Nov 2016 18:13:18 +0100
Subject: [Buildroot] [PATCH 1/1] sdl: fix building on powerpc64 and
	powerpc64le
References: <a57a3d0430e248ee08148cef326cbf60283205ad.1478489382.git.sam.bobroff@au1.ibm.com>
 <20161107225106.5e9e61b6@free-electrons.com>
 <53f345eb-3ea1-02ef-06bf-72f011b3728a@mind.be>
 <20161108051006.GB6803@tungsten.ozlabs.ibm.com>
 <99a8adb3-3fa3-7050-e31f-16d2ee67ea12@mind.be>
 <20161109043021.GA10982@tungsten.ozlabs.ibm.com>
Message-ID: <eijmfdxo6o.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 09 Nov 2016 15:30:21 +1100 schrieb Sam Bobroff:

> How do those options sound? Any other suggestions?

Hi,

while investigating the build errors of the minidlna package
http://autobuild.buildroot.net/?reason=minidlna-1.1.5&arch=powerpc64le
I came across this discussion.

The root cause of the build error is the fact that both libexif (last 
release dates 2012-07-12) and libid3tag (last release dates 2004-02-18) 
contain a .m4 file which does not detect shared libs support because of 
the elf64ppc/elf64lppc problem. Autoreconf'ing libexif has its own 
problems wrt $MKINSTALLDIRS so I would like to avoid it.

What about doing something similar Debian did back in 2014?
https://lists.debian.org/debian-powerpc/2014/09/msg00041.html
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=760395

Regards, Bernd

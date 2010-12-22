From: Sergey Naumov <sknaumov@gmail.com>
Date: Wed, 22 Dec 2010 16:29:07 +0300
Subject: [Buildroot] gettext compilation error
Message-ID: <AANLkTi=Lq2fhx5KALj1_pcUWqC9H__70dLzDUUi4u21Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.

I am trying to create development system with buildroot, but after
fixing g++-target problems there was gettext:

gettext seeks for sys/utime.h, but there is only utime.h, so may be it
is worth to create a symlink after installation of uclibc headers? At
least it works for me.

Also there was problems with glib2 with iconv.h and libintl.h: don't
know whether they were installed, I think they were, but when make
reports error and after fixing it you execute make again, uClibc
makefile is called and it removes some headers including iconv.h and
libintl.h. But gettext and libiconv packages was already built and
stamps prevents them from reinstalling just deleted headers. So if
buildroot supports make not from scratch, then I think this issue
should be fixed. For now I am simply deleting gettext and libiconv
from outbut/build to force their reinstallation. Also to ensure their
installation I edited gettext.mk and libiconv.mk and copy this headers
to $(STAGING_DIR)/usr/include (because I don't know whether they
weren't installed or they were deleted - only what I know is that in
make log at uClibc stage they are passed as parameters to rm).

Sergey Naumov.

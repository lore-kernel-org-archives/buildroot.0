From: Andrew E. Mileski <andrewm@isoar.ca>
Date: Fri, 06 Oct 2006 17:31:18 -0400
Subject: [Buildroot] xorg pathnames
Message-ID: <4526CB26.2050004@isoar.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The xorg package doesn't build for me currently, so I was grep'ing the
source for -L usage and found a number of things not covered in xorg.mk
or the patches:

grep -r -- '-L' . | grep /usr/X11R6/lib
   fontconfiglibs
   freetypelibs
   xrenderlibs
   xlibs
   LOCAL_LIBRARIES
   APP_LIB_DEPS
   GLW_LIB_DEPS
   GL_LIB_DEPS
   GLUT_LIB_DEPS

I believe these are the ones causing my immediate problem:

grep -r '=.*/usr/X11R6/lib' .
   USRLIBDIR
   SHLIBDIR
   LIBDIR

Probably others (and /lib), and -I should probably get similar
treatment.

I don't know if they all are relevant; it's been several years since
I left my name in the X code.  Someone more current in this area might
want to take a peek at this while I brush up.

--
Andrew E. Mileski

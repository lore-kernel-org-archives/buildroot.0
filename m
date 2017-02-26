From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 Feb 2017 14:28:18 +0000
Subject: [Buildroot] [Bug 9596] KODI: --enable-lirc needs "HAVE_LIRC"
 compiler definition to use the lirc subsystem
In-Reply-To: <bug-9596-163@https.bugs.busybox.net/>
References: <bug-9596-163@https.bugs.busybox.net/>
Message-ID: <bug-9596-163-gvFslTI3gt@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9596

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
I don't see why this is needed: when --enable-lirc is passed, and the lirc
library is found, the configure script defines HAVE_LIRC:

AC_ARG_ENABLE([lirc],
  [AS_HELP_STRING([--disable-lirc],
  [disable lirc support (default is enabled)])],
  [AC_MSG_RESULT("Lirc disabled")],
  [AC_DEFINE([HAVE_LIRC], [1], ["Lirc enabled"])])

And then, when HAVE_LIRC is defined, HAS_LIRC gets defined by xbmc/system.h:

#ifdef HAVE_LIRC
#define HAS_LIRC
#endif

And HAS_LIRC is the define being tested at the code you point to.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

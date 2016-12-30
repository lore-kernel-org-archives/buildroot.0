From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Dec 2016 21:06:01 +0000
Subject: [Buildroot] [Bug 9551] Coreutils fails to build target
 src/src_libsinglebin_pinky_a-pinky.o
In-Reply-To: <bug-9551-163@https.bugs.busybox.net/>
References: <bug-9551-163@https.bugs.busybox.net/>
Message-ID: <bug-9551-163-nJCgCA6JDG@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9551

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr
         Resolution|---                         |INVALID
             Status|NEW                         |RESOLVED

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Bilge,

The coreutils buildsystem detects features of the toolchain, and
generates "accessors" to various internals. UT_USER is an accessor
to fields of the utmp (or utmpx) structure.

Your toolchain lacks this structure or this field in this structure.

You have to realize that uClibc is configurable, and if you configure
it with very few features, then things will start to break.

Fix your toolchain, or use a pre-built one.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 13 May 2018 20:05:59 +0000
Subject: [Buildroot] [Bug 10996] bogus musl ARM toolchain
In-Reply-To: <bug-10996-163@https.bugs.busybox.net/>
References: <bug-10996-163@https.bugs.busybox.net/>
Message-ID: <bug-10996-163-ZnUpb6PrXo@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10996

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #2 from Yann E. MORIN <yann.morin.1998@free.fr> ---
(In reply to Thomas Petazzoni from comment #1)
> this happens because we don't pass -static.

But the autobuild failure that is referenced does use -static (with \ and
newlines added for readability):

   
home/peko/autobuild/instance-1/output/host/bin/arm-buildroot-linux-musleabihf-gcc
\
        -c -D_FILE_OFFSET_BITS=64 -Os \
        -static \
        -I. -DUNIX -DUIDGID_NOT_16BIT -DLARGE_FILE_SUPPORT -DUNICODE_SUPPORT
-DNO_MKTIME \
        -DNO_DIR -DHAVE_DIRENT_H -DHAVE_TERMIOS_H util.c

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

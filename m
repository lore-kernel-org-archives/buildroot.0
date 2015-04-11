From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 11 Apr 2015 21:03:43 +0000 (UTC)
Subject: [Buildroot] [Bug 8011] When building only busybox and strace,
 strace fails on not finding bluetooth/bluetooth.h
In-Reply-To: <bug-8011-163@https.bugs.busybox.net/>
References: <bug-8011-163@https.bugs.busybox.net/>
Message-ID: <20150411210343.A085A80E2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8011

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #7 from Yann E. MORIN <yann.morin.1998@free.fr> 2015-04-11 21:03:43 UTC ---
So, I've tried to reproduce this here. Here's my defconfig:

    BR2_x86_64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_PACKAGE_STRACE=y

Also, I do have bluetooth devel files installed on my host system:

    $ ls -l /usr/include/bluetooth/bluetooth.h
    -rw-r--r-- 1 root root 7588 Jan 28 22:19 /usr/include/bluetooth/bluetooth.h

But it is not present in the sysroot:

    $ find staging/ -name bluetooth.h
    [nothing]

And strace's log is like:

    checking bluetooth/bluetooth.h usability... no
    checking bluetooth/bluetooth.h presence... no
    checking for bluetooth/bluetooth.h... no

Can you try to reproduce from a clean environment?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

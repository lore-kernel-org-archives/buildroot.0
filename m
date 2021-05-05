From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 05 May 2021 21:49:33 +0000
Subject: [Buildroot] [Bug 13791] The QEMU compiled by Buildroot does not
 support alsa or pulseaudio drivers for soundcard forwarding
In-Reply-To: <bug-13791-163@https.bugs.busybox.net/>
References: <bug-13791-163@https.bugs.busybox.net/>
Message-ID: <bug-13791-163-vkmrH3hoI0@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13791

WZab <wzab01@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
   Attachment #8926|0                           |1
        is obsolete|                            |

--- Comment #5 from WZab <wzab01@gmail.com> ---
Created attachment 8931
  --> https://bugs.busybox.net/attachment.cgi?id=8931&action=edit
Patch with temporary work-around

This is a temporary work-around - a patch to the qemu package.
It simply switches to using the standard pkg-config, when the sound libraries
are detected and configured. After that the original Buildroot-provided
pkg-config is restored.
The correct operation is confirmed on Debian/testing.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

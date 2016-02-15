From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 15 Feb 2016 21:24:55 +0000
Subject: [Buildroot] [Bug 8696] xdriver_xf86-input-mouse install header
 files in target directory
In-Reply-To: <bug-8696-163@https.bugs.busybox.net/>
References: <bug-8696-163@https.bugs.busybox.net/>
Message-ID: <bug-8696-163-Lw8DFavsRF@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8696

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|unassigned at buildroot.uclibc |gustavo at zacarias.com.ar
                   |.org                        |

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
I am indeed able to reproduce the problem:

target/home/test/outputs/xorg/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/xorg/xf86-mouse-properties.h

This is due to the value returned as sdkdir by pkg-config. Gustavo, you patched
pkg-config and it handles sdkdir specially. Do you know what's going on here?

-- 
You are receiving this mail because:
You are on the CC list for the bug.

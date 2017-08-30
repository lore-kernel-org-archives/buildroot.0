From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Aug 2017 17:55:48 +0000
Subject: [Buildroot] [Bug 10276] BR2_PACKAGE_LINUX_TOOLS_GPIO fails for MIPS
 with "gpio-hammer.o: ABI is incompatible with that of the selected
 emulation"
In-Reply-To: <bug-10276-163@https.bugs.busybox.net/>
References: <bug-10276-163@https.bugs.busybox.net/>
Message-ID: <bug-10276-163-E8Lisphr86@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10276

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|unassigned at buildroot.uclibc |yann.morin.1998 at free.fr
                   |.org                        |
             Status|NEW                         |ASSIGNED
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #2 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Given the following:

      CC       gpio-utils.o
      LD       gpio-event-mon-in.o
    gpio-utils.o: file not recognized: File truncated
    /data/git/buildroot/output/build/linux-4.11.3/tools/build/Make
    file.build:149: recipe for target 'gpio-event-mon-in.o' failed

it looks like it might be a parallel build issue, where gpio-event-mon-in.o
needs gpio-utils.o, but it is not yet built.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

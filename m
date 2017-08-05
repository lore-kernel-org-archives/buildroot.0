From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 05 Aug 2017 20:20:22 +0000
Subject: [Buildroot] [Bug 10171] New: devmem2 w (word) is 8 bytes in x86 64
	systems
Message-ID: <bug-10171-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10171

            Bug ID: 10171
           Summary: devmem2 w (word) is 8 bytes in x86 64 systems
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ciro.santilli at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

http://free-electrons.com/pub/mirror/devmem2.c

w maps to unsigned long

Let's use uintX_t for all accesses, and introduce q (quadword) for 64 bit

Specially unintuitive since h (half-word) maps to short int, which in x86_64 is
2 bytes, and thus not half of word.

Also can we move the .c source into the buildroot tree itself in the same
directory as the .mk, since it is so tiny. Or create a separate official git
repo for it.

I'll send patch if you agree.

Like this:
https://github.com/cirosantilli/linux-kernel-module-cheat/blob/d871c008fbf0832e502f8ae1367ecf8ab6796aa5/kernel_module/user/devmem3.c

-- 
You are receiving this mail because:
You are on the CC list for the bug.

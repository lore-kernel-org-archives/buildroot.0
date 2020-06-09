From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 09 Jun 2020 16:38:20 +0000
Subject: [Buildroot] [Bug 13001] New: openjdk-bin replaces libfreetype.so
 from host-freetype
Message-ID: <bug-13001-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13001

            Bug ID: 13001
           Summary: openjdk-bin replaces libfreetype.so from host-freetype
           Product: buildroot
           Version: 2020.02.3
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jared.bents at rockwellcollins.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

openjdk-bin creates libfreetype.so and places it into $(HOST_DIR)/lib/. This
causes host-xapp_mkfontscale to fail to build due to the libfreetype.so from
host-freetype being overwritten.

mkfontscale.o: In function `doDirectory':
mkfontscale.c:(.text+0x1a80): undefined reference to `FT_Get_BDF_Property'
collect2: error: ld returned 1 exit status

This can be reproduced by doing the following steps.

make host-freetype
make host-openjdk-bin
make host-xapp_mkfontscale

-- 
You are receiving this mail because:
You are on the CC list for the bug.

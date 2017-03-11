From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 11 Mar 2017 13:36:06 +0000
Subject: [Buildroot] [Bug 9726] New: Raspberry Pi version B - Problems with
 UART speed in Buildroot 2016.11.2 and 2017.2
Message-ID: <bug-9726-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9726

            Bug ID: 9726
           Summary: Raspberry Pi version B - Problems with UART speed in
                    Buildroot 2016.11.2 and 2017.2
           Product: buildroot
           Version: 2016.11
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: wzab01 at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

We have a lab equipped with old Respberry Pi version B.
To allow student to modify the system image without removing and inserting SD
cards (which killed them in a few weeks), we use U-Boot bootloder, patched so
that it passes the boot parameters prepared via a standard RPi firmware.
I wanted to update our environment to Buildroot 2016.11.2 in this semester.
Unfortunately, it appears, that the U-Boot does not set the UART speed properly
in that scenario.
I've meassured the UART speed with the oscilloscope, and it appeared, that it
is equal to ca. 1840 kb/s. However, the kernel uses the correct UART speed -
115.2 kb/s.
I've also tested the operation with the Buildroot 2017.2
In this case things are even more interesting. The U-Boot sets the UART speed
correctly to 115.2 kb/s, but hte kernel works at 921.6 kb/s
What can be the reason of the experienced problems?
Can I easily cure them with the settings done in the config.txt file?

TIA & Regards,
Wojtek

-- 
You are receiving this mail because:
You are on the CC list for the bug.

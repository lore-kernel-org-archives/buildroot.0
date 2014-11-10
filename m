From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 10 Nov 2014 10:34:02 +0000 (UTC)
Subject: [Buildroot] [Bug 7628] New: Python SSL does not get built for
	Raspberry Pi
Message-ID: <bug-7628-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7628

           Summary: Python SSL does not get built for Raspberry Pi
           Product: buildroot
           Version: 2014.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: tobias.meggendorfer+buildroot at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I'm building for the raspberry pi and want to have the Python SSL package.

Steps i've taken:
- make distclean
- make raspberrypi_defconfig
- make nconfig
- Enable WCHAR support, python3 and python-ssl
- make
- grab coffee

However, there is no "_ssl.cpython-34m.so" ("_ssl.so" in the python2 case) to
be found in the lib-dynload folder, thus the ssl module isn't working. I'm
fairly new to (cross-)compiling so I might have missed something trivial,
although I think I've doublechecked everything. I guess there just is a include
or something like that missing, as the python compilation complains about ssl
dependencies not being found.

I've also tried this with glibc 2.18 / 2.19 and gcc 4.8 / 4.9, binutils 2.22 /
2.24 and python2 and EABIhf. I actually need glibc + EABIhf for my application,
but this problem seems to occur with every configuration.

Host: 3.2.0-70-virtual #105-Ubuntu SMP x86_64 x86_64 x86_64 GNU/Linux
Buildroot: git version 2014.08-0-gfcd720d

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

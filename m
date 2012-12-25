From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 25 Dec 2012 07:22:26 +0000 (UTC)
Subject: [Buildroot] [Bug 5828] New: Possible issue with python
Message-ID: <bug-5828-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5828

           Summary: Possible issue with python
           Product: buildroot
           Version: 2012.08
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: hardcore at hardcoreforensics.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4718
  --> https://bugs.busybox.net/attachment.cgi?id=4718
the config file from buildroot

Once the disk images have been built and transplanted to the  embedded system.

The python seems to function correctly, however some python packages require
the use of GCC
to build the libraries

when executing the install of these packages:
 "python setup.py install"

the python setup for GCC points to the OLD location on the computer used to
cross build the environment:

/home/bob/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-fno-strict-aliasing -pipe -Os -DNDEBUG -g -fwrapv -O3 -Wall
-Wstrict-prototypes -fPIC -I/usr/include/python2.7 -c conftest.c -o conftest.o
unable to execute
/home/bob/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc:
No such file or directory
error: command
'/home/bob/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc'
failed with exit status 1
#

rather than the new location in the embedded systems 'file system'

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

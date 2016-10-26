From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 26 Oct 2016 11:45:54 +0000
Subject: [Buildroot] [Bug 9381] New: check-host-rpath issues
Message-ID: <bug-9381-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9381

            Bug ID: 9381
           Summary: check-host-rpath issues
           Product: buildroot
           Version: 2016.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jpcartal at free.fr
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hello,

It seems that the check-host-rpath script has issues with buildroot paths that
contains links :

jpcartal at florida:buildroot-2016.08$ echo $PWD
/home/jpcartal/Dev/Ssd/buildroot/buildroot-2016.08
jpcartal at florida:buildroot-2016.08$ realpath $PWD
/home/jpcartal/Ssd/buildroot/buildroot-2016.08
jpcartal at florida:buildroot-2016.08$ support/scripts/check-host-rpath toto
$PWD/output/host
***
*** ERROR: package toto installs executables without proper RPATH:
***  
/home/jpcartal/Dev/Ssd/buildroot/buildroot-2016.08/output/host/usr/bin/crlutil
***  
/home/jpcartal/Dev/Ssd/buildroot/buildroot-2016.08/output/host/usr/bin/arm-buildroot-linux-gnueabihf-ar
....
jpcartal at florida:buildroot-2016.08$ cd $(realpath $PWD)
jpcartal at florida:buildroot-2016.08$ support/scripts/check-host-rpath toto
$PWD/output/host
jpcartal at florida:buildroot-2016.08$

Also it seems that the $ORIGIN ld feature is not supported.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

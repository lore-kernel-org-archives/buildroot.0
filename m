From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  3 Sep 2014 04:59:46 +0000 (UTC)
Subject: [Buildroot] [Bug 7358] New: rpi-userland: linking with bcm_host
 doesn't give vc_dispmanx_* functions
Message-ID: <bug-7358-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7358

           Summary: rpi-userland: linking with bcm_host doesn't give
                    vc_dispmanx_* functions
           Product: buildroot
           Version: 2014.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: ioribranford at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 5570
  --> https://bugs.busybox.net/attachment.cgi?id=5570
Config, make, and patch files for SDL2 package

I updated buildroot to 2014.08, started from raspberrypi_defconfig, and tried
to build my SDL2 package linking with rpi-userland. It's not in a submittable
state (many options carried over from SDL1 that still have to be checked for
applicability) but it worked fine as is with 2014.05. It includes a patch to do
pkg-config for the userland libs rather than assume /opt/vc.

While building rpi-userland was successful, building SDL2 failed at link time
with multiple "undefined reference to vc_dispmanx_*".

My local fix so far is to add -lvchostif into the SDL2 patch. But I understand
from the userland CMake files that that is supposed to come with -lbcm_host.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

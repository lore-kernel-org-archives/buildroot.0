From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 17 Nov 2020 01:02:56 +0000
Subject: [Buildroot] [Bug 13316] New: beaglebone_qt5_defconfig: PowerVR
 fails to start
Message-ID: <bug-13316-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13316

            Bug ID: 13316
           Summary: beaglebone_qt5_defconfig: PowerVR fails to start
           Product: buildroot
           Version: 2020.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: desmondjgood at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hello,

It seems like an image built with beaglebone_qt5_defconfig is broken for my
BeagleBone Black Wireless but I'm pretty new to playing around with Buildroot
so apologies if I'm missing something simple.

During the boot process, I can see a failure in the /etc/init.d/S80ti-sgx
startup script:

Starting PowerVR services: FAIL

The script attempts to load the pvrsrvkm module and then runs
"/usr/bin/pvrsrvctl --start --no-module", which then fails (or returns a
non-zero return code). Attempting to run the command manually yields:

PVR:(Error): OpenServices: PVRDRMOpenRender failed [0, ]
PVR:(Error): PVRSRVInitSrvConnect: PVRSRVConnect failed [0, ]
PVR:(Error): SrvInit: PVRSRVInitSrvConnect failed (4) [0, ]
/usr/bin/pvrsrvctl: SrvInit failed (already initialized?)
(err=PVRSRV_ERROR_INIT_FAILURE)

I've been using the following resource to help determine where my configuration
has gone wrong:
https://elinux.org/BeagleBoneBlack/SGX_%2B_Qt_EGLFS_%2B_Weston#Check_access_of_SGX_drivers

From that, I'm thinking there's a problem with the SGX drivers since
/sys/devices/platform/ocp/56000000.sgx isn't there. I think the config is using
the TI version of the kernel and the device tree looks okay. So I'm not sure
what's wrong at this point and not quite knowledgable enough to try to debug
where it's failing further.

Any help is appreciated!

Desmond Good
Computer Engineering Student
University of Waterloo

-- 
You are receiving this mail because:
You are on the CC list for the bug.

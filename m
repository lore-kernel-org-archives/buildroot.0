From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 07 Feb 2018 17:53:53 +0000
Subject: [Buildroot] [Bug 10751] New: Missing dependency in pulseaudio
 package
Message-ID: <bug-10751-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10751

            Bug ID: 10751
           Summary: Missing dependency in pulseaudio package
           Product: buildroot
           Version: 2017.02.7
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

I'm trying to add a2dp support (ie. sound over bluetooth) to my target.

A2DP support can be achieved using bluez5 and pulseaudio.

Pulseaudio only build bluetooth related modules if both BR2_PACKAGE_BLUEZ5 and
BR2_PACKAGE_SBC are enabled and compiled before the configure step of the
pulseaudio package.

Current pulseaudio.mk file contains the following entry :
PULSEAUDIO_DEPENDENCIES= .... $(if $(BR2_PACKAGE_BLUEZ5_UTILS),bluez5_utils)
...

But no corresponding entry for SBC (e.g. $(if $(BR2_PACKAGE_SBC),sbc)).

So sbc might not be available when configuring pulseaudio and consequently no
bluetooth related modules get built :
...
    Enable D-Bus:                  yes
      Enable BlueZ 4:              no
      Enable BlueZ 5:              no
        Enable ofono headsets:     no
        Enable native headsets:    no
...

Regards.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

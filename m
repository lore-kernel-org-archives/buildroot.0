From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Feb 2015 14:21:12 +0000 (UTC)
Subject: [Buildroot] [Bug 7874] New: X.org configure error
Message-ID: <bug-7874-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7874

           Summary: X.org configure error
           Product: buildroot
           Version: 2014.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: saiberion at web.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 5864
  --> https://bugs.busybox.net/attachment.cgi?id=5864
.config of buildroot

I tried to built modular X.org server and built stopped while configuring
xdriver_xf86-input-evdev with following message:

---
checking for XORG... no
configure: error: Package requirements (xorg-server >= 1.10 xproto inputproto)
were not met:

Package xorg-server was not found in the pkg-config search path.
Perhaps you should add the directory containing `xorg-server.pc'
to the PKG_CONFIG_PATH environment variable
No package 'xorg-server' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables XORG_CFLAGS
and XORG_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.
---
If I deselect xdriver_xf86-input-evdev in menuconfig the next selected xdriver
(in my case xdriver_xf86-input-keyboard) failed at the same step.
I can confirm this for xdriver_xf86-input-evdev, xdriver_xf86-input-keyboard,
xdriver_xf86-input-mouse and xdriver_xf86-input-tslib.
Attached my buildroot config.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

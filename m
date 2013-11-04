From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  4 Nov 2013 18:14:05 +0000 (UTC)
Subject: [Buildroot] [Bug 6656] New: Build Qt5 with ccache
Message-ID: <bug-6656-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6656

           Summary: Build Qt5 with ccache
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: espenfk at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hello.

I have tried to get Buildroot (latest from git) to build Qt5 with ccache. Some
of the packages (at least) does it by defining the compiler to be something
like "$(CCACHE) $(TARGET_CROSS)". I tried to change the
package/qt/qt5base/qt5base.mk file to change the
output/build/qt5base-5.1.1/mkspecs/devices/linux-buildroot-g++/qmake.conf file
in such a way that ccache will work, but it fails.

It fails with:
Running configuration tests...
Failed to process makespec for platform 'devices/linux-buildroot-g++'
Project ERROR: CROSS_COMPILE needs to be set via -device-option
CROSS_COMPILE=<path>
Could not read qmake configuration file
/home/espenfk/imx6/buildroot/output/build/qt5base-5.1.1/mkspecs/devices/linux-buildroot-g++/qmake.conf.
Error processing project file: /dev/null

I have tried many things from the most obious and easy: patch line 230 in
package/qt/qt5base/qt5base.mk to:
$(call QT5BASE_CONFIG_SET,BUILDROOT_CROSS_COMPILE,$(CCACHE) $(TARGET_CROSS))

to use $(notdir $(TARGET_CROSS)) and adding $(dir $(TARGET_CROSS)) to the path
(also without ccache). But the only thing that seems to work is to have the
original setup and that does not work with ccache.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 18 Aug 2016 11:57:56 +0000
Subject: [Buildroot] [Bug 9181] New: Compiling linux kernel fails if
 BR2_LINUX_KERNEL_TOOL_CPUPOWER is selected
Message-ID: <bug-9181-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9181

            Bug ID: 9181
           Summary: Compiling linux kernel fails if
                    BR2_LINUX_KERNEL_TOOL_CPUPOWER is selected
           Product: buildroot
           Version: 2016.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: Jorgen.Pihlflyckt at ajeco.fi
                CC: buildroot at uclibc.org
  Target Milestone: ---

Compiling fails just after the linux kernel has been built, if "cpupower" is
selected under "Linux Kernel Tools" with the following error:

  CC       utils/helpers/sysfs.o
In file included from utils/helpers/amd.c:9:0:
./utils/helpers/helpers.h:13:21: fatal error: libintl.h: No such file or
directory
 #include <libintl.h>
                     ^
compilation terminated.

Enabling WCHAR support under toolchain settings, and then selecting "gettext"
under "Target Packages" and "Development Tools" allows the compilation to get a
little further, but it still stops with the following error:

  CC       cpupower
./utils/idle_monitor/amd_fam14h_idle.o: In function `amd_fam14h_stop':
amd_fam14h_idle.c:(.text+0x3c3): undefined reference to `libintl_gettext'
./utils/idle_monitor/cpupower-monitor.o: In function `print_wrong_arg_exit':
cpupower-monitor.c:(.text+0x9): undefined reference to `libintl_gettext'
./utils/idle_monitor/cpupower-monitor.o: In function `print_results':

and so on. This has also been tested with buildroot-2015.11.1 using the default
configuration. The kernel configuration selected was i386 (defconfig)

-- 
You are receiving this mail because:
You are on the CC list for the bug.

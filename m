From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  9 Jan 2014 10:22:09 +0000 (UTC)
Subject: [Buildroot] [Bug 6776] New: systemd error: static declaration of
 'execvpe' follows non-static declaration
Message-ID: <bug-6776-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6776

           Summary: systemd error: static declaration of 'execvpe' follows
                    non-static declaration
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: jason at dickson.st
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 5174
  --> https://bugs.busybox.net/attachment.cgi?id=5174
.config file that causes the error

I added systemd (among other things) as one of the packages to build and then
received this error after a doing a make clean; make

This is using buildroot fetched from git. version
c991fabfcfb1984befc7a9ea5701f7de507b16fb

on debian unstable.

make[1]: Entering directory `/home/jason/buildroot/output/build/systemd-44'
/usr/bin/make  all-recursive
make[2]: Entering directory `/home/jason/buildroot/output/build/systemd-44'
Making all in po
make[3]: Entering directory `/home/jason/buildroot/output/build/systemd-44/po'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/jason/buildroot/output/build/systemd-44/po'
make[3]: Entering directory `/home/jason/buildroot/output/build/systemd-44'
  CC     src/libsystemd_daemon_la-sd-daemon.lo
  CC     src/libsystemd_id128_la-sd-id128.lo
  CC     src/libsystemd_basic_la-util.lo
  CC     src/libsystemd_basic_la-virt.lo
  CC     src/libsystemd_basic_la-label.lo
In file included from src/util.h:38:0,
                 from src/virt.c:26:
src/macro.h:39:19: error: static declaration of 'execvpe' follows non-static
declaration
In file included from src/virt.c:24:0:
/home/jason/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/unistd.h:553:12:
note: previous declaration of 'execvpe' was here
In file included from src/util.h:38:0,
                 from src/label.c:30:
src/macro.h:39:19: error: static declaration of 'execvpe' follows non-static
declaration
In file included from src/label.c:24:0:
/home/jason/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/unistd.h:553:12:
note: previous declaration of 'execvpe' was here
make[3]: *** [src/libsystemd_basic_la-label.lo] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: *** [src/libsystemd_basic_la-virt.lo] Error 1
In file included from src/util.h:38:0,
                 from src/sd-id128.c:28:
src/macro.h:39:19: error: static declaration of 'execvpe' follows non-static
declaration
In file included from src/sd-id128.c:24:0:
/home/jason/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/unistd.h:553:12:
note: previous declaration of 'execvpe' was here
make[3]: *** [src/libsystemd_id128_la-sd-id128.lo] Error 1
In file included from src/util.c:60:0:
src/macro.h:39:19: error: static declaration of 'execvpe' follows non-static
declaration
In file included from src/util.c:24:0:
/home/jason/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/unistd.h:553:12:
note: previous declaration of 'execvpe' was here
src/util.c: In function 'acquire_terminal':
src/util.c:2816:29: warning: cast increases required alignment of target type
[-Wcast-align]
src/util.c:2829:37: warning: cast increases required alignment of target type
[-Wcast-align]
src/util.c: In function 'rename_process':
src/util.c:3311:17: warning: passing argument 1 of 'strncpy' discards 'const'
qualifier from pointer target type [enabled by default]
In file included from src/util.c:23:0:
/home/jason/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/string.h:87:14:
note: expected 'char * restrict' but argument is of type 'const char *'
make[3]: *** [src/libsystemd_basic_la-util.lo] Error 1
make[3]: Leaving directory `/home/jason/buildroot/output/build/systemd-44'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/home/jason/buildroot/output/build/systemd-44'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/jason/buildroot/output/build/systemd-44'
make: *** [/home/jason/buildroot/output/build/systemd-44/.stamp_built] Error 2
jason at vm:~/buildroot$

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

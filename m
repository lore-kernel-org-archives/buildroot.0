From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Oct 2019 18:30:40 +0000
Subject: [Buildroot] [Bug 12281] New: Custom configuration fails to build
 (based on raspberrypi3_defconfig)
Message-ID: <bug-12281-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12281

            Bug ID: 12281
           Summary: Custom configuration fails to build (based on
                    raspberrypi3_defconfig)
           Product: buildroot
           Version: 2019.08.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: pmatos at igalia.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

During build of qemu 3.1.1:
In file included from /usr/include/string.h:494,
                 from
/home/pmatos/roots/br-root.rpi3_qemu/build/host-qemu-3.1.1/include/qemu/osdep.h:84,
                 from
/home/pmatos/roots/br-root.rpi3_qemu/build/host-qemu-3.1.1/linux-user/uname.c:20:
In function ?strncpy?,
    inlined from ?sys_uname? at
/home/pmatos/roots/br-root.rpi3_qemu/build/host-qemu-3.1.1/linux-user/uname.c:94:3:
/usr/include/bits/string_fortified.h:106:10: warning: ?__builtin_strncpy?
output may be truncated copying 64 bytes from a string of length 64
[-Wstringop-truncation]
  106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos
(__dest));
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function ?strncpy?,
    inlined from ?sys_uname? at
/home/pmatos/roots/br-root.rpi3_qemu/build/host-qemu-3.1.1/linux-user/uname.c:95:3:
/usr/include/bits/string_fortified.h:106:10: warning: ?__builtin_strncpy?
output may be truncated copying 64 bytes from a string of length 64
[-Wstringop-truncation]
  106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos
(__dest));
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function ?strncpy?,
    inlined from ?sys_uname? at
/home/pmatos/roots/br-root.rpi3_qemu/build/host-qemu-3.1.1/linux-user/uname.c:96:3:
/usr/include/bits/string_fortified.h:106:10: warning: ?__builtin_strncpy?
output may be truncated copying 64 bytes from a string of length 64
[-Wstringop-truncation]
  106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos
(__dest));
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function ?strncpy?,
    inlined from ?sys_uname? at
/home/pmatos/roots/br-root.rpi3_qemu/build/host-qemu-3.1.1/linux-user/uname.c:97:3:
/usr/include/bits/string_fortified.h:106:10: warning: ?__builtin_strncpy?
output may be truncated copying 64 bytes from a string of length 64
[-Wstringop-truncation]
  106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos
(__dest));
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function ?strncpy?,
    inlined from ?sys_uname? at
/home/pmatos/roots/br-root.rpi3_qemu/build/host-qemu-3.1.1/linux-user/uname.c:98:3:
/usr/include/bits/string_fortified.h:106:10: warning: ?__builtin_strncpy?
output may be truncated copying 64 bytes from a string of length 64
[-Wstringop-truncation]
  106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos
(__dest));
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function ?strncpy?,
    inlined from ?sys_uname? at
/home/pmatos/roots/br-root.rpi3_qemu/build/host-qemu-3.1.1/linux-user/uname.c:100:3:
/usr/include/bits/string_fortified.h:106:10: warning: ?__builtin_strncpy?
output may be truncated copying 64 bytes from a string of length 64
[-Wstringop-truncation]
  106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos
(__dest));
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pmatos/roots/br-root.rpi3_qemu/build/host-qemu-3.1.1/linux-user/syscall.c:254:16:
error: static declaration of ?gettid? follows non-static declaration
  254 | _syscall0(int, gettid)
      |                ^~~~~~
/home/pmatos/roots/br-root.rpi3_qemu/build/host-qemu-3.1.1/linux-user/syscall.c:185:13:
note: in definition of macro ?_syscall0?
  185 | static type name (void)   \
      |             ^~~~
In file included from /usr/include/unistd.h:1170,
                 from
/home/pmatos/roots/br-root.rpi3_qemu/build/host-qemu-3.1.1/include/qemu/osdep.h:90,
                 from
/home/pmatos/roots/br-root.rpi3_qemu/build/host-qemu-3.1.1/linux-user/syscall.c:20:
/usr/include/bits/unistd_ext.h:34:16: note: previous declaration of ?gettid?
was here
   34 | extern __pid_t gettid (void) __THROW;
      |                ^~~~~~
make[3]: ***
[/home/pmatos/roots/br-root.rpi3_qemu/build/host-qemu-3.1.1/rules.mak:69:
linux-user/syscall.o] Error 1
make[3]: *** Waiting for unfinished jobs....
In file included from /usr/include/string.h:494,
                 from
/home/pmatos/roots/br-root.rpi3_qemu/build/host-qemu-3.1.1/include/qemu/osdep.h:84,
                 from
/home/pmatos/roots/br-root.rpi3_qemu/build/host-qemu-3.1.1/linux-user/elfload.c:2:
In function ?strncpy?,
    inlined from ?fill_psinfo? at
/home/pmatos/roots/br-root.rpi3_qemu/build/host-qemu-3.1.1/linux-user/elfload.c:3158:12,
    inlined from ?fill_note_info? at
/home/pmatos/roots/br-root.rpi3_qemu/build/host-qemu-3.1.1/linux-user/elfload.c:3340:5,
    inlined from ?elf_core_dump? at
/home/pmatos/roots/br-root.rpi3_qemu/build/host-qemu-3.1.1/linux-user/elfload.c:3489:9:
/usr/include/bits/string_fortified.h:106:10: warning: ?__builtin_strncpy?
specified bound 16 equals destination size [-Wstringop-truncation]
  106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos
(__dest));
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
make[2]: *** [Makefile:483: subdir-arm-linux-user] Error 2
make[1]: *** [package/pkg-generic.mk:241:
/home/pmatos/roots/br-root.rpi3_qemu/build/host-qemu-3.1.1/.stamp_built] Error
2
make: *** [Makefile:23: _all] Error 2

Built on arch linux with host gcc 9.2.0. Attaching .config

-- 
You are receiving this mail because:
You are on the CC list for the bug.

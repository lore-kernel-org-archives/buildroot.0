From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Dec 2015 16:03:58 +0000
Subject: [Buildroot] [Bug 8541] New: fail to build host-fakeroot-1.20.2
Message-ID: <bug-8541-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8541

            Bug ID: 8541
           Summary: fail to build host-fakeroot-1.20.2
           Product: buildroot
           Version: 2015.11
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: aborniak at gmail.com
                CC: buildroot at uclibc.org

```
make[3]: Entering directory '/root/buildroot/output/build/host-fakeroot-1.20.2'
/bin/bash ./libtool  --tag=CC   --mode=compile /usr/bin/gcc -DHAVE_CONFIG_H -I.
  -I/root/buildroot/output/host/usr/include  -O2
-I/root/buildroot/output/host/usr/include -c -o libfakeroot.lo libfakeroot.c
libtool: compile:  /usr/bin/gcc -DHAVE_CONFIG_H -I.
-I/root/buildroot/output/host/usr/include -O2
-I/root/buildroot/output/host/usr/include -c libfakeroot.c  -fPIC -DPIC -o
.libs/libfakeroot.o
libfakeroot.c:1646:9: error: conflicting types for 'setxattr'
 ssize_t setxattr(const char *path, const char *name, void *value, size_t size,
int flags)
         ^
In file included from /usr/include/sys/capability.h:30:0,
                 from libfakeroot.c:131:
/usr/include/x86_64-linux-gnu/sys/xattr.h:41:12: note: previous declaration of
'setxattr' was here
 extern int setxattr (const char *__path, const char *__name,
            ^
libfakeroot.c:1667:9: error: conflicting types for 'lsetxattr'
 ssize_t lsetxattr(const char *path, const char *name, void *value, size_t
size, int flags)
         ^
In file included from /usr/include/sys/capability.h:30:0,
                 from libfakeroot.c:131:
/usr/include/x86_64-linux-gnu/sys/xattr.h:48:12: note: previous declaration of
'lsetxattr' was here
 extern int lsetxattr (const char *__path, const char *__name,
            ^
libfakeroot.c:1688:9: error: conflicting types for 'fsetxattr'
 ssize_t fsetxattr(int fd, const char *name, void *value, size_t size, int
flags)
         ^
In file included from /usr/include/sys/capability.h:30:0,
                 from libfakeroot.c:131:
/usr/include/x86_64-linux-gnu/sys/xattr.h:54:12: note: previous declaration of
'fsetxattr' was here
 extern int fsetxattr (int __fd, const char *__name, const void *__value,
            ^
libfakeroot.c:1835:9: error: conflicting types for 'removexattr'
 ssize_t removexattr(const char *path, const char *name)
         ^
In file included from /usr/include/sys/capability.h:30:0,
                 from libfakeroot.c:131:
/usr/include/x86_64-linux-gnu/sys/xattr.h:92:12: note: previous declaration of
'removexattr' was here
 extern int removexattr (const char *__path, const char *__name) __THROW;
            ^
libfakeroot.c:1856:9: error: conflicting types for 'lremovexattr'
 ssize_t lremovexattr(const char *path, const char *name)
         ^
In file included from /usr/include/sys/capability.h:30:0,
                 from libfakeroot.c:131:
/usr/include/x86_64-linux-gnu/sys/xattr.h:97:12: note: previous declaration of
'lremovexattr' was here
 extern int lremovexattr (const char *__path, const char *__name) __THROW;
            ^
libfakeroot.c:1877:9: error: conflicting types for 'fremovexattr'
 ssize_t fremovexattr(int fd, const char *name)
         ^
In file included from /usr/include/sys/capability.h:30:0,
                 from libfakeroot.c:131:
/usr/include/x86_64-linux-gnu/sys/xattr.h:101:12: note: previous declaration of
'fremovexattr' was here
 extern int fremovexattr (int __fd, const char *__name) __THROW;
            ^
libfakeroot.c: In function 'fts_read':
libfakeroot.c:1953:21: warning: passing argument 1 of 'send_get_stat64' from
incompatible pointer type
     SEND_GET_STAT64(r->fts_statp, _STAT_VER);
                     ^
libfakeroot.c:89:46: note: in definition of macro 'SEND_GET_STAT64'
 #define SEND_GET_STAT64(a,b) send_get_stat64(a)
                                              ^
In file included from libfakeroot.c:60:0:
communicate.h:209:13: note: expected 'struct stat64 *' but argument is of type
'struct stat *'
 extern void send_get_stat64(struct stat64 *buf);
             ^
libfakeroot.c: In function 'fts_children':
libfakeroot.c:1976:23: warning: passing argument 1 of 'send_get_stat64' from
incompatible pointer type
       SEND_GET_STAT64(r->fts_statp, _STAT_VER);
                       ^
libfakeroot.c:89:46: note: in definition of macro 'SEND_GET_STAT64'
 #define SEND_GET_STAT64(a,b) send_get_stat64(a)
                                              ^
In file included from libfakeroot.c:60:0:
communicate.h:209:13: note: expected 'struct stat64 *' but argument is of type
'struct stat *'
 extern void send_get_stat64(struct stat64 *buf);
             ^
Makefile:642: recipe for target 'libfakeroot.lo' failed
make[3]: *** [libfakeroot.lo] Error 1
make[3]: Leaving directory '/root/buildroot/output/build/host-fakeroot-1.20.2'
Makefile:660: recipe for target 'all-recursive' failed
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory '/root/buildroot/output/build/host-fakeroot-1.20.2'
Makefile:434: recipe for target 'all' failed
make[1]: *** [all] Error 2
make[1]: Leaving directory '/root/buildroot/output/build/host-fakeroot-1.20.2'
package/pkg-generic.mk:195: recipe for target
'/root/buildroot/output/build/host-fakeroot-1.20.2/.stamp_built' failed
make: *** [/root/buildroot/output/build/host-fakeroot-1.20.2/.stamp_built]
Error 2
root at FrontendKernel:~/buildroot# 

```

Similar as a bug 
http://www.eenyhelp.com/bug-758406-fakeroot-ftbfs-libfakeroot-c-1646-9-error-conflicting-types-etxattr-help-215394680.html.
But it was older version. 

```
root at FrontendKernel:~/buildroot# apt-cache show  libcap-dev
Package: libcap-dev
Priority: optional
Section: libdevel
Installed-Size: 101
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Original-Maintainer: Christian Kastner <debian@kvr.at>
Architecture: amd64
Source: libcap2
Version: 1:2.24-6
Provides: libcap2-dev
Depends: libcap2 (= 1:2.24-6)
```

```
root at FrontendKernel:~/buildroot# uname -a 
Linux FrontendKernel 3.19.0-41-generic #46-Ubuntu SMP Fri Dec 4 18:18:11 UTC
2015 x86_64 x86_64 x86_64 GNU/Linux


root at FrontendKernel:~/buildroot# cat /etc/os-release 
NAME="Ubuntu"
VERSION="15.04 (Vivid Vervet)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 15.04"
VERSION_ID="15.04"
HOME_URL="http://www.ubuntu.com/"
SUPPORT_URL="http://help.ubuntu.com/"
BUG_REPORT_URL="http://bugs.launchpad.net/ubuntu/"
root at FrontendKernel:~/buildroot# 

```

-- 
You are receiving this mail because:
You are on the CC list for the bug.

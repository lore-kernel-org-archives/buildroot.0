From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 03 Apr 2020 14:55:04 +0000
Subject: [Buildroot] [Bug 8541] fail to build host-fakeroot-1.20.2
In-Reply-To: <bug-8541-163@https.bugs.busybox.net/>
References: <bug-8541-163@https.bugs.busybox.net/>
Message-ID: <bug-8541-163-otawiF0joA@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8541

--- Comment #7 from 5p0ng3b0b <myandroidiptvbox@gmail.com> ---
Created attachment 8431
  --> https://bugs.busybox.net/attachment.cgi?id=8431&action=edit
build output

Fakeroot not building for me on 2020-02 build

make host-fakeroot does not finish building.

In file included from communicate.h:20,
                 from libfakeroot.c:60:
libfakeroot.c: In function 'chown':
libfakeroot.c:107:38: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_STAT(a,b) NEXT_STAT(_STAT_VER,a,b)
                                      ^~~~~~~~~
fakerootconfig.h:1:39: note: in definition of macro 'NEXT_STAT'
 #define NEXT_STAT(a,b,c) next___xstat(a,b,c)
                                       ^
libfakeroot.c:810:5: note: in expansion of macro 'INT_NEXT_STAT'
   r=INT_NEXT_STAT(path, &st);
     ^~~~~~~~~~~~~
libfakeroot.c:107:38: note: each undeclared identifier is reported only once
for each function it appears in
 #define INT_NEXT_STAT(a,b) NEXT_STAT(_STAT_VER,a,b)
                                      ^~~~~~~~~
fakerootconfig.h:1:39: note: in definition of macro 'NEXT_STAT'
 #define NEXT_STAT(a,b,c) next___xstat(a,b,c)
                                       ^
libfakeroot.c:810:5: note: in expansion of macro 'INT_NEXT_STAT'
   r=INT_NEXT_STAT(path, &st);
     ^~~~~~~~~~~~~
libfakeroot.c: In function 'lchown':
libfakeroot.c:108:40: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_LSTAT(a,b) NEXT_LSTAT(_STAT_VER,a,b)
                                        ^~~~~~~~~
fakerootconfig.h:5:41: note: in definition of macro 'NEXT_LSTAT'
 #define NEXT_LSTAT(a,b,c) next___lxstat(a,b,c)
                                         ^
libfakeroot.c:842:5: note: in expansion of macro 'INT_NEXT_LSTAT'
   r=INT_NEXT_LSTAT(path, &st);
     ^~~~~~~~~~~~~~
libfakeroot.c: In function 'fchown':
libfakeroot.c:109:40: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_FSTAT(a,b) NEXT_FSTAT(_STAT_VER,a,b)
                                        ^~~~~~~~~
fakerootconfig.h:3:41: note: in definition of macro 'NEXT_FSTAT'
 #define NEXT_FSTAT(a,b,c) next___fxstat(a,b,c)
                                         ^
libfakeroot.c:863:5: note: in expansion of macro 'INT_NEXT_FSTAT'
   r=INT_NEXT_FSTAT(fd, &st);
     ^~~~~~~~~~~~~~
libfakeroot.c: In function 'fchownat':
libfakeroot.c:110:48: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_FSTATAT(a,b,c,d) NEXT_FSTATAT(_STAT_VER,a,b,c,d)
                                                ^~~~~~~~~
fakerootconfig.h:7:49: note: in definition of macro 'NEXT_FSTATAT'
 #define NEXT_FSTATAT(a,b,c,d,e) next___fxstatat(a,b,c,d,e)
                                                 ^
libfakeroot.c:889:5: note: in expansion of macro 'INT_NEXT_FSTATAT'
   r=INT_NEXT_FSTATAT(dir_fd, path, &st, (flags & AT_SYMLINK_NOFOLLOW));
     ^~~~~~~~~~~~~~~~
libfakeroot.c: In function 'chmod':
libfakeroot.c:107:38: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_STAT(a,b) NEXT_STAT(_STAT_VER,a,b)
                                      ^~~~~~~~~
fakerootconfig.h:1:39: note: in definition of macro 'NEXT_STAT'
 #define NEXT_STAT(a,b,c) next___xstat(a,b,c)
                                       ^
libfakeroot.c:920:5: note: in expansion of macro 'INT_NEXT_STAT'
   r=INT_NEXT_STAT(path, &st);
     ^~~~~~~~~~~~~
libfakeroot.c: In function 'lchmod':
libfakeroot.c:108:40: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_LSTAT(a,b) NEXT_LSTAT(_STAT_VER,a,b)
                                        ^~~~~~~~~
fakerootconfig.h:5:41: note: in definition of macro 'NEXT_LSTAT'
 #define NEXT_LSTAT(a,b,c) next___lxstat(a,b,c)
                                         ^
libfakeroot.c:960:5: note: in expansion of macro 'INT_NEXT_LSTAT'
   r=INT_NEXT_LSTAT(path, &st);
     ^~~~~~~~~~~~~~
libfakeroot.c: In function 'fchmod':
libfakeroot.c:109:40: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_FSTAT(a,b) NEXT_FSTAT(_STAT_VER,a,b)
                                        ^~~~~~~~~
fakerootconfig.h:3:41: note: in definition of macro 'NEXT_FSTAT'
 #define NEXT_FSTAT(a,b,c) next___fxstat(a,b,c)
                                         ^
libfakeroot.c:994:5: note: in expansion of macro 'INT_NEXT_FSTAT'
   r=INT_NEXT_FSTAT(fd, &st);
     ^~~~~~~~~~~~~~
libfakeroot.c: In function 'fchmodat':
libfakeroot.c:110:48: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_FSTATAT(a,b,c,d) NEXT_FSTATAT(_STAT_VER,a,b,c,d)
                                                ^~~~~~~~~
fakerootconfig.h:7:49: note: in definition of macro 'NEXT_FSTATAT'
 #define NEXT_FSTATAT(a,b,c,d,e) next___fxstatat(a,b,c,d,e)
                                                 ^
libfakeroot.c:1026:5: note: in expansion of macro 'INT_NEXT_FSTATAT'
   r=INT_NEXT_FSTATAT(dir_fd, path, &st, flags & AT_SYMLINK_NOFOLLOW);
     ^~~~~~~~~~~~~~~~
libfakeroot.c: In function '__xmknod':
libfakeroot.c:108:40: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_LSTAT(a,b) NEXT_LSTAT(_STAT_VER,a,b)
                                        ^~~~~~~~~
fakerootconfig.h:5:41: note: in definition of macro 'NEXT_LSTAT'
 #define NEXT_LSTAT(a,b,c) next___lxstat(a,b,c)
                                         ^
libfakeroot.c:1073:5: note: in expansion of macro 'INT_NEXT_LSTAT'
   r=INT_NEXT_LSTAT(pathname, &st);
     ^~~~~~~~~~~~~~
libfakeroot.c: In function '__xmknodat':
libfakeroot.c:110:48: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_FSTATAT(a,b,c,d) NEXT_FSTATAT(_STAT_VER,a,b,c,d)
                                                ^~~~~~~~~
fakerootconfig.h:7:49: note: in definition of macro 'NEXT_FSTATAT'
 #define NEXT_FSTATAT(a,b,c,d,e) next___fxstatat(a,b,c,d,e)
                                                 ^
libfakeroot.c:1113:5: note: in expansion of macro 'INT_NEXT_FSTATAT'
   r=INT_NEXT_FSTATAT(dir_fd, pathname, &st, 0);
     ^~~~~~~~~~~~~~~~
libfakeroot.c: In function 'mkdir':
libfakeroot.c:107:38: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_STAT(a,b) NEXT_STAT(_STAT_VER,a,b)
                                      ^~~~~~~~~
fakerootconfig.h:1:39: note: in definition of macro 'NEXT_STAT'
 #define NEXT_STAT(a,b,c) next___xstat(a,b,c)
                                       ^
libfakeroot.c:1149:5: note: in expansion of macro 'INT_NEXT_STAT'
   r=INT_NEXT_STAT(path, &st);
     ^~~~~~~~~~~~~
libfakeroot.c: In function 'mkdirat':
libfakeroot.c:110:48: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_FSTATAT(a,b,c,d) NEXT_FSTATAT(_STAT_VER,a,b,c,d)
                                                ^~~~~~~~~
fakerootconfig.h:7:49: note: in definition of macro 'NEXT_FSTATAT'
 #define NEXT_FSTATAT(a,b,c,d,e) next___fxstatat(a,b,c,d,e)
                                                 ^
libfakeroot.c:1179:5: note: in expansion of macro 'INT_NEXT_FSTATAT'
   r=INT_NEXT_FSTATAT(dir_fd, path, &st, 0);
     ^~~~~~~~~~~~~~~~
libfakeroot.c: In function 'unlink':
libfakeroot.c:108:40: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_LSTAT(a,b) NEXT_LSTAT(_STAT_VER,a,b)
                                        ^~~~~~~~~
fakerootconfig.h:5:41: note: in definition of macro 'NEXT_LSTAT'
 #define NEXT_LSTAT(a,b,c) next___lxstat(a,b,c)
                                         ^
libfakeroot.c:1213:5: note: in expansion of macro 'INT_NEXT_LSTAT'
   r=INT_NEXT_LSTAT(pathname, &st);
     ^~~~~~~~~~~~~~
libfakeroot.c: In function 'unlinkat':
libfakeroot.c:110:48: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_FSTATAT(a,b,c,d) NEXT_FSTATAT(_STAT_VER,a,b,c,d)
                                                ^~~~~~~~~
fakerootconfig.h:7:49: note: in definition of macro 'NEXT_FSTATAT'
 #define NEXT_FSTATAT(a,b,c,d,e) next___fxstatat(a,b,c,d,e)
                                                 ^
libfakeroot.c:1232:5: note: in expansion of macro 'INT_NEXT_FSTATAT'
   r=INT_NEXT_FSTATAT(dir_fd, pathname, &st, (flags&~AT_REMOVEDIR) |
AT_SYMLINK_NOFOLLOW);
     ^~~~~~~~~~~~~~~~
libfakeroot.c: In function 'rmdir':
libfakeroot.c:108:40: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_LSTAT(a,b) NEXT_LSTAT(_STAT_VER,a,b)
                                        ^~~~~~~~~
fakerootconfig.h:5:41: note: in definition of macro 'NEXT_LSTAT'
 #define NEXT_LSTAT(a,b,c) next___lxstat(a,b,c)
                                         ^
libfakeroot.c:1256:5: note: in expansion of macro 'INT_NEXT_LSTAT'
   r=INT_NEXT_LSTAT(pathname, &st);
     ^~~~~~~~~~~~~~
libfakeroot.c: In function 'remove':
libfakeroot.c:108:40: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_LSTAT(a,b) NEXT_LSTAT(_STAT_VER,a,b)
                                        ^~~~~~~~~
fakerootconfig.h:5:41: note: in definition of macro 'NEXT_LSTAT'
 #define NEXT_LSTAT(a,b,c) next___lxstat(a,b,c)
                                         ^
libfakeroot.c:1276:5: note: in expansion of macro 'INT_NEXT_LSTAT'
   r=INT_NEXT_LSTAT(pathname, &st);
     ^~~~~~~~~~~~~~
libfakeroot.c: In function 'rename':
libfakeroot.c:108:40: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_LSTAT(a,b) NEXT_LSTAT(_STAT_VER,a,b)
                                        ^~~~~~~~~
fakerootconfig.h:5:41: note: in definition of macro 'NEXT_LSTAT'
 #define NEXT_LSTAT(a,b,c) next___lxstat(a,b,c)
                                         ^
libfakeroot.c:1306:5: note: in expansion of macro 'INT_NEXT_LSTAT'
   r=INT_NEXT_LSTAT(newpath, &st);
     ^~~~~~~~~~~~~~
libfakeroot.c: In function 'renameat':
libfakeroot.c:110:48: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_FSTATAT(a,b,c,d) NEXT_FSTATAT(_STAT_VER,a,b,c,d)
                                                ^~~~~~~~~
fakerootconfig.h:7:49: note: in definition of macro 'NEXT_FSTATAT'
 #define NEXT_FSTATAT(a,b,c,d,e) next___fxstatat(a,b,c,d,e)
                                                 ^
libfakeroot.c:1330:5: note: in expansion of macro 'INT_NEXT_FSTATAT'
   r=INT_NEXT_FSTATAT(newdir_fd, newpath, &st, AT_SYMLINK_NOFOLLOW);
     ^~~~~~~~~~~~~~~~
libfakeroot.c: In function 'common_setxattr':
libfakeroot.c:112:33: warning: implicit declaration of function
'SEND_GET_XATTR'; did you mean 'SEND_GET_XATTR64'?
[-Wimplicit-function-declaration]
 #define INT_SEND_GET_XATTR(a,b) SEND_GET_XATTR(a,b,_STAT_VER)
                                 ^~~~~~~~~~~~~~
libfakeroot.c:1587:3: note: in expansion of macro 'INT_SEND_GET_XATTR'
   INT_SEND_GET_XATTR(st, &xattr);
   ^~~~~~~~~~~~~~~~~~
libfakeroot.c:112:52: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_SEND_GET_XATTR(a,b) SEND_GET_XATTR(a,b,_STAT_VER)
                                                    ^~~~~~~~~
libfakeroot.c:1587:3: note: in expansion of macro 'INT_SEND_GET_XATTR'
   INT_SEND_GET_XATTR(st, &xattr);
   ^~~~~~~~~~~~~~~~~~
libfakeroot.c: In function 'common_getxattr':
libfakeroot.c:112:52: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_SEND_GET_XATTR(a,b) SEND_GET_XATTR(a,b,_STAT_VER)
                                                    ^~~~~~~~~
libfakeroot.c:1605:3: note: in expansion of macro 'INT_SEND_GET_XATTR'
   INT_SEND_GET_XATTR(st, &xattr);
   ^~~~~~~~~~~~~~~~~~
libfakeroot.c: In function 'common_listxattr':
libfakeroot.c:112:52: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_SEND_GET_XATTR(a,b) SEND_GET_XATTR(a,b,_STAT_VER)
                                                    ^~~~~~~~~
libfakeroot.c:1623:3: note: in expansion of macro 'INT_SEND_GET_XATTR'
   INT_SEND_GET_XATTR(st, &xattr);
   ^~~~~~~~~~~~~~~~~~
libfakeroot.c: In function 'common_removexattr':
libfakeroot.c:112:52: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_SEND_GET_XATTR(a,b) SEND_GET_XATTR(a,b,_STAT_VER)
                                                    ^~~~~~~~~
libfakeroot.c:1641:3: note: in expansion of macro 'INT_SEND_GET_XATTR'
   INT_SEND_GET_XATTR(st, &xattr);
   ^~~~~~~~~~~~~~~~~~
In file included from communicate.h:20,
                 from libfakeroot.c:60:
libfakeroot.c: In function 'setxattr':
libfakeroot.c:107:38: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_STAT(a,b) NEXT_STAT(_STAT_VER,a,b)
                                      ^~~~~~~~~
fakerootconfig.h:1:39: note: in definition of macro 'NEXT_STAT'
 #define NEXT_STAT(a,b,c) next___xstat(a,b,c)
                                       ^
libfakeroot.c:1664:5: note: in expansion of macro 'INT_NEXT_STAT'
   r=INT_NEXT_STAT(path, &st);
     ^~~~~~~~~~~~~
libfakeroot.c: In function 'lsetxattr':
libfakeroot.c:108:40: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_LSTAT(a,b) NEXT_LSTAT(_STAT_VER,a,b)
                                        ^~~~~~~~~
fakerootconfig.h:5:41: note: in definition of macro 'NEXT_LSTAT'
 #define NEXT_LSTAT(a,b,c) next___lxstat(a,b,c)
                                         ^
libfakeroot.c:1685:5: note: in expansion of macro 'INT_NEXT_LSTAT'
   r=INT_NEXT_LSTAT(path, &st);
     ^~~~~~~~~~~~~~
libfakeroot.c: In function 'fsetxattr':
libfakeroot.c:109:40: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_FSTAT(a,b) NEXT_FSTAT(_STAT_VER,a,b)
                                        ^~~~~~~~~
fakerootconfig.h:3:41: note: in definition of macro 'NEXT_FSTAT'
 #define NEXT_FSTAT(a,b,c) next___fxstat(a,b,c)
                                         ^
libfakeroot.c:1706:5: note: in expansion of macro 'INT_NEXT_FSTAT'
   r=INT_NEXT_FSTAT(fd, &st);
     ^~~~~~~~~~~~~~
libfakeroot.c: In function 'getxattr':
libfakeroot.c:107:38: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_STAT(a,b) NEXT_STAT(_STAT_VER,a,b)
                                      ^~~~~~~~~
fakerootconfig.h:1:39: note: in definition of macro 'NEXT_STAT'
 #define NEXT_STAT(a,b,c) next___xstat(a,b,c)
                                       ^
libfakeroot.c:1727:5: note: in expansion of macro 'INT_NEXT_STAT'
   r=INT_NEXT_STAT(path, &st);
     ^~~~~~~~~~~~~
libfakeroot.c: In function 'lgetxattr':
libfakeroot.c:108:40: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_LSTAT(a,b) NEXT_LSTAT(_STAT_VER,a,b)
                                        ^~~~~~~~~
fakerootconfig.h:5:41: note: in definition of macro 'NEXT_LSTAT'
 #define NEXT_LSTAT(a,b,c) next___lxstat(a,b,c)
                                         ^
libfakeroot.c:1748:5: note: in expansion of macro 'INT_NEXT_LSTAT'
   r=INT_NEXT_LSTAT(path, &st);
     ^~~~~~~~~~~~~~
libfakeroot.c: In function 'fgetxattr':
libfakeroot.c:109:40: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_FSTAT(a,b) NEXT_FSTAT(_STAT_VER,a,b)
                                        ^~~~~~~~~
fakerootconfig.h:3:41: note: in definition of macro 'NEXT_FSTAT'
 #define NEXT_FSTAT(a,b,c) next___fxstat(a,b,c)
                                         ^
libfakeroot.c:1769:5: note: in expansion of macro 'INT_NEXT_FSTAT'
   r=INT_NEXT_FSTAT(fd, &st);
     ^~~~~~~~~~~~~~
libfakeroot.c: In function 'listxattr':
libfakeroot.c:107:38: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_STAT(a,b) NEXT_STAT(_STAT_VER,a,b)
                                      ^~~~~~~~~
fakerootconfig.h:1:39: note: in definition of macro 'NEXT_STAT'
 #define NEXT_STAT(a,b,c) next___xstat(a,b,c)
                                       ^
libfakeroot.c:1790:5: note: in expansion of macro 'INT_NEXT_STAT'
   r=INT_NEXT_STAT(path, &st);
     ^~~~~~~~~~~~~
libfakeroot.c: In function 'llistxattr':
libfakeroot.c:108:40: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_LSTAT(a,b) NEXT_LSTAT(_STAT_VER,a,b)
                                        ^~~~~~~~~
fakerootconfig.h:5:41: note: in definition of macro 'NEXT_LSTAT'
 #define NEXT_LSTAT(a,b,c) next___lxstat(a,b,c)
                                         ^
libfakeroot.c:1811:5: note: in expansion of macro 'INT_NEXT_LSTAT'
   r=INT_NEXT_LSTAT(path, &st);
     ^~~~~~~~~~~~~~
libfakeroot.c: In function 'flistxattr':
libfakeroot.c:109:40: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_FSTAT(a,b) NEXT_FSTAT(_STAT_VER,a,b)
                                        ^~~~~~~~~
fakerootconfig.h:3:41: note: in definition of macro 'NEXT_FSTAT'
 #define NEXT_FSTAT(a,b,c) next___fxstat(a,b,c)
                                         ^
libfakeroot.c:1832:5: note: in expansion of macro 'INT_NEXT_FSTAT'
   r=INT_NEXT_FSTAT(fd, &st);
     ^~~~~~~~~~~~~~
libfakeroot.c: In function 'removexattr':
libfakeroot.c:107:38: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_STAT(a,b) NEXT_STAT(_STAT_VER,a,b)
                                      ^~~~~~~~~
fakerootconfig.h:1:39: note: in definition of macro 'NEXT_STAT'
 #define NEXT_STAT(a,b,c) next___xstat(a,b,c)
                                       ^
libfakeroot.c:1853:5: note: in expansion of macro 'INT_NEXT_STAT'
   r=INT_NEXT_STAT(path, &st);
     ^~~~~~~~~~~~~
libfakeroot.c: In function 'lremovexattr':
libfakeroot.c:108:40: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_LSTAT(a,b) NEXT_LSTAT(_STAT_VER,a,b)
                                        ^~~~~~~~~
fakerootconfig.h:5:41: note: in definition of macro 'NEXT_LSTAT'
 #define NEXT_LSTAT(a,b,c) next___lxstat(a,b,c)
                                         ^
libfakeroot.c:1874:5: note: in expansion of macro 'INT_NEXT_LSTAT'
   r=INT_NEXT_LSTAT(path, &st);
     ^~~~~~~~~~~~~~
libfakeroot.c: In function 'fremovexattr':
libfakeroot.c:109:40: error: '_STAT_VER' undeclared (first use in this
function); did you mean 'FSTAT_ARG'?
 #define INT_NEXT_FSTAT(a,b) NEXT_FSTAT(_STAT_VER,a,b)
                                        ^~~~~~~~~
fakerootconfig.h:3:41: note: in definition of macro 'NEXT_FSTAT'
 #define NEXT_FSTAT(a,b,c) next___fxstat(a,b,c)
                                         ^
libfakeroot.c:1895:5: note: in expansion of macro 'INT_NEXT_FSTAT'
   r=INT_NEXT_FSTAT(fd, &st);
     ^~~~~~~~~~~~~~
/bin/bash ./libtool  --tag=CC   --mode=link /usr/bin/gcc  -O2
-I/home/chief/buildroot-2020.02/output/host/include 
-L/home/chief/buildroot-2020.02/output/host/lib
-Wl,-rpath,/home/chief/buildroot-2020.02/output/host/lib -o libcommunicate.la 
communicate.lo  -lpthread -ldl
make[3]: *** [Makefile:652: libfakeroot.lo] Error 1
make[3]: *** Waiting for unfinished jobs....
libtool: link: /usr/bin/gcc -O2
-I/home/chief/buildroot-2020.02/output/host/include -Wl,-rpath
-Wl,/home/chief/buildroot-2020.02/output/host/lib -o simple simple.o 
-L/home/chief/buildroot-2020.02/output/host/lib -lpthread -ldl
libtool: link: /usr/bin/ar cru .libs/libmacosx.a .libs/libfakeroot_inode64.o
.libs/libfakeroot_unix2003.o
/usr/bin/ar: `u' modifier ignored since `D' is the default (see `U')
libtool: link: /usr/bin/ranlib .libs/libmacosx.a
libtool: link: ( cd ".libs" && rm -f "libmacosx.la" && ln -s "../libmacosx.la"
"libmacosx.la" )
libtool: link: /usr/bin/ar cru .libs/libcommunicate.a .libs/communicate.o
/usr/bin/ar: `u' modifier ignored since `D' is the default (see `U')
libtool: link: /usr/bin/ranlib .libs/libcommunicate.a
libtool: link: ( cd ".libs" && rm -f "libcommunicate.la" && ln -s
"../libcommunicate.la" "libcommunicate.la" )
make[3]: Leaving directory
'/home/chief/buildroot-2020.02/output/build/host-fakeroot-1.20.2'
make[2]: *** [Makefile:670: all-recursive] Error 1
make[2]: Leaving directory
'/home/chief/buildroot-2020.02/output/build/host-fakeroot-1.20.2'
make[1]: *** [Makefile:445: all] Error 2
make[1]: Leaving directory
'/home/chief/buildroot-2020.02/output/build/host-fakeroot-1.20.2'
make: *** [package/pkg-generic.mk:269:
/home/chief/buildroot-2020.02/output/build/host-fakeroot-1.20.2/.stamp_built]
Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.

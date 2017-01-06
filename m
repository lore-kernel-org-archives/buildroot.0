From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 06 Jan 2017 08:27:18 +0000
Subject: [Buildroot] [Bug 9566] New: [kmod] Compilation fails with uclibc
Message-ID: <bug-9566-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9566

            Bug ID: 9566
           Summary: [kmod] Compilation fails with uclibc
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: lipkegu at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Reproduce steps:
* use a clean environment
* select ulibc-ng
* use eudev + devtmpfs
* build it...


>>> kmod 23 Building
PATH="/home/guido/buildroot/output/host/bin:/home/guido/buildroot/output/host/sbin:/home/guido/buildroot/output/host/usr/bin:/home/guido/buildroot/output/host/usr/sbin:/home/guido/bin:/home/guido/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
 /usr/bin/make   -C /home/guido/buildroot/output/build/kmod-23/
make[1]: Verzeichnis ?/home/guido/buildroot/output/build/kmod-23? wird betreten
/usr/bin/make --no-print-directory all-recursive
Making all in .
  GEN      libkmod/libkmod.pc
  CC       libkmod/libkmod.lo
  CC       libkmod/libkmod-list.lo
  CC       libkmod/libkmod-config.lo
  CC       libkmod/libkmod-index.lo
  CC       libkmod/libkmod-module.lo
In file included from libkmod/libkmod-list.c:23:0:
libkmod/libkmod-internal.h:44:6: Warnung: #warning neither secure_getenv nor
__secure_getenv is available [-Wcpp]
 #    warning neither secure_getenv nor __secure_getenv is available
      ^
In file included from libkmod/libkmod-config.c:36:0:
libkmod/libkmod-internal.h:44:6: Warnung: #warning neither secure_getenv nor
__secure_getenv is available [-Wcpp]
 #    warning neither secure_getenv nor __secure_getenv is available
      ^
In file included from libkmod/libkmod-index.c:33:0:
libkmod/libkmod-internal.h:44:6: Warnung: #warning neither secure_getenv nor
__secure_getenv is available [-Wcpp]
 #    warning neither secure_getenv nor __secure_getenv is available
      ^
  CC       libkmod/libkmod-file.lo
In file included from libkmod/libkmod-module.c:45:0:
libkmod/libkmod-internal.h:44:6: Warnung: #warning neither secure_getenv nor
__secure_getenv is available [-Wcpp]
 #    warning neither secure_getenv nor __secure_getenv is available
      ^
In file included from libkmod/libkmod.c:38:0:
libkmod/libkmod-internal.h:44:6: Warnung: #warning neither secure_getenv nor
__secure_getenv is available [-Wcpp]
 #    warning neither secure_getenv nor __secure_getenv is available
      ^
In file included from libkmod/libkmod-file.c:39:0:
libkmod/libkmod-internal.h:44:6: Warnung: #warning neither secure_getenv nor
__secure_getenv is available [-Wcpp]
 #    warning neither secure_getenv nor __secure_getenv is available
      ^
  CC       libkmod/libkmod-elf.lo
In file included from libkmod/libkmod-elf.c:29:0:
libkmod/libkmod-internal.h:44:6: Warnung: #warning neither secure_getenv nor
__secure_getenv is available [-Wcpp]
 #    warning neither secure_getenv nor __secure_getenv is available
      ^
  CC       libkmod/libkmod-signature.lo
  CC       shared/array.lo
  CC       shared/hash.lo
In file included from libkmod/libkmod-signature.c:29:0:
libkmod/libkmod-internal.h:44:6: Warnung: #warning neither secure_getenv nor
__secure_getenv is available [-Wcpp]
 #    warning neither secure_getenv nor __secure_getenv is available
      ^
  CC       shared/strbuf.lo
  CC       shared/util.lo
  CC       libkmod/python/kmod/libkmod_python_kmod_kmod_la-kmod.lo
  CC       libkmod/python/kmod/libkmod_python_kmod_list_la-list.lo
  CC       libkmod/python/kmod/libkmod_python_kmod_module_la-module.lo
  CC       libkmod/python/kmod/libkmod_python_kmod__util_la-_util.lo
  CCLD     shared/libshared.la
  CCLD     libkmod/libkmod.la
  CCLD     libkmod/libkmod-internal.la
libkmod/.libs/libkmod-module.o: In function `kmod_module_remove_module':
libkmod-module.c:(.text.kmod_module_remove_module+0x20): undefined reference to
`delete_module'
libkmod/.libs/libkmod-module.o: In function `kmod_module_insert_module':
libkmod-module.c:(.text.kmod_module_insert_module+0x21c): undefined reference
to `init_module'
collect2: error: ld returned 1 exit status
Makefile:1322: die Regel f?r Ziel ?libkmod/libkmod.la? scheiterte
make[3]: *** [libkmod/libkmod.la] Fehler 1
make[3]: *** Auf noch nicht beendete Prozesse wird gewartet ?
Makefile:2074: die Regel f?r Ziel ?all-recursive? scheiterte
make[2]: *** [all-recursive] Fehler 1
Makefile:1151: die Regel f?r Ziel ?all? scheiterte
make[1]: *** [all] Fehler 2
make[1]: Verzeichnis ?/home/guido/buildroot/output/build/kmod-23? wird
verlassen
package/pkg-generic.mk:216: die Regel f?r Ziel
?/home/guido/buildroot/output/build/kmod-23/.stamp_built? scheiterte

    make: *** [/home/guido/buildroot/output/build/kmod-23/.stamp_built] Fehler
2

-- 
You are receiving this mail because:
You are on the CC list for the bug.

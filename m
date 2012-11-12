From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Nov 2012 12:28:49 +0000 (UTC)
Subject: [Buildroot] [Bug 5666] New: Fails to build python 2.7.2 for 2440 arm
Message-ID: <bug-5666-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5666

           Summary: Fails to build python 2.7.2 for 2440 arm
           Product: buildroot
           Version: 2012.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: hardcore at hardcoreforensics.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The build process for  Python under the samsung cpu 2440 fails to build with
the following error


bob at bob-virtual-machine:~/buildroot-2012.08$ make
>>> python 2.7.2 Building
PATH="/home/bob/buildroot-2012.08/output/host/bin:/home/bob/buildroot-2012.08/output/host/usr/bin:/home/bob/buildroot-2012.08/output/host/usr/sbin/:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
PERLLIB="/home/bob/buildroot-2012.08/output/host/usr/lib/perl"
PYTHON_MODULES_INCLUDE=/home/bob/buildroot-2012.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include
PYTHON_MODULES_LIB="/home/bob/buildroot-2012.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/lib
/home/bob/buildroot-2012.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib"
/usr/bin/make -j2  -C /home/bob/buildroot-2012.08/output/build/python-2.7.2/
make[1]: Entering directory
`/home/bob/buildroot-2012.08/output/build/python-2.7.2'
/home/bob/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-c -fno-strict-aliasing  -pipe -Os  -DNDEBUG -g -fwrapv -O3 -Wall
-Wstrict-prototypes  -I. -IInclude -I./Include  -fPIC -DPy_BUILD_CORE -o
Modules/python.o ./Modules/python.c
/home/bob/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-c -fno-strict-aliasing  -pipe -Os  -DNDEBUG -g -fwrapv -O3 -Wall
-Wstrict-prototypes  -I. -IInclude -I./Include  -fPIC -DPy_BUILD_CORE -o
Parser/acceler.o Parser/acceler.c
In file included from Include/Python.h:85:0,
                 from ./Modules/python.c:3:
Include/unicodeobject.h:575:20: warning: type defaults to 'int' in declaration
of 'wchar_t'
Include/unicodeobject.h:575:28: error: expected ';', ',' or ')' before '*'
token
Include/unicodeobject.h:593:14: warning: type defaults to 'int' in declaration
of 'wchar_t'
Include/unicodeobject.h:593:22: error: expected ';', ',' or ')' before '*'
token
In file included from Include/Python.h:85:0,
                 from Include/pgenheaders.h:10,
                 from Parser/acceler.c:13:
Include/unicodeobject.h:575:20: warning: type defaults to 'int' in declaration
of 'wchar_t'
Include/unicodeobject.h:575:28: error: expected ';', ',' or ')' before '*'
token
Include/unicodeobject.h:593:14: warning: type defaults to 'int' in declaration
of 'wchar_t'
Include/unicodeobject.h:593:22: error: expected ';', ',' or ')' before '*'
token
make[1]: *** [Modules/python.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: *** [Parser/acceler.o] Error 1
make[1]: Leaving directory
`/home/bob/buildroot-2012.08/output/build/python-2.7.2'
make: *** [/home/bob/buildroot-2012.08/output/build/python-2.7.2/.stamp_built]
Error 2
bob at bob-virtual-machine:~/buildroot-2012.08$

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

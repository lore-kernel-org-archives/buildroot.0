From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 20 Mar 2010 16:23:38 +0000 (UTC)
Subject: [Buildroot] [Bug 1369] New: cannot build radvd (flex problem)
Message-ID: <bug-1369-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1369

           Summary: cannot build radvd (flex problem)
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: alex at digriz.org.uk
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When trying to build radvd (which now is at version 1.6, you only call for 1.6
so this needs bumping up too) I get the following error:
----
checking dependency style of
/usr/src/wag54g/buildroot/output/staging/usr/bin/mipsel-linux-uclibc-gcc -Os
-pipe -Os  -I/usr/src/wag54g/buildroot/output/staging/usr/include
-I/usr/src/wag54g/buildroot/output/staging/include
--sysroot=/usr/src/wag54g/buildroot/output/staging/ -isysroot
/usr/src/wag54g/buildroot/output/staging -mtune=mips32 -mabi=32 -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64... gcc3
checking for a BSD-compatible install... /usr/bin/install -c
checking for rm... /bin/rm
checking for sed... /usr/src/wag54g/buildroot/output/toolchain/bin/sed
checking for ln... /bin/ln
checking for bison... bison -y
checking for flex... flex
checking for yywrap in -lfl... yes
checking lex output file root... configure: error: cannot find output from
flex; giving up
make: *** [/usr/src/wag54g/buildroot/output/build/radvd-1.5/.stamp_configured]
Error 1
----

If I hunt for the relevent bit in config.log I find:
----
configure:3149: found /bin/ln
configure:3161: result: /bin/ln
configure:3172: checking for bison
configure:3188: found /usr/bin/bison
configure:3198: result: bison -y
configure:3214: checking for flex
configure:3230: found /usr/src/wag54g/buildroot/output/staging/usr/bin/flex
configure:3240: result: flex
configure:3253: checking for yywrap in -lfl
configure:3283:
/usr/src/wag54g/buildroot/output/staging/usr/bin/mipsel-linux-uclibc-gcc -Os
-pipe -Os  -I/usr/src/wag54g/buildroot/output/staging/usr/include
-I/usr/src/wag54g/buildroot/output/staging/include
--sysroot=/usr/src/wag54g/buildroot/output/staging/ -isysroot
/usr/src/wag54g/buildroot/output/staging -mtune=mips32 -mabi=32 -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -o conftest
-Os -pipe -Os  -I/usr/src/wag54g/buildroot/output/staging/usr/include
-I/usr/src/wag54g/buildroot/output/staging/include
--sysroot=/usr/src/wag54g/buildroot/output/staging/ -isysroot
/usr/src/wag54g/buildroot/output/staging -mtune=mips32 -mabi=32 -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 
-L/usr/src/wag54g/buildroot/output/staging/lib
-L/usr/src/wag54g/buildroot/output/staging/usr/lib
--sysroot=/usr/src/wag54g/buildroot/output/staging/ conftest.c -lfl   >&5
configure:3289: $? = 0
configure:3293: test -z 
                         || test ! -s conftest.err
configure:3296: $? = 0
configure:3299: test -s conftest
configure:3302: $? = 0
configure:3315: result: yes
configure:3393: checking lex output file root
configure:3404: flex conftest.l
/lib/ld-uClibc.so.0: No such file or directory
configure:3407: $? = 255
configure:3414: error: cannot find output from flex; giving up
----

I have not the slightest idea where to begin with trying to fix this, but happy
to test anything anyone sends to me.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

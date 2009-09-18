From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Sep 2009 21:53:34 +0000 (UTC)
Subject: [Buildroot] [Bug 617] New: netkit/inetd requires RPC and fails to
 build if RPC is disabled
Message-ID: <bug-617-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=617

            Target: arm-eabi
             Build: buildroot-2009.08
           Summary: netkit/inetd requires RPC and fails to build if RPC is
                    disabled
           Product: buildroot
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: sethml at ofb.net
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=659)
 --> (https://bugs.busybox.net/attachment.cgi?id=659)
'make menuconfig' results which cause bug

I just tried to build with RPC disabled, and got the following error.  I'm not
sure why it was trying to build netkit-base - perhaps because I was building
netkit-telnet.  It should certainly be possible to build a telnet client, and
probably possible to build a telnet server, without RPC.  My .config is
attached.

make[2]: Entering directory
`/home/seth/buildroot-2009.08/build_arm/netkit-base-0.17/inetd'
/home/seth/buildroot-2009.08/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc
-O2 -Wall -W -Wpointer-arith -Wbad-function-cast -Wcast-qual
-Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations
-Wnested-externs -Winline  inetd.c -c
inetd.c: In function 'exec_child':
inetd.c:380: warning: comparison between signed and unsigned
inetd.c: In function 'setup':
inetd.c:873: warning: too many arguments for format
inetd.c:892: warning: too many arguments for format
inetd.c: In function 'register_rpc':
inetd.c:942: warning: too many arguments for format
inetd.c: In function 'bump_nofile':
inetd.c:1026: warning: comparison between signed and unsigned
inetd.c:1029: warning: format '%d' expects type 'int', but argument 3 has type
'rlim_t'
/home/seth/buildroot-2009.08/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc
-O2 -Wall -W -Wpointer-arith -Wbad-function-cast -Wcast-qual
-Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations
-Wnested-externs -Winline  servtab.c -c
/home/seth/buildroot-2009.08/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc
-O2 -Wall -W -Wpointer-arith -Wbad-function-cast -Wcast-qual
-Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations
-Wnested-externs -Winline  builtins.c -c
/home/seth/buildroot-2009.08/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc
-O2 -Wall -W -Wpointer-arith -Wbad-function-cast -Wcast-qual
-Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations
-Wnested-externs -Winline  sig.c -c
/home/seth/buildroot-2009.08/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc
-O2 -Wall -W -Wpointer-arith -Wbad-function-cast -Wcast-qual
-Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations
-Wnested-externs -Winline  daemon.c -c
/home/seth/buildroot-2009.08/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc
-O2 -Wall -W -Wpointer-arith -Wbad-function-cast -Wcast-qual
-Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations
-Wnested-externs -Winline  setproctitle.c -c
/home/seth/buildroot-2009.08/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc
-O2 -Wall -W -Wpointer-arith -Wbad-function-cast -Wcast-qual
-Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations
-Wnested-externs -Winline  mysleep.c -c
/home/seth/buildroot-2009.08/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc
 inetd.o servtab.o builtins.o sig.o daemon.o setproctitle.o mysleep.o  -o inetd
inetd.o: In function `unregister_rpc':
inetd.c:(.text+0x84): undefined reference to `pmap_unset'
inetd.c:(.text+0xc8): undefined reference to `pmap_unset'
inetd.o: In function `register_rpc':
inetd.c:(.text+0x174): undefined reference to `pmap_unset'
inetd.c:(.text+0x198): undefined reference to `pmap_set'
servtab.o: In function `loadconfigent':
servtab.c:(.text+0xe60): undefined reference to `getrpcbyname'
collect2: ld returned 1 exit status
make[2]: *** [inetd] Error 1
make[2]: Leaving directory
`/home/seth/buildroot-2009.08/build_arm/netkit-base-0.17/inetd'
make[1]: *** [inetd.build] Error 2
make[1]: Leaving directory
`/home/seth/buildroot-2009.08/build_arm/netkit-base-0.17'
make: *** [/home/seth/buildroot-2009.08/build_arm/netkit-base-0.17/inetd/inetd]
Error 2


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

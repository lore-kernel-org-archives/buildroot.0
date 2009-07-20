From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 20 Jul 2009 13:53:23 +0000 (UTC)
Subject: [Buildroot] [Bug 473] New: memstat_0.5.tar.gz has install with -D
 and that fails "make" (last buildroot git)
Message-ID: <bug-473-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=473

              Host: i386-pc-linux-gnu
            Target: powerpc-unknown-linux-gnu
             Build: i386-pc-linux-gnu
           Summary: memstat_0.5.tar.gz has install with -D and that fails
                    "make" (last buildroot git)
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: etienne_lorrain at yahoo.fr
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


make
...
gzip -d -c /home/elorrain/buildroot/dl/memstat_0.5.tar.gz | tar -C
/home/elorrain/buildroot/build_powerpc   -xf -
toolchain/patch-kernel.sh /home/elorrain/buildroot/build_powerpc/memstat-0.5
package/memstat/ memstat-0.5\*.patch
touch /home/elorrain/buildroot/build_powerpc/memstat-0.5/.unpacked
touch /home/elorrain/buildroot/build_powerpc/memstat-0.5/.configured
/home/elorrain/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-gcc
-Os -pipe -Os  -I/home/elorrain/buildroot/build_powerpc/staging_dir/usr/include
-I/home/elorrain/buildroot/build_powerpc/staging_dir/include
--sysroot=/home/elorrain/buildroot/build_powerpc/staging_dir/ -isysroot
/home/elorrain/buildroot/build_powerpc/staging_dir -mtune=440fp
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-L/home/elorrain/buildroot/build_powerpc/staging_dir/lib
-L/home/elorrain/buildroot/build_powerpc/staging_dir/usr/lib
--sysroot=/home/elorrain/buildroot/build_powerpc/staging_dir/
/home/elorrain/buildroot/build_powerpc/memstat-0.5/memstat.c -o
/home/elorrain/buildroot/build_powerpc/memstat-0.5/memstat
[ -e
/home/elorrain/buildroot/project_build_powerpc/Eqam4G/root/etc/memstat.conf ]
|| \
        /usr/bin/install -m 0644 -D
/home/elorrain/buildroot/build_powerpc/memstat-0.5/memstat.conf
/home/elorrain/buildroot/project_build_powerpc/Eqam4G/root/etc
/usr/bin/install: cannot overwrite directory
`/home/elorrain/buildroot/project_build_powerpc/Eqam4G/root/etc' with
non-directory
make: ***
[/home/elorrain/buildroot/project_build_powerpc/Eqam4G/root/usr/bin/memstat]
Error 1

[elorrain at cobra buildroot]$ /usr/bin/install -m 0644 
/home/elorrain/buildroot/build_powerpc/memstat-0.5/memstat.conf
/home/elorrain/buildroot/project_build_powerpc/Eqam4G/root/etc/
[elorrain at cobra buildroot]$


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

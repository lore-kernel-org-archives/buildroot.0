From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  2 Aug 2009 11:18:13 +0000 (UTC)
Subject: [Buildroot] [Bug 525] New: sed can't find libintl
Message-ID: <bug-525-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=525

              Host: Ubuntu 9.0.4 Server 32 Bit
            Target: i686
             Build: i686
           Summary: sed can't find libintl
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: d.albano at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hi,

i'm trying to compile sed, but without success. It complains about missing
libintl, but it is in staging dir (under usr/lib)

daniele at linux-ubuntu-dev:~/Development/OPBXA/buildroot-git$ ls
build_i686/staging_dir/usr/lib/libintl.*
build_i686/staging_dir/usr/lib/libintl.a  
build_i686/staging_dir/usr/lib/libintl.so.8
build_i686/staging_dir/usr/lib/libintl.la 
build_i686/staging_dir/usr/lib/libintl.so.8.0.1
build_i686/staging_dir/usr/lib/libintl.so

If i try to build sed manually(entering in build_i686/sed-x.x.x and doing make)
after that buildroot fails  it compiles successfully and seems to looking for
the correct libraries. If i do an ldd on sed, i get this:
daniele at linux-ubuntu-dev:~/Development/OPBXA/buildroot-git/build_i686/sed-4.1.5/sed$
ldd sed
        linux-gate.so.1 =>  (0xb7f25000)
        libintl.so.8 => not found
        libc.so.6 => /lib/tls/i686/cmov/libc.so.6 (0xb7dbb000)
        /lib/ld-linux.so.2 (0xb7f26000)

On my system libintl.so.8 doesn't exists, i searched for it using find (find /
-name libintl.so.8) and using locate (locate libintl.so.8)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

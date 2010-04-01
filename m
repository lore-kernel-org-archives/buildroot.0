From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  1 Apr 2010 14:21:30 +0000 (UTC)
Subject: [Buildroot] [Bug 1477] New: Installing gfortran on PowerPC
Message-ID: <bug-1477-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1477

              Host: powerpc-unknown-linux-uclibc
            Target: powerpc-unknown-linux-uclibc
             Build: x86_64-pc-linux-gnu
           Summary: Installing gfortran on PowerPC
           Product: buildroot
           Version: 2010.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: foucher at unice.fr
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1447)
 --> (https://bugs.busybox.net/attachment.cgi?id=1447)
Buildroot gcc building log

I had a buildroot install that worked fine, but I needed to add fortran
support.
But adding fortran support broke the building process on this message:

checking whether the GNU Fortran compiler is working... no
configure: error: GNU Fortran is not working; please report a bug in
http://gcc.gnu.org/bugzilla, attaching
/home/foucher/These/toolchain/buildroot-2010.02/output/build/gcc-4.3.4-target/powerpc-linux-uclibc/libgfortran/config.log
make[2]: *** [configure-target-libgfortran] Erreur 1
make[2]: quittant le r?pertoire ?
/home/foucher/These/toolchain/buildroot-2010.02/output/build/gcc-4.3.4-target
?
make[1]: *** [all] Erreur 2
make[1]: quittant le r?pertoire ?
/home/foucher/These/toolchain/buildroot-2010.02/output/build/gcc-4.3.4-target
?
make: ***
[/home/foucher/Bureau/These/toolchain/buildroot-2010.02/output/build/gcc-4.3.4-target/.compiled]
Erreur 2


After checking the log (attached), I see that the error was simply that
gfortran was not found:

/home/foucher/Bureau/These/toolchain/buildroot-2010.02/output/toolchain/gcc-4.3.4/libgfortran/configure:
line 11234: powerpc-linux-uclibc-gfortran: command not found

... It seems that buildroot searches for the powerpc version of gfortran and
does not find it... But a few line before trying using it, there is the
following lines, like if the program were found:

configure:10198: checking for powerpc-linux-uclibc-gfortran
configure:10224: result: powerpc-linux-uclibc-gfortran 



Any idea that could help?


Regards,

         Cl?ment


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

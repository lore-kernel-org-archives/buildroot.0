From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  6 Jan 2015 16:23:18 +0000 (UTC)
Subject: [Buildroot] [Bug 7772] New: libxml-parser-perl build failure:
 missing dependency ExtUtils/MakeMaker
Message-ID: <bug-7772-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7772

           Summary: libxml-parser-perl build failure: missing dependency
                    ExtUtils/MakeMaker
           Product: buildroot
           Version: unspecified
          Platform: PC
               URL: http://sprunge.us/BNXW
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: vincent.riera at imgtec.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


libxml-parser-perl seems to need perl-ExtUtils-MakeMaker in order to be built,
so it fails to build on boxes which don't have perl-ExtUtils-MakeMaker
installed:

Can't locate ExtUtils/MakeMaker.pm in @INC (@INC contains:
/home/user/instance-0/output/host/usr/lib/perl /usr/local/lib64/perl5
/usr/local/share/perl5 /usr/lib64/perl5/vendor_perl
/usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5 .) at
Makefile.PL line 3.
BEGIN failed--compilation aborted at Makefile.PL line 3.

Full log in the ${URL} field.

Perhaps we should add a new perl-ExtUtils-MakeMaker package to Buildroot?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

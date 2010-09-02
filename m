From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  2 Sep 2010 19:24:44 +0000 (UTC)
Subject: [Buildroot] [Bug 2503] New: Microperl fails build on MIPS
Message-ID: <bug-2503-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2503

           Summary: Microperl fails build on MIPS
           Product: buildroot
           Version: 2009.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: sergio at sergiomb.no-ip.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2431
  --> https://bugs.busybox.net/attachment.cgi?id=2431
dot config

with buildroot 2010.08 version, I add some new packages to my .config ,
make 
# we need to build a perl for the host just for Errno.pm
(cd /home/sergio/hardware/moviecube/buildroot/output/build/perl-5.8.8; \
         chmod a+x ext/util/make_ext; \
         ext/util/make_ext nonxs Errno MAKE="/usr/bin/make" \
        )

        Making Errno (nonxs)
ext/util/make_ext: line 122: ../../miniperl: No such file or directory
Warning: No Makefile!
make[1]: Entering directory
`/home/sergio/hardware/moviecube/buildroot/output/build/perl-5.8.8/ext/Errno'
make[1]: *** No rule to make target `config'.  Stop.
make[1]: Leaving directory
`/home/sergio/hardware/moviecube/buildroot/output/build/perl-5.8.8/ext/Errno'
/usr/bin/make config failed, continuing anyway...
make[1]: Entering directory
`/home/sergio/hardware/moviecube/buildroot/output/build/perl-5.8.8/ext/Errno'
make[1]: *** No rule to make target `all'.  Stop.
make[1]: Leaving directory
`/home/sergio/hardware/moviecube/buildroot/output/build/perl-5.8.8/ext/Errno'
make: ***
[/home/sergio/hardware/moviecube/buildroot/output/build/perl-5.8.8/.configured]
Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

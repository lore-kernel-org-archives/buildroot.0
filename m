From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 14 Nov 2013 11:43:31 +0000 (UTC)
Subject: [Buildroot] [Bug 6692] New: GNU nano fails to compile for x86_64
Message-ID: <bug-6692-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6692

           Summary: GNU nano fails to compile for x86_64
           Product: buildroot
           Version: 2013.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: cassiano at idbinfo.com.br
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


GNU nano configure misdetect libmagic from somewhere. I'm not really sure what
is going on, as I digged config.log it tries to link nano agains libmagic.so
which is not provided byt buildroot. Most interesting is that is does no happen
when compiling to x86 or mips64. Only x86_64 is affected. Same build host, same
configuration.

I've fixed it by forcing autoconf env: NANO_CONF_ENV =
ac_cv_lib_magic_magic_open=no

Then it builds fine.

Thanks

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 21 Sep 2015 00:11:36 +0000 (UTC)
Subject: [Buildroot] [Bug 8361] New: Buildroot 2015.08.1 skeleton inittab
 overwritten by busybox's version
Message-ID: <bug-8361-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8361

           Summary: Buildroot 2015.08.1 skeleton inittab overwritten by
                    busybox's version
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: tommygunsster at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When compiling, the rsync operation that copies the skeleton directory operates
before all other packages that might alter some of the files in the skeleton
directory.  This can cause problems if your build has custom skeleton files
that get overwritten.

In my example, I am using the default system/skeleton folder to contain any
custom files I may need as appropriate.  Specifically, I have an inittab file
that should be used over others.

I did notice that system/skeleton/etc/inittab and init.d are not stored in wait
which is to be expected, particularly for specific files.

I realize this is likely because configuration of things may require
alternative methods to startup, but in this particular case it is not an issue
as the only file that I see being altered that's affecting the init's ability
is that the tty0 parameter I need does not exist.

I am also aware that I can script a custom package to correct this for me as
well.

The specific git revision that adds this issue from what I can tell is:
http://git.buildroot.net/buildroot/commit/?id=89d39fc7a392530be043bac541ade0bef746edb6

I imagine the intent of this addition is to ensure an inittab file exists.  I
would imagine the overwriting of the skeleton files was unintentional?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

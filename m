From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  1 Apr 2014 19:41:38 +0000 (UTC)
Subject: [Buildroot] [Bug 7016] New: Git issues in resulting buildroot tar
Message-ID: <bug-7016-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7016

           Summary: Git issues in resulting buildroot tar
           Product: buildroot
           Version: 2014.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: brian at brianclements.net
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hi There,
Sorry if this isn't the correct place for this bug, please forward me if so.

I've built a pretty standard busybox chain using many different options and
versions of git by this point, but the end result has been the same: using git
in this freshly built image fails on anything involved decompressing objects
(git clone among other things).

The context here has been to make a Docker image of busybox with a complete git
install contained therein. All my reproducible steps are here:

https://github.com/brianclements/dockerfile-busyboxplus/blob/gitbug/tarmaker/Dockerfile

I've even tried substituting different versions of buildroot (2013.08.1,
2014.02) and different versions of git (1.8.3, 1.8.5.3, 1.9.0) all with the
same result. The build succeeds, and the resulting image works as far as I can
tell, but running "git clone" on a larger repository that involves compression
of objects (smaller repos of text only work fine) will fail with: 

fatal: serious inflate inconsistency   
fatal: index-pack failed

Any thoughts or further testing I can try to tweak the git build?

Thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

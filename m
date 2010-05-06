From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  6 May 2010 15:45:07 +0000 (UTC)
Subject: [Buildroot] [Bug 1711] New: Should libtool package install
 ltmain.sh into staging ?
Message-ID: <bug-1711-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1711

           Summary: Should libtool package install ltmain.sh into staging
                    ?
           Product: buildroot
           Version: 2010.02
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: nick at leverton.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 1669
  --> https://bugs.busybox.net/attachment.cgi?id=1669
Patch to copy ltmain.sh to the staging area.

I'm no libtool expert and I'm struggling to adapt a couple of packages which
use it to Buildroot.  Instead trying to find the incompatibilities and then to
generate patches which mung the package's existing ltmain.sh, and which may
well break when the package is updated, I'd like to be able to copy in the
latest ltmain.sh, as is already done by gnuconfig for config.{guess,sub}.

At present I am doing this when required with a PACKAGE_POST_PATCH_HOOKS
target.  So there is no need to add extra Buildroot config items, potentially 
breaking other packages, as long as ltmain.sh is available in a known place.

If there's some reason why this is silly or otherwise not the best way to work,
I'd welcome any advice.  Otherwise please would you consider the attached patch
to add ltmain.sh to the libtool staging files ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

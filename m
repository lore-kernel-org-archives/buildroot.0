From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 26 Mar 2015 12:23:07 +0000 (UTC)
Subject: [Buildroot] [Bug 7976] New: mkuser script fails with: user already
 exists with group nogroup
Message-ID: <bug-7976-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7976

           Summary: mkuser script fails with: user already exists with
                    group nogroup
           Product: buildroot
           Version: 2015.02
          Platform: PC
        OS/Version: Windows
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: tommygunsster at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The file:

buildroot-2015.02/support/scripts/mkusers 

Lines: 170-173:
    # check the user does not already exist in another group
    if [ -n "${_ugroup}" -a "${_ugroup}" != "${group}" ]; then
        fail "user already exists with group '${_ugroup}'\n"
    fi

Issue causes a total failure to build if the user exists with the group
already.  This shouldn't happen as it actually has less work to do right?

My work around was to comment the fail line and all seems to have continued to
work properly.

I don't know what impacts this has but as it's not failing to a real "problem"
and the mkusers script is new from what I can find, I doubt there will be any
major issues.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

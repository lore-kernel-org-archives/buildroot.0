From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 23 Aug 2019 11:40:46 +0000
Subject: [Buildroot] [Bug 12141] New: eudev package is missing "render" and
 "kvm" groups
Message-ID: <bug-12141-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12141

            Bug ID: 12141
           Summary: eudev package is missing "render" and "kvm" groups
           Product: buildroot
           Version: 2019.02.3
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jcowgill+busybox at jcowgill.uk
                CC: buildroot at uclibc.org
  Target Milestone: ---

This commit added some extra groups to the systemd package which are now
required by the default udev rules:
https://git.buildroot.net/buildroot/commit/package/systemd/systemd.mk?id=f208cf296c2c7c049d11d15b6d0546214c4d0357

However, those groups were not added to the eudev package which causes udev to
warn on boot:

    [   20.702706] udevd[67]: specified group 'kvm' unknown

I think both the "render" and "kvm" groups need adding.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

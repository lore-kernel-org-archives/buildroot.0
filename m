From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 05 Jun 2018 15:27:08 +0000
Subject: [Buildroot] [Bug 11061] New: support/download: git version=master
 broken
Message-ID: <bug-11061-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11061

            Bug ID: 11061
           Summary: support/download: git version=master broken
           Product: buildroot
           Version: 2018.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: posted at heine.so
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi,

since the latest rework in the git downloader component setting the version to
the 'master' branch is not working anymore. 

The error I see:

  Could not fetch special ref 'master'; assuming it is not special.
  Commit 'master' does not exist in this repository

using another branch is working fine. If I use another branch first and then
change the package to master it is switching the branch just fine and builds.



I tried some analysis:

When I use the command from [1] I get:

> git fetch origin master:master
fatal: Refusing to fetch into current branch refs/heads/master of non-bare
repository
fatal: The remote end hung up unexpectedly

>git rev-parse --verify "master^{commit}"
fatal: Needed a single revision

So there seems to be a clash between the local master and the remote master in
this case.
As said before, all this works when I first start the repo creation with
another branch and then switch to master.

Regards,
Michael

[1] https://git.buildroot.org/buildroot/tree/support/download/git#n125

-- 
You are receiving this mail because:
You are on the CC list for the bug.

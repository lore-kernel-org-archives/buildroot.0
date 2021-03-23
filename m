From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 23 Mar 2021 05:07:22 +0000
Subject: [Buildroot] [Bug 13651] New: pkg-golang cannot build when main.go
 is in the root
Message-ID: <bug-13651-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13651

            Bug ID: 13651
           Summary: pkg-golang cannot build when main.go is in the root
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: christian at paral.in
                CC: buildroot at uclibc.org
  Target Milestone: ---

Currently pkg-golang defaults to "." as a build target, generating a command
like

go build github.com/containerd/nerdctl/.

However, the "/." is not valid, and the go command fails.

There's no way to specify that we want to build just
"github.com/containerd/nerdctl" with no sub-package (if the main.go is in the
root).

-- 
You are receiving this mail because:
You are on the CC list for the bug.

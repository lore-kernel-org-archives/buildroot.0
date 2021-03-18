From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 18 Mar 2021 18:46:53 +0000
Subject: [Buildroot] [Bug 13631] New: Commit 54d3d94b6e breaks packages with
 git download method
Message-ID: <bug-13631-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13631

            Bug ID: 13631
           Summary: Commit 54d3d94b6e breaks packages with git download
                    method
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: mhardt at berlinux-solutions.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

When using a package with git download method the download step is broken when
not using a silent build (make -s).

The reason is the commit date being used for creating an archive of the
repository and the output now contains an additional line containing the git
command. This obviously cannot be parsed as a date.

Example output:

date: invalid date 'GIT_DIR=<some-dir>/git/.git git log -1 --pretty=format:%ci
\n2021-03-12 08:58:14 +0100'
Detected a corrupted git cache.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 14 Jul 2017 19:17:27 +0000
Subject: [Buildroot] [Bug 10071] New: [PATCH] fakeroot: replace hard-coded
 paths in post install
Message-ID: <bug-10071-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10071

            Bug ID: 10071
           Summary: [PATCH] fakeroot: replace hard-coded paths in post
                    install
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: chemobejk at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7116
  --> https://bugs.busybox.net/attachment.cgi?id=7116&action=edit
patch for branch master

fakeroot script has the absolute path to the host tools directory encoded in
it. It will therefore fail if a developer downloads a build e.g. from an
automated build system and unpacks it at a different location locally.

The attached patch for branch "master" adds a host post install step that
replaces the absolute path with ${HOST_DIR}. The same solution should be easy
to backport to older branches too.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

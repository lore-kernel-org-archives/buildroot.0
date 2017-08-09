From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 09 Aug 2017 20:26:15 +0000
Subject: [Buildroot] [Bug 10216] New: package/x11r7/mcookie/mcookie.c:207:
	bad size ?
Message-ID: <bug-10216-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10216

            Bug ID: 10216
           Summary: package/x11r7/mcookie/mcookie.c:207: bad size ?
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: dcb314 at hotmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

buildroot-2017.08-rc1/package/x11r7/mcookie/mcookie.c:207]: (warning) Size of
pointer 'ctx' used instead of size of its data.

Source code is

    memset(ctx, 0, sizeof(ctx));    /* In case it's sensitive */

Maybe better code

    memset(ctx, 0, sizeof(*ctx));    /* In case it's sensitive */

-- 
You are receiving this mail because:
You are on the CC list for the bug.

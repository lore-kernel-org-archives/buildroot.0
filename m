From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 09 Aug 2017 20:23:46 +0000
Subject: [Buildroot] [Bug 10211] New: mkpasswd.c:183: pointless test ?
Message-ID: <bug-10211-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10211

            Bug ID: 10211
           Summary: mkpasswd.c:183: pointless test ?
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: trivial
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: dcb314 at hotmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

buildroot-2017.08-rc1/package/mkpasswd/mkpasswd.c:183]: (style) Checking if
unsigned variable 'rounds' is less than zero.

Source code is

        rounds = strtol(optarg, &p, 10);
        if (p == NULL || *p != '\0' || rounds < 0) {

Maybe a call to strtoul would be better ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.

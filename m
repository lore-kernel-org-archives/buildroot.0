From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 20 May 2017 07:38:07 +0000
Subject: [Buildroot] [Bug 9886] New: Build fails with "unexpected EOF while
 looking for matching `"'" if PATH contains a newline
Message-ID: <bug-9886-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9886

            Bug ID: 9886
           Summary: Build fails with "unexpected EOF while looking for
                    matching `"'" if PATH contains a newline
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ciro.santilli at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I know newlines in PATH are bad, but we shouldn't punish unsuspecting users
with unhelpful error messages because of it :-)

Reproduce:

    git checkout 4d1c2c82e8945a5847d636458f3825c55529835b
    make qemu_x86_64_defconfig
    PATH="$PATH:"$'\n'":lalala" make

Gives:

>>> host-lzip 1.18 Downloading
/bin/bash: -c: line 0: unexpected EOF while looking for matching `"'
/bin/bash: -c: line 1: syntax error: unexpected end of file
package/pkg-generic.mk:139: recipe for target
'/data/git/buildroot/output/build/host-lzip-1.18/.stamp_downloaded' failed
make[1]: ***
[/data/git/buildroot/output/build/host-lzip-1.18/.stamp_downloaded] Error 1
Makefile:79: recipe for target '_all' failed
make: *** [_all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.

From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Aug 2018 18:11:04 +0000
Subject: [Buildroot] [Bug 11246] New: Glibc 2.28 - fails to build host-bison
 and host-m4
Message-ID: <bug-11246-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11246

            Bug ID: 11246
           Summary: Glibc 2.28 - fails to build host-bison and host-m4
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: happycorsair at yandex.ru
                CC: buildroot at uclibc.org
  Target Milestone: ---

Bleeding edge Linux distros (such as Arch Linux or Fedora) have switched some
time ago to glibc 2.28. It has broken building of bison and m4 host packages.

It can be fixed by using these patches (the same problem was found in Fedora
and OpenWRT):

https://github.com/openwrt/openwrt/commit/8ae84899865ea14ce9d55cffa5de5ddd7167c680

https://github.com/openwrt/openwrt/blob/e5d47f32131849a69a9267de51a30d6be1f0d0ac/tools/bison/patches/110-glibc-change-work-around.patch

-- 
You are receiving this mail because:
You are on the CC list for the bug.

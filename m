From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 08 Jun 2020 16:18:43 +0000
Subject: [Buildroot] [Bug 12986] New: Mtools: Error converting to codepage
 850
Message-ID: <bug-12986-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12986

            Bug ID: 12986
           Summary: Mtools: Error converting to codepage 850
           Product: buildroot
           Version: 2020.05
          Hardware: All
                OS: All
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: melanie at trash-mail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

The 'BR2_PACKAGE_MTOOLS' program builds fine but on the target system some of
the mtools-commands (i.e. mdir) fails to execute with the following message:

Error converting to codepage 850 Invalid argument

As described in the mtools-manual [1], codepage 850 is used by default.
I've solved the problem by adding 'BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY=y' to my
buildroot-configuration.

From my point of view, the config option 'BR2_PACKAGE_MTOOLS' should
automatically select 'BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY' to make sure that
the required gconv libraries are available on the target system.



[1]
https://www.gnu.org/software/mtools/manual/mtools.html#miscellaneous-variables

-- 
You are receiving this mail because:
You are on the CC list for the bug.

From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 06 Oct 2016 15:56:35 +0000
Subject: [Buildroot] [Bug 9336] New: Improve iconv support for external
 toolchain based builds
Message-ID: <bug-9336-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9336

            Bug ID: 9336
           Summary: Improve iconv support for external toolchain based
                    builds
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: torso.nafi at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Currently, when Linaro is selected as the build toolchain (and, quite possibly,
with other external toolchains as well), only the very basic iconv support is
available on target. Namely, the iconv utility from libc/usr/bin/iconv is not
installed at all, nor are the contents of libc/usr/lib/<triplet>/gconv (which I
presume to contain/implement conversion tables not baked in into libc binary).

If I manually copy the iconv utility onto the buildroot system, and then run
the "iconv -l" command, I get the following list:

  10646-1:1993, 10646-1:1993/UCS4, ANSI_X3.4-1968, ANSI_X3.4-1986, ANSI_X3.4,
  ASCII, CP367, CSASCII, CSUCS4, IBM367, ISO-10646, ISO-10646/UCS2,
  ISO-10646/UCS4, ISO-10646/UTF-8, ISO-10646/UTF8, ISO-IR-6, ISO-IR-193,
  ISO646-US, ISO_646.IRV:1991, OSF00010020, OSF00010100, OSF00010101,
  OSF00010102, OSF00010104, OSF00010105, OSF00010106, OSF05010001, UCS-2,
  UCS-2BE, UCS-2LE, UCS-4, UCS-4BE, UCS-4LE, UCS2, UCS4, UNICODEBIG,
  UNICODELITTLE, US-ASCII, US, UTF-8, UTF8, WCHAR_T

Clearly this isn't sufficient for a good majority of tasks which involve
character set conversions.

I'd like to see the iconv-related files copied, or possible to be copied via
configuration parameters, in next releases of buildroot. Particularly I'm
missing the capability to convert from CP1251 to UTF-8, but other charsets
might be pretty useful too.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

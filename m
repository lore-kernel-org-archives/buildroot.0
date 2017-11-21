From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 21 Nov 2017 14:37:30 +0000
Subject: [Buildroot] [Bug 10511] New: Packages get downloaded uncompressed
 with wget
Message-ID: <bug-10511-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10511

            Bug ID: 10511
           Summary: Packages get downloaded uncompressed with wget
           Product: buildroot
           Version: 2017.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jean.parpaillon at free.fr
                CC: buildroot at uclibc.org
  Target Milestone: ---

Using buildroot with wget version 1.19.2 on Debian, through nerves toolchain.
(https://github.com/nerves-project/nerves_system_br)

When downloading otp (http://erlang.org/download/otp_src_20.1.tar.gz), wget
(through pkg-download.mk recipes) uncompress the data, resulting with an
gunzipe'd .tar.gz, hence md5 mismatch.

Downloading the package with 'wget --compress=none' fixed the problem, but may
depend on wget versions.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 6 Nov 2018 12:24:06 -0600
Subject: [Buildroot] Clang and SDK relocation
Message-ID: <CANQCQpZ41eFDSffOMmpGEOSTDzZhDp92fffHrSZTVJX4P2n0cA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While working on a patchset for adding the compiler-rt sanitizers.  We
noticed an issue if we moved the build as an SDK (path changed on
system so that the orig build doesn't exist).  The include search
paths provided to Clang seem to be ignored (sysroot/-I).  These
options do work if using the tools from the original build location.
Do you guys happen to know of any options I could start investigating
to adjust to make a relative path or prefix with sysroot fix in the
Clang build?

I'll keep looking through the code and see what I can find.

Thanks!
Matt

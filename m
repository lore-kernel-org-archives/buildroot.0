From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 20 Dec 2019 14:52:14 +0000
Subject: [Buildroot] [Bug 12426] New: NodeJS slow startup performance (~30s)
Message-ID: <bug-12426-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12426

            Bug ID: 12426
           Summary: NodeJS slow startup performance (~30s)
           Product: buildroot
           Version: 2019.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: erichiggins at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

The performance of the NodeJS executable, as compiled by Buildroot, has
exceptionally poor startup performance, taking around 30s to run.

The prebuilt binaries from NodeJS running on the same system take less than 2s
to run.

I created a Gist with a comparison using the time command:
https://gist.github.com/erichiggins/ac139ebe34b8d3c6dbb68f3b09ca9008

In both cases, the runtime performance is about equal.

The prebuilt binaries require the buildroot system to use glibc and will not
run if a more space-efficient alternative (uClibc-ng) is selected.

Further, NodeJS v12.x (now the major version used by Buildroot) does not
officially support ARM v6l and is considered experimental.
https://github.com/nodejs/build/issues/1677#issuecomment-486204349

Current workaround is to use glibc and overwrite the NodeJS executables with
the unofficial prebuilts via rootfs overlay.
https://github.com/nodejs/unofficial-builds/

It would be quite helpful to build a performant NodeJS executable without
requiring these workarounds.

Thank you!

-- 
You are receiving this mail because:
You are on the CC list for the bug.

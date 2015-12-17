From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 17 Dec 2015 10:00:50 +0000
Subject: [Buildroot] [Bug 8536] New: Building sudo with PAM results in
	unusable sudo
Message-ID: <bug-8536-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8536

            Bug ID: 8536
           Summary: Building sudo with PAM results in unusable sudo
           Product: buildroot
           Version: unspecified
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: nroach44 at gmail.com
                CC: buildroot at uclibc.org

As the title, when building an image with both sudo and PAM results in sudo
denying all requests.

If you comment out the PAM section in sudo.mk everything works as intended
(minus any PAM integration).

I only have one file in sudoers.d that contains:

%sudo    ALL=(ALL) ALL

otherwise I don't have any PAM or sudo configuration

I'm building for a SAMA5D3_XPLD (cortex-a5) board with linux 4.0.9 on latest
git, with a custom ct-ng toolchain (that otherwise works)

-- 
You are receiving this mail because:
You are on the CC list for the bug.

From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 29 Jan 2018 07:44:58 +0000
Subject: [Buildroot] [Bug 10716] New: systemd build failure when
 BR2_TARGET_GENERIC_HOSTNAME is set
Message-ID: <bug-10716-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10716

            Bug ID: 10716
           Summary: systemd build failure when BR2_TARGET_GENERIC_HOSTNAME
                    is set
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: chemobejk at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Commit aebabb2780da4c5f85fec00b56f4690feb646073 added an old-style
configuration to the systemd build, which is rejected by the new meson build
system.

I'm currently testing this fix to package/systemd/systemd.mk:

    ifneq ($(SYSTEMD_FALLBACK_HOSTNAME),)
    SYSTEMD_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
    endif

I'll submit a patch once I have verified the build result.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 07 Jun 2018 07:05:54 +0000
Subject: [Buildroot] [Bug 11076] New: Docker containerd installed to
 incorrect path
Message-ID: <bug-11076-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11076

            Bug ID: 11076
           Summary: Docker containerd installed to incorrect path
           Product: buildroot
           Version: 2018.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: sam at gpsm.co.uk
                CC: buildroot at uclibc.org
  Target Milestone: ---

In 2dccb4f2fefd8a0dbda65dd0f7537f811e920b13, the following change was made:

-define DOCKER_CONTAINERD_INSTALL_TARGET_CMDS
+define DOCKER_CONTAINERD_INSTALL_SYMLINKS
        ln -fs runc $(TARGET_DIR)/usr/bin/docker-runc
-       $(INSTALL) -D -m 0755 $(@D)/bin/containerd
$(TARGET_DIR)/usr/bin/docker-containerd
-       $(INSTALL) -D -m 0755 $(@D)/bin/containerd-shim
$(TARGET_DIR)/usr/bin/containerd-shim
        ln -fs containerd-shim $(TARGET_DIR)/usr/bin/docker-containerd-shim
 endef

This removed "/usr/bin/docker-containerd" without replacing it with a symlink

When I figure out how I will create a patch and send to the mailer

-- 
You are receiving this mail because:
You are on the CC list for the bug.

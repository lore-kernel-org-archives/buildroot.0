From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 18 Jan 2011 06:42:50 +0000 (UTC)
Subject: [Buildroot] [Bug 3109] New: abnormal `make busybox-menuconfig`
Message-ID: <bug-3109-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3109

           Summary: abnormal `make busybox-menuconfig`
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: twinkle.j4k at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


After 69df644f5c539760cc4fd425571ee9d6dc4295b3 commit,
`make busybox-menuconfig` is same as `make menuconfig`.
So, I suggest a patch below.

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 38897f7..5583bc6 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -151,7 +151,7 @@ endef
 $(eval $(call GENTARGETS,package,busybox))

 busybox-menuconfig:    $(BUSYBOX_DIR)/.stamp_extracted
-       $(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) menuconfig
+       $(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(BUSYBOX_DIR)
menuc
        rm -f $(BUSYBOX_DIR)/.stamp_built
        rm -f $(BUSYBOX_DIR)/.stamp_target_installed

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Thu, 12 Dec 2013 12:27:19 -0600
Subject: [Buildroot] [ PATCH v4 19/20] refpolicy: Add busybox selections
In-Reply-To: <1386872840-22051-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1386872840-22051-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1386872840-22051-20-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding selects to enable SELinux and individual binaries when
refpolicy is selected.
---
 package/refpolicy/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 64e5831..03bfed3 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_REFPOLICY
 	bool "refpolicy"
 	select BR2_PACKAGE_POLICYCOREUTILS
+	select BR2_PACKAGE_BUSYBOX_SELINUX
+	select BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
 	depends on BR2_TOOLCHAIN_HAS_THREADS # policycoreutils
 	depends on BR2_LARGEFILE # policycoreutils
 	depends on BR2_ENABLE_LOCALE # policycoreutils
-- 
1.7.1

From: Geert Visser <geert@my-clay.com>
Date: Wed, 15 Aug 2018 08:48:34 +0200
Subject: [Buildroot] [PATCH v2 1/1] wf111: ARM bumped to 5.2.2-r4
Message-ID: <20180815064834.4198-1-geert@my-clay.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Geert Visser <geert@my-clay.com>
---
Changes since v1:
- Fixed hash file formatting
- Updated version define

 package/wf111/wf111.hash | 4 ++++
 package/wf111/wf111.mk   | 9 +++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)
 create mode 100644 package/wf111/wf111.hash

diff --git a/package/wf111/wf111.hash b/package/wf111/wf111.hash
new file mode 100644
index 0000000000..e3a5c484f7
--- /dev/null
+++ b/package/wf111/wf111.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256	33de265d28702ce32bb292f29a43e9e946382a1e31f1e4feae0f4753cf18b4f4	wf111-linux-driver_5.2.2-r4_armv7-a.tar.gz
+sha256	fbe86a30e4025b9f510feb4cb8f846aca82f8f3e8f6c8a28a74baf45c87f6e96	wf111-linux-driver_5.2.2-r4_armv5te.tar.gz
+sha256	37983d73f60bab9768eb02a89695448f27cd1964e23cf462e76657344a9c67ac	wf111-linux-driver-5-2-2-r3-x86.tar.gz
diff --git a/package/wf111/wf111.mk b/package/wf111/wf111.mk
index 72526333fd..fd9cb19600 100644
--- a/package/wf111/wf111.mk
+++ b/package/wf111/wf111.mk
@@ -4,14 +4,19 @@
 #
 ################################################################################
 
+ifeq ($(BR2_ARM_CPU_ARMV7A)$(BR2_ARM_CPU_ARMV5),y)
+WF111_VERSION = 5.2.2-r4
+else
 WF111_VERSION = 5-2-2-r3
+endif
+
 WF111_SITE = https://www.silabs.com/documents/login/software
 WF111_DEPENDENCIES = linux
 
 ifeq ($(BR2_ARM_CPU_ARMV7A),y)
-WF111_SOURCE = wf111-linux-driver-$(WF111_VERSION)-armv7-a.tar.gz
+WF111_SOURCE = wf111-linux-driver_$(WF111_VERSION)_armv7-a.tar.gz
 else ifeq ($(BR2_ARM_CPU_ARMV5),y)
-WF111_SOURCE = wf111-linux-driver-$(WF111_VERSION)-armv5te.tar.gz
+WF111_SOURCE = wf111-linux-driver_$(WF111_VERSION)_armv5te.tar.gz
 else ifeq ($(BR2_i386),y)
 WF111_SOURCE = wf111-linux-driver-$(WF111_VERSION)-x86.tar.gz
 endif
-- 
2.17.1

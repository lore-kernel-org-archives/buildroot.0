From: Rahul Jain <Rahul.Jain@imgtec.com>
Date: Fri, 24 Mar 2017 18:19:51 +0530
Subject: [Buildroot] [PATCH 2/6] ubus: bump version
In-Reply-To: <1490359795-18362-1-git-send-email-Rahul.Jain@imgtec.com>
References: <1490359795-18362-1-git-send-email-Rahul.Jain@imgtec.com>
Message-ID: <1490359795-18362-2-git-send-email-Rahul.Jain@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rebase 0001-Install-server-and-client-examples patch
on latest version.

Signed-off-by: Rahul Jain <Rahul.Jain@imgtec.com>
---
 .../ubus/0001-Install-server-and-client-examples.patch    | 15 ++++++++++-----
 package/ubus/ubus.hash                                    |  2 +-
 package/ubus/ubus.mk                                      |  2 +-
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/package/ubus/0001-Install-server-and-client-examples.patch b/package/ubus/0001-Install-server-and-client-examples.patch
index 0ee4d3e..5c985d8 100644
--- a/package/ubus/0001-Install-server-and-client-examples.patch
+++ b/package/ubus/0001-Install-server-and-client-examples.patch
@@ -1,23 +1,28 @@
-Install server and client examples
+From aa4aea68a9d2a38fabb5ae8e5a0d05dfd7bcf907 Mon Sep 17 00:00:00 2001
+From: Rahul Jain <Rahul.Jain@imgtec.com>
+Date: Fri, 24 Mar 2017 18:03:24 +0530
+Subject: [PATCH] Install server and client examples
 
 Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+Signed-off-by: Rahul Jain <Rahul.Jain@imgtec.com>
+[Rahul Jain: rebase the patch on latest version]
 ---
  examples/CMakeLists.txt | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/examples/CMakeLists.txt b/examples/CMakeLists.txt
-index 0279f6e66b50..2f8f4e026e20 100644
+index 81f9997..38f153f 100644
 --- a/examples/CMakeLists.txt
 +++ b/examples/CMakeLists.txt
 @@ -9,4 +9,8 @@ IF (BUILD_EXAMPLES)
  
  	ADD_EXECUTABLE(client client.c count.c)
- 	TARGET_LINK_LIBRARIES(client ubus ubox)
+ 	TARGET_LINK_LIBRARIES(client ubus ${ubox_library})
 +
 +	INSTALL(TARGETS server client
-+	        RUNTIME DESTINATION sbin
++		RUNTIME DESTINATION sbin
 +	)
  ENDIF()
 -- 
-1.9.1
+2.6.2
 
diff --git a/package/ubus/ubus.hash b/package/ubus/ubus.hash
index 4e6a755..0829734 100644
--- a/package/ubus/ubus.hash
+++ b/package/ubus/ubus.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0dbf75c2103f3f567b9bf1bb719ea9776d18401bbf2dfd8bed2c2ebbdd1021da  ubus-259450f414d8c9ee41896e8e6d6bc57ec00e2b63.tar.gz
+sha256  93ef2612853641ca8d16d07527115c72ed03f8eaa1c727a01b069a4e814247c0  ubus-34c6e818e431cc53478a0f7c7c1eca07d194d692.tar.gz
diff --git a/package/ubus/ubus.mk b/package/ubus/ubus.mk
index cd66b86..08c9ce2 100644
--- a/package/ubus/ubus.mk
+++ b/package/ubus/ubus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBUS_VERSION = 259450f414d8c9ee41896e8e6d6bc57ec00e2b63
+UBUS_VERSION = 34c6e818e431cc53478a0f7c7c1eca07d194d692
 UBUS_SITE = git://git.openwrt.org/project/ubus.git
 
 UBUS_LICENSE = LGPLv2.1
-- 
2.6.2

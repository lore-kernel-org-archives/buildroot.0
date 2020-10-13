From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Tue, 13 Oct 2020 17:36:05 -0500
Subject: [Buildroot] [PATCH v2 5/5] docs/manual: add section about
 br2-external init
In-Reply-To: <20201013194149.171518-1-brandon.maier@rockwellcollins.com>
References: <20201013194149.171518-1-brandon.maier@rockwellcollins.com>
Message-ID: <20201013223605.188920-5-brandon.maier@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
---
 docs/manual/customize-outside-br.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index c24516680c..59a01f278d 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -203,6 +203,8 @@ a set of files that define those alternatives:
 * +provides/jpeg.in+ defines the alternative libjpeg implementations;
 * +provides/openssl.in+ defines the alternative openssl implementations.
 * +provides/skeleton.in+ defines the alternative skeleton implementations.
+* +provides/init.in+ defines the alternative init system implementations, this
+  can be used to select a default skeleton for your init.
 
 ===== Free-form content
 
@@ -343,6 +345,13 @@ illustration, of course):
   |     |$(eval $(generic-package))
   |     `----
   |
+  |- provides/init.in
+  |     |config BR2_INIT_MINE
+  |     |    bool "my custom init"
+  |     |    select BR2_PACKAGE_MY_INIT
+  |     |    select BR2_PACKAGE_SKELETON_INIT_SYSV if BR2_ROOTFS_SKELETON_DEFAULT
+  |     `----
+  |
   |- linux/Config.ext.in
   |     |config BR2_LINUX_KERNEL_EXT_EXAMPLE_DRIVER
   |     |    bool "example-external-driver"
-- 
2.28.0

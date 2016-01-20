From: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
Date: Wed, 20 Jan 2016 16:09:14 +0530
Subject: [Buildroot] [PATCH 2/2] package/nvme: new package
In-Reply-To: <20160120102906.23540.76413.stgit@localhost.localdomain>
References: <20160120102906.23540.76413.stgit@localhost.localdomain>
Message-ID: <20160120103611.23540.32033.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is to add NVME Config file

Signed-off-by: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
---
 package/Config.in      |    1 +
 package/nvme/Config.in |    6 ++++++
 2 files changed, 7 insertions(+)
 create mode 100644 package/nvme/Config.in

diff --git a/package/Config.in b/package/Config.in
index e0c2e2a..4d173d4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -380,6 +380,7 @@ endif
 	source "package/neard/Config.in"
 	source "package/nvidia-driver/Config.in"
 	source "package/nvidia-tegra23/Config.in"
+	source "package/nvme/Config.in"
 	source "package/ofono/Config.in"
 	source "package/ola/Config.in"
 	source "package/on2-8170-modules/Config.in"
diff --git a/package/nvme/Config.in b/package/nvme/Config.in
new file mode 100644
index 0000000..8b5d37d
--- /dev/null
+++ b/package/nvme/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_NVME
+	bool "nvme"
+	help
+	  System utilities for IBM Power NVME devices
+
+	  https://github.com/linux-nvme/nvme-cli

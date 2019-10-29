From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Oct 2019 23:07:54 +0100
Subject: [Buildroot] [PATCH 2/3 v2] package/eudev: generate the hwdb.bin
In-Reply-To: <cover.1572386855.git.yann.morin.1998@free.fr>
References: <cover.1572386855.git.yann.morin.1998@free.fr>
Message-ID: <c6266382b309d867f2479131467f57c4a6aca4de.1572386855.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Carlos Santos <unixmania@gmail.com>

---
Changes v1 -> v2:
  - drop the post hooks
---
 package/eudev/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 2220265a55..b1d2f37a72 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -29,8 +29,9 @@ config BR2_PACKAGE_EUDEV_RULES_GEN
 config BR2_PACKAGE_EUDEV_ENABLE_HWDB
 	bool "enable hwdb installation"
 	default y
+	select BR2_PACKAGE_HOST_EUDEV # for udevadm, during target-finalize
 	help
-	  Enables hardware database installation to /etc/udev/hwdb.d
+	  Enables hardware database installation to /etc/udev/hwdb.bin
 
 endif
 
-- 
2.20.1

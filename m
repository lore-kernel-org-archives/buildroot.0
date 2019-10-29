From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Oct 2019 23:07:55 +0100
Subject: [Buildroot] [PATCH 3/3 v2] packagesystemd: generate the hwdb.bin
In-Reply-To: <cover.1572386855.git.yann.morin.1998@free.fr>
References: <cover.1572386855.git.yann.morin.1998@free.fr>
Message-ID: <803cedc8ae9597d0ae287e65d873cb9e0f6a91d9.1572386855.git.yann.morin.1998@free.fr>
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
 package/systemd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 601398bf96..aef39abe27 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -199,6 +199,7 @@ config BR2_PACKAGE_SYSTEMD_HOSTNAMED
 config BR2_PACKAGE_SYSTEMD_HWDB
 	bool "enable hwdb installation"
 	default y
+	select BR2_PACKAGE_HOST_EUDEV # for udevadm, during target-finalize
 	help
 	  Enables hardware database installation to /usr/lib/udev/hwdb.d
 
-- 
2.20.1

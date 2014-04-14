From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 14 Apr 2014 11:25:37 +0200
Subject: [Buildroot] [PATCH 2/2] liblogging: enable systemd compatibility
	libs
In-Reply-To: <1397467537-22766-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1397467537-22766-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1397467537-22766-3-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If systemd is chosen as init system, liblogging will enable the
installation of compatibility libraries in systemd.

When liblogging will be updated to depend on libsystemd.so, this
selection will have to be removed.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/liblogging/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/liblogging/Config.in b/package/liblogging/Config.in
index 23c3c1a..12ee950 100644
--- a/package/liblogging/Config.in
+++ b/package/liblogging/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBLOGGING
 	bool "liblogging"
+	select BR2_PACKAGE_SYSTEMD_COMPAT if BR2_INIT_SYSTEMD
 	help
 	  Liblogging is an easy to use library for
 	  logging. It offers an enhanced replacement
-- 
1.9.1

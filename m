From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Sep 2012 17:43:50 +0200
Subject: [Buildroot] [PATCH 07/12] package/lshw: add missing dependency on
	gettext
In-Reply-To: <1346600635-30946-1-git-send-email-yann.morin.1998@free.fr>
References: <1346600635-30946-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1346600635-30946-8-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lshw.mk defines a build-dependency on gettext,
but not in its Config.in.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/lshw/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/lshw/Config.in b/package/lshw/Config.in
index 4960ac9..98beacd 100644
--- a/package/lshw/Config.in
+++ b/package/lshw/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LSHW
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  lshw (Hardware Lister) is a small tool to provide
 	  detailed information on the hardware configuration of the machine.
-- 
1.7.2.5

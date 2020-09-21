From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 22 Sep 2020 00:37:46 +0300
Subject: [Buildroot] [PATCH v2 2/4] package/wpebackend-fdo: switch over to
 Meson
In-Reply-To: <20200921213748.1846851-1-aperez@igalia.com>
References: <20200921213748.1846851-1-aperez@igalia.com>
Message-ID: <20200921213748.1846851-3-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The CMake based build system will be eventually removed by upstream
so it seems like a good idea to switch over to Meson already before
that happens.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
Changes v1 -> v2:
  - No changes
---
 package/wpebackend-fdo/wpebackend-fdo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index e0331e7bd3..dc0c9b6740 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -12,4 +12,4 @@ WPEBACKEND_FDO_LICENSE = BSD-2-Clause
 WPEBACKEND_FDO_LICENSE_FILES = COPYING
 WPEBACKEND_FDO_DEPENDENCIES = libepoxy libglib2 libwpe wayland
 
-$(eval $(cmake-package))
+$(eval $(meson-package))
-- 
2.28.0

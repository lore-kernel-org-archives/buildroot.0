From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  4 Dec 2018 10:57:12 +0100
Subject: [Buildroot] [PATCH] package/libiscsi: do not built the manpages
In-Reply-To: <20181204093152.10692-1-yann.morin.1998@free.fr>
References: <20181204093152.10692-1-yann.morin.1998@free.fr>
Message-ID: <20181204095712.7130-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The pre-rendered, bundled ones are still installed, though, but they
get removed in target-finalize anyway.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libiscsi/libiscsi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libiscsi/libiscsi.mk b/package/libiscsi/libiscsi.mk
index c492865c51..a34069d7bf 100644
--- a/package/libiscsi/libiscsi.mk
+++ b/package/libiscsi/libiscsi.mk
@@ -11,7 +11,7 @@ LIBISCSI_LICENSE_FILES = COPYING LICENCE-GPL-2.txt LICENCE-LGPL-2.1.txt
 LIBISCSI_INSTALL_STAGING = YES
 LIBISCSI_AUTORECONF = YES
 
-LIBISCSI_CONF_OPTS = --disable-werror
+LIBISCSI_CONF_OPTS = --disable-werror --disable-manpages
 
 # We need to create the m4 directory to make autoreconf work properly.
 define LIBISCSI_CREATE_M4_DIR
-- 
2.14.1

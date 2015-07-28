From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 28 Jul 2015 16:26:31 +0200
Subject: [Buildroot] [PATCH] libiscsi: Force configure to use gcc for LD
Message-ID: <1438093591-14134-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.org/results/0a9/0a96f3654983ed2efc851522352dec43c1df0077/

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/libiscsi/libiscsi.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libiscsi/libiscsi.mk b/package/libiscsi/libiscsi.mk
index 7877cd9..4d27371 100644
--- a/package/libiscsi/libiscsi.mk
+++ b/package/libiscsi/libiscsi.mk
@@ -10,4 +10,6 @@ LIBISCSI_LICENSE = GPLv2+ LGPLv2.1+
 LIBISCSI_LICENSE_FILES = COPYING LICENCE-GPL-2.txt LICENCE-LGPL-2.1.txt
 LIBISCSI_INSTALL_STAGING = YES
 
+LIBISCSI_CONF_OPTS = LD="$(TARGET_CC)"
+
 $(eval $(autotools-package))
-- 
2.1.4

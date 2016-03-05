From: Baruch Siach <baruch@tkos.co.il>
Date: Sat,  5 Mar 2016 23:04:09 +0200
Subject: [Buildroot] [PATCH] omniorb: remove autoreconf
Message-ID: <4898671233ed0fa441e196c13d8d64239ca7255b.1457211849.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 03ee7f9823af (package/omniorb: bump version to 4.2.1) removed the patch
to configure.ac, making autoreconf redundant.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/omniorb/omniorb.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index ef4faec6d226..98bae20a71eb 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -13,9 +13,6 @@ OMNIORB_LICENSE_FILES = COPYING COPYING.LIB
 OMNIORB_DEPENDENCIES = host-omniorb
 HOST_OMNIORB_DEPENDENCIES = host-python
 
-# 0001-uclinux-is-also-linux.patch touches configure.ac
-OMNIORB_AUTORECONF = YES
-
 # omniorb is not python3 friendly, so force the python interpreter
 OMNIORB_CONF_OPTS = ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python2
 HOST_OMNIORB_CONF_OPTS = ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python2
-- 
2.7.0

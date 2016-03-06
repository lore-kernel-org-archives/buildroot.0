From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 13:19:42 +0100
Subject: [Buildroot] [git commit] omniorb: remove autoreconf
Message-ID: <20160306121957.EBCC67FD11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f14e66143271a5fe533a706404479aa741f18c26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 03ee7f9823af (package/omniorb: bump version to 4.2.1) removed the patch
to configure.ac, making autoreconf redundant.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/omniorb/omniorb.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index ef4faec..98bae20 100644
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

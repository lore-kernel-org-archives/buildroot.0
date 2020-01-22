From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 22 Jan 2020 20:14:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/libevent: do not drop python script
 with python 3
Message-ID: <20200122191438.55671-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python script is compatible with python3 since 2.1.10 and
https://github.com/libevent/libevent/commit/532a8cc301db39e82166b4fe98146534fdc242ce

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libevent/libevent.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index a5ba7fdf6a..d604559313 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -24,7 +24,7 @@ endef
 
 # libevent installs a python script to target - get rid of it if we
 # don't have python support enabled
-ifneq ($(BR2_PACKAGE_PYTHON),y)
+ifneq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
 LIBEVENT_POST_INSTALL_TARGET_HOOKS += LIBEVENT_REMOVE_PYSCRIPT
 endif
 
-- 
2.24.1

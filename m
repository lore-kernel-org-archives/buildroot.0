From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 21:20:31 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/libevent: do not
 drop python script with python 3
Message-ID: <20200307202451.4039A8FBF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35f8846e230d390de83522497fb785e20686f25e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

python script is compatible with python3 since 2.1.10 and
https://github.com/libevent/libevent/commit/532a8cc301db39e82166b4fe98146534fdc242ce

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f0ec49f09b244598d1adde4a7f918d4d31050a42)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 

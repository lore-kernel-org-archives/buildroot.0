From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 May 2019 09:44:18 +0200
Subject: [Buildroot] [git commit branch/next] package/shared-mime-info: bump
 to version 1.12
Message-ID: <20190524073947.0590D8D67A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ddae319d9a4485418527152eadc1915aa14710aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Switch site to gitlab
- Add hash for license file
- Send patch upstream (and add a link to merge request)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Remove-incorrect-dependency-from-install-data-hook.patch    | 2 ++
 package/shared-mime-info/shared-mime-info.hash                       | 3 ++-
 package/shared-mime-info/shared-mime-info.mk                         | 5 +++--
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/shared-mime-info/0001-Remove-incorrect-dependency-from-install-data-hook.patch b/package/shared-mime-info/0001-Remove-incorrect-dependency-from-install-data-hook.patch
index a0d3fb0fb3..4fe7f52174 100644
--- a/package/shared-mime-info/0001-Remove-incorrect-dependency-from-install-data-hook.patch
+++ b/package/shared-mime-info/0001-Remove-incorrect-dependency-from-install-data-hook.patch
@@ -23,6 +23,8 @@ This patch is similar to the patch used by the Yocto Project at
 http://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-support/shared-mime-info/shared-mime-info/install-data-hook.patch.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Upstream status:
+https://gitlab.freedesktop.org/xdg/shared-mime-info/merge_requests/18]
 ---
  Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/package/shared-mime-info/shared-mime-info.hash b/package/shared-mime-info/shared-mime-info.hash
index cf6c8f3eb7..b86499cd58 100644
--- a/package/shared-mime-info/shared-mime-info.hash
+++ b/package/shared-mime-info/shared-mime-info.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	2af55ef1a0319805b74ab40d331a3962c905477d76c086f49e34dc96363589e9	shared-mime-info-1.8.tar.xz
+sha256	18b2f0fe07ed0d6f81951a5fd5ece44de9c8aeb4dc5bb20d4f595f6cc6bd403e	shared-mime-info-1.12.tar.xz
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index e68d631a2e..9932bd2db0 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-SHARED_MIME_INFO_VERSION = 1.8
+SHARED_MIME_INFO_VERSION = 1.12
 SHARED_MIME_INFO_SOURCE = shared-mime-info-$(SHARED_MIME_INFO_VERSION).tar.xz
-SHARED_MIME_INFO_SITE = https://people.freedesktop.org/~hadess
+SHARED_MIME_INFO_SITE = \
+	https://gitlab.freedesktop.org/xdg/shared-mime-info/uploads/80c7f1afbcad2769f38aeb9ba6317a51
 SHARED_MIME_INFO_INSTALL_STAGING = YES
 # 0001-Remove-incorrect-dependency-from-install-data-hook.patch
 SHARED_MIME_INFO_AUTORECONF = YES

From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 10:54:37 +0200
Subject: [Buildroot] [git commit] package/dtc: disable valgrind
Message-ID: <20190801085607.0F099812F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56d6dd4530a6b216ac8a9e31e8ab1ef36770133d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 1.5.0, dtc optionally depends on valgrind so disable it by
setting NO_VALGRIND to 1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dtc/dtc.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index b99a96df83..1188e954b2 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -15,11 +15,13 @@ HOST_DTC_DEPENDENCIES = host-bison host-flex
 
 DTC_MAKE_OPTS = \
 	PREFIX=/usr \
-	NO_PYTHON=1
+	NO_PYTHON=1 \
+	NO_VALGRIND=1
 
 HOST_DTC_MAKE_OPTS = \
 	PREFIX=$(HOST_DIR) \
 	NO_PYTHON=1 \
+	NO_VALGRIND=1 \
 	NO_YAML=1
 
 define DTC_POST_INSTALL_TARGET_RM_DTDIFF

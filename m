From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Jan 2014 22:03:24 +0100
Subject: [Buildroot] [git commit] openpowerlink: force static library build
Message-ID: <20140126210518.A0A9B9C582@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a74767181387b168f6370899af964a1678b0a8cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no shared lib in openpowerlink,
so force static lib to build libpowerlink.a

Fixes:
http://autobuild.buildroot.net/results/b33/b33008d260c95bedc52bed48f191f76843612ef9/build-end.log
http://autobuild.buildroot.net/results/c46/c464bdfb8edaaf69d49ade92ef9cc6f45cc73362/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openpowerlink/openpowerlink.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index 3a60478..37a06e5 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -22,6 +22,10 @@ endif
 
 OPENPOWERLINK_CONF_OPT = -DCMAKE_SYSTEM_PROCESSOR=$(OPENPOWERLINK_ARCH)
 
+# There is no shared lib in openpowerlink,
+# so force static lib to build libpowerlink.a
+OPENPOWERLINK_CONF_OPT += -DBUILD_SHARED_LIBS=OFF
+
 ifeq ($(BR2_ENABLE_DEBUG),y)
 OPENPOWERLINK_CONF_OPT += -DCMAKE_BUILD_TYPE=Debug
 else

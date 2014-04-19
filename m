From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Apr 2014 18:53:56 +0200
Subject: [Buildroot] [git commit] lttng-libust: add python as optional
	dependency
Message-ID: <20140419165650.83CFE9C837@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bc377429dee3d74f51be82cef4cc174fcb6a869a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-libust/lttng-libust.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index b6d1911..3494537 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -15,4 +15,12 @@ LTTNG_LIBUST_DEPENDENCIES    = liburcu util-linux
 
 LTTNG_LIBUST_AUTORECONF = YES
 
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+LTTNG_LIBUST_DEPENDENCIES += python
+else ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LTTNG_LIBUST_DEPENDENCIES += python3
+else
+LTTNG_LIBUST_CONF_ENV=am_cv_pathless_PYTHON="none"
+endif
+
 $(eval $(autotools-package))

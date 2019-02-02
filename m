From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Feb 2019 15:00:12 +0100
Subject: [Buildroot] [git commit] package/aircrack-ng: add optional hwloc
 dependency
Message-ID: <20190202135913.AD9AB801CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8316da224dfaafab431100f708f51cc3fd98d9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

hwloc dependency has been added in version 1.4 with
https://github.com/aircrack-ng/aircrack-ng/commit/c31b27449962bc69638b32ec14e0ffdb8997dfcf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/aircrack-ng/aircrack-ng.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index 350e251bfe..b51332ab77 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -31,6 +31,13 @@ else
 AIRCRACK_NG_CONF_OPTS += --without-duma
 endif
 
+ifeq ($(BR2_PACKAGE_HWLOC),y)
+AIRCRACK_NG_DEPENDENCIES += hwloc
+AIRCRACK_NG_CONF_OPTS += --enable-hwloc
+else
+AIRCRACK_NG_CONF_OPTS += --disable-hwloc
+endif
+
 ifeq ($(BR2_PACKAGE_JEMALLOC),y)
 AIRCRACK_NG_DEPENDENCIES += jemalloc
 AIRCRACK_NG_CONF_OPTS += --with-jemalloc

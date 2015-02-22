From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 10:48:16 +0100
Subject: [Buildroot] [git commit] package/freerdp: conditionally build
	gstreamer support
Message-ID: <20150302222721.DFF6981771@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4da7b87f7d69be3bdbad1f4e79843cbcf6d542b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Avoid a warning at configure time when gstreamer is missing.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freerdp/freerdp.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index ffe014c..32b4714 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -14,6 +14,13 @@ FREERDP_LICENSE_FILES = LICENSE
 
 FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF
 
+ifeq ($(BR2_PACKAGE_GSTREAMER),y)
+FREERDP_CONF_OPTS += -DWITH_GSTREAMER=ON
+FREERDP_DEPENDENCIES += gstreamer
+else
+FREERDP_CONF_OPTS += -DWITH_GSTREAMER=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_CUPS),y)
 FREERDP_CONF_OPTS += -DWITH_CUPS=ON
 FREERDP_DEPENDENCIES += cups

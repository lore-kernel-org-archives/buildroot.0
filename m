From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 21:30:33 +0100
Subject: [Buildroot] [git commit] pacakge/freerdp: disable building the
	manpages
Message-ID: <20141207203037.A7D4F8011D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=093a4f4fc46c660c5608b9c808f3edccb257177a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building the manpages requires xsltproc, which might not be available.
Also, who needs the manpages on the target anyway? ;-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freerdp/freerdp.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index cb745ec..d2e51f8 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -12,6 +12,8 @@ FREERDP_DEPENDENCIES = openssl zlib \
 FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
 
+FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF
+
 ifeq ($(BR2_PACKAGE_CUPS),y)
 FREERDP_CONF_OPTS += -DWITH_CUPS=ON
 FREERDP_DEPENDENCIES += cups

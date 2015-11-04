From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Nov 2015 00:06:03 +0100
Subject: [Buildroot] [git commit] package/libass: add asm support for Intel
	archs
Message-ID: <20151104230639.8F67681D54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c9dff0139e2df58796fde959456cc5e854c40cad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libass/libass.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index 643a35e..f1f00f3 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -18,6 +18,12 @@ LIBASS_DEPENDENCIES = \
 	libfribidi \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
+# configure: WARNING: Install yasm for a significantly faster libass build.
+# only for Intel archs
+ifeq ($(BR2_i386)$(BR2_x86_64),y)
+LIBASS_DEPENDENCIES += host-yasm
+endif
+
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 LIBASS_DEPENDENCIES += fontconfig
 LIBASS_CONF_OPTS += --enable-fontconfig

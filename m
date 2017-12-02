From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Dec 2017 14:43:34 +0100
Subject: [Buildroot] [git commit] libostree: disable manpages/documentation
 generation
Message-ID: <20171202133623.739FB8151C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=024968fca2e4652c707558cde8a6d3015caaf738
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--enable-man is set to `auto` as default, which may break builds.

Should fix:

  http://autobuild.buildroot.net/results/43c298afcea20d17bfd9638c8bbee2a912c643be/

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libostree/libostree.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index bac44dd..19a00a2 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -12,7 +12,12 @@ LIBOSTREE_LICENSE = GPL-2.0+
 LIBOSTREE_LICENSE_FILES = COPYING
 LIBOSTREE_DEPENDENCIES = e2fsprogs host-pkgconf libfuse libglib2 libgpgme xz
 
-LIBOSTREE_CONF_OPTS += --with-gpgme-prefix=$(STAGING_DIR)/usr
+LIBOSTREE_CONF_OPTS += \
+	--with-gpgme-prefix=$(STAGING_DIR)/usr \
+	--disable-gtk-doc \
+	--disable-gtk-doc-html \
+	--disable-gtk-doc-pdf \
+	--disable-man
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBOSTREE_CONF_OPTS += --with-openssl

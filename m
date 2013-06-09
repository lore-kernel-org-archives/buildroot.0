From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Jun 2013 20:33:15 +0200
Subject: [Buildroot] [git commit] libsoup: add missing dependency on
	host-intltool
Message-ID: <20130609190558.001099AA3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a3bd97f6b6ccad3c2ebf992a7761570527aad4ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/e24/e240828ed2fdeb98f36818c0ef19b15dadc2e59f/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libsoup/libsoup.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index c9d90e8..252214f 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -19,7 +19,8 @@ endif
 
 LIBSOUP_CONF_OPT = --disable-glibtest --without-gnome
 
-LIBSOUP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-pkgconf host-libglib2 libglib2 libxml2 sqlite
+LIBSOUP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-pkgconf host-libglib2 \
+       libglib2 libxml2 sqlite host-intltool
 
 ifeq ($(BR2_PACKAGE_LIBSOUP_SSL),y)
 LIBSOUP_DEPENDENCIES += glib-networking

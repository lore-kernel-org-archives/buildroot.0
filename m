From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 19 Mar 2012 16:43:54 +0100
Subject: [Buildroot] [git commit] glib-networking: add missing host-intltool
	dependency
Message-ID: <20120319154430.3F012953ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b0e23660421ebbf233cec2e9979c9c99ef007ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following problem:

checking whether NLS is requested... yes
checking for intltool >= 0.35.0... ./configure: line 12323: intltool-update: command not found
 found
configure: error: Your intltool is too old.  You need intltool 0.35.0 or later.
make: *** [/home/test/test/output/build/glib-networking-2.30.2/.stamp_configured] Error 1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/glib-networking/glib-networking.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 47415d8..9165835 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -12,7 +12,11 @@ GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 
 GLIB_NETWORKING_INSTALL_STAGING = YES
 
-GLIB_NETWORKING_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-pkg-config libglib2
+GLIB_NETWORKING_DEPENDENCIES = \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) \
+	host-pkg-config \
+	host-intltool \
+	libglib2
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 GLIB_NETWORKING_DEPENDENCIES += gnutls

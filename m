From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Mar 2012 16:40:07 +0100
Subject: [Buildroot] [PATCH 3/3] glib-networking: add missing host-intltool
	dependency
In-Reply-To: <cover.1332171599.git.thomas.petazzoni@free-electrons.com>
References: <cover.1332171599.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e8982ff15e19fd7cf12f428e7d3152cd90a1b38b.1332171599.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following problem:

checking whether NLS is requested... yes
checking for intltool >= 0.35.0... ./configure: line 12323: intltool-update: command not found
 found
configure: error: Your intltool is too old.  You need intltool 0.35.0 or later.
make: *** [/home/test/test/output/build/glib-networking-2.30.2/.stamp_configured] Error 1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
-- 
1.7.4.1

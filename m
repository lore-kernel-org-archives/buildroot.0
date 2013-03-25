From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Mar 2013 22:42:35 +0100
Subject: [Buildroot] [PATCH 1/2] vala: add missing host-bison dependency
Message-ID: <1364247756-31480-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/a59cceb695298c212c91d2e32b381a096f875274/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vala/vala.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 6abcdd8..8cf616f 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -10,7 +10,7 @@ VALA_VERSION = $(VALA_VERSION_MAJOR).$(VALA_VERSION_MINOR)
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 
-VALA_DEPENDENCIES = host-flex libglib2 \
+VALA_DEPENDENCIES = host-flex host-bison libglib2 \
 		$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
 # If we want the documentation, then xsltproc is needed. If we don't
-- 
1.7.9.5

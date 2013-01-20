From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jan 2013 00:52:15 +0100
Subject: [Buildroot] [RFC v1 06/14] cmake infrastructure: support out of
	tree build
In-Reply-To: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358725943-31485-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The cmake infrastructure almost naturally supports out of tree
build. The only thing is that the <pkg>_BUILDDIR and <pkg>_SRCDIR
variables are now defined by pkg-generic.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-cmake.mk |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 626a0b0..6653d3f 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -46,9 +46,7 @@ $(2)_INSTALL_HOST_OPT		?= install
 $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR) install
 $(2)_CLEAN_OPT			?= clean
-
-$(2)_SRCDIR			= $$($(2)_DIR)/$($(2)_SUBDIR)
-$(2)_BUILDDIR			= $$($(2)_SRCDIR)
+$(2)_SUPPORTS_OUT_OF_TREE       = YES
 
 #
 # Configure step. Only define it if not already defined by the package
-- 
1.7.9.5

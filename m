From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Thu, 25 Mar 2010 20:48:47 +0200
Subject: [Buildroot] [PATCH RESEND] Fix autotools instalation with symbols
Message-ID: <20100325184847.7048.79789.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When installing without symbols install-strip is used,
with symbols - install-exec.
Since install-exec installs only executables, we should use
simple install, to install other needed files also
(like files in /usr/shared) as install-strip does.

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Acked-by: Lionel Landwerlin <llandwerlin@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---

 package/Makefile.autotools.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 7114bba..a8dd051 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -60,7 +60,7 @@ $(2)_LIBTOOL_PATCH		?= YES
 $(2)_USE_CONFIG_CACHE           ?= $(if $(BR2_CONFIG_CACHE),YES,NO)
 $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
 ifeq ($(BR2_ENABLE_DEBUG),y)
-$(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install-exec
+$(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install
 else
 $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install-strip
 endif

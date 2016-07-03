From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 10:24:02 +0200
Subject: [Buildroot] [git commit] dosfstools: remove empty host dependencies
	definition
Message-ID: <20160703082409.66113800F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb57abf9dc9e628fada90efcf48987e205bcec36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dosfstools/dosfstools.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 28a7b42..67c6f73 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -12,9 +12,6 @@ DOSFSTOOLS_LICENSE_FILES = COPYING
 DOSFSTOOLS_CONF_OPTS = --enable-compat-symlinks --exec-prefix=/
 HOST_DOSFSTOOLS_CONF_OPTS = --enable-compat-symlinks
 
-# Avoid target dosfstools dependencies, no host-libiconv
-HOST_DOSFSTOOLS_DEPENDENCIES =
-
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 DOSFSTOOLS_CONF_OPTS += --with-udev
 DOSFSTOOLS_DEPENDENCIES += udev

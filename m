From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Mar 2017 13:43:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/git: add optional support for
	gettext
Message-ID: <20170312124314.19848-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

git links to libintl if available:

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/bin/git | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libintl.so.8]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/git/git.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/git/git.mk b/package/git/git.mk
index ec606a415..75d5140e0 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -11,6 +11,10 @@ GIT_LICENSE = GPLv2, LGPLv2.1+
 GIT_LICENSE_FILES = COPYING LGPL-2.1
 GIT_DEPENDENCIES = zlib host-gettext
 
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+GIT_DEPENDENCIES += gettext
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 GIT_DEPENDENCIES += openssl
 GIT_CONF_OPTS += --with-openssl
-- 
2.11.0

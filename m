From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 10 Feb 2016 21:58:42 +0100
Subject: [Buildroot] [PATCH 2/2] package/links: add optional support for xz
In-Reply-To: <1455137922-18060-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455137922-18060-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1455137922-18060-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When xz was compiled before, links will use it as optional dependency:

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/bin/links | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [liblzma.so.5]
 0x00000001 (NEEDED)                     Shared library: [libbz2.so.1.0]
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libevent-2.0.so.5]
 0x00000001 (NEEDED)                     Shared library: [libc.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/links/links.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/links/links.mk b/package/links/links.mk
index b948de4..4d2cb2e 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -47,6 +47,10 @@ ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LINKS_DEPENDENCIES += openssl
 endif
 
+ifeq ($(BR2_PACKAGE_XZ),y)
+LINKS_DEPENDENCIES += xz
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LINKS_DEPENDENCIES += zlib
 endif
-- 
2.7.0

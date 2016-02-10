From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 10 Feb 2016 21:58:41 +0100
Subject: [Buildroot] [PATCH 1/2] package/links: add optional support for
	libevent
Message-ID: <1455137922-18060-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libevent was compiled before, links will use it as optional
dependency:

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/bin/links | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [liblzma.so.5]
 0x00000001 (NEEDED)                     Shared library: [libbz2.so.1.0]
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libevent-2.0.so.5]
 0x00000001 (NEEDED)                     Shared library: [libc.so.1]

(xz support will be added with the next patch of this series)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/links/links.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/links/links.mk b/package/links/links.mk
index ba55061..b948de4 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -39,6 +39,10 @@ ifeq ($(BR2_PACKAGE_BZIP2),y)
 LINKS_DEPENDENCIES += bzip2
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEVENT),y)
+LINKS_DEPENDENCIES += libevent
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LINKS_DEPENDENCIES += openssl
 endif
-- 
2.7.0

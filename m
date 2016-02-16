From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 23:10:08 +0100
Subject: [Buildroot] [git commit] package/links: add optional support for xz
Message-ID: <20160216221012.A4F448183F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7b6a32798bf90afeee9d1ff7b45e98cc2211e17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When xz was compiled before, links will use it as optional dependency:

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/bin/links | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [liblzma.so.5]
 0x00000001 (NEEDED)                     Shared library: [libbz2.so.1.0]
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libevent-2.0.so.5]
 0x00000001 (NEEDED)                     Shared library: [libc.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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

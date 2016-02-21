From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 14:52:54 +0100
Subject: [Buildroot] [git commit] package/links: add --with/--without-lzma
Message-ID: <20160221135332.E840B80E3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62ceea5cb5c5ba4c9ba8fe0c86bca7b6d7f49b23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/links/links.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/links/links.mk b/package/links/links.mk
index 8d7ecba..3515e5f 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -48,7 +48,10 @@ LINKS_DEPENDENCIES += openssl
 endif
 
 ifeq ($(BR2_PACKAGE_XZ),y)
+LINKS_CONF_OPTS += --with-lzma
 LINKS_DEPENDENCIES += xz
+else
+LINKS_CONF_OPTS += --without-lzma
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)

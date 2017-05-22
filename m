From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 May 2017 21:55:10 +0200
Subject: [Buildroot] [git commit] package/c-icap: fix bzip2 configure option
Message-ID: <20170522195515.3AAFB828FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a396b3ab1ecc0dff00be9e04f36494d0d68569f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure option controlling bzip2 support got its current name in
2012 with its initial commit:

https://sourceforge.net/p/c-icap/code/890/#diff-2

This patch fixes the configure warning:

configure: WARNING: unrecognized options: [...] --without-bzip2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/c-icap/c-icap.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index 466d08b..7925f5b 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -36,10 +36,10 @@ C_ICAP_CONF_OPTS += --without-bdb
 endif
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
-C_ICAP_CONF_OPTS += --with-bzip2
+C_ICAP_CONF_OPTS += --with-bzlib
 C_ICAP_DEPENDENCIES += bzip2
 else
-C_ICAP_CONF_OPTS += --without-bzip2
+C_ICAP_CONF_OPTS += --without-bzlib
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)

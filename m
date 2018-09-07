From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:32 -0000
Subject: [Buildroot] [git commit] package/botan: add optional dependency to
 boost
Message-ID: <20180907111536.71754811CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=031f5c04d9de5a21d3bc49f3849af3e6593fa1a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/botan/botan.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 21a66adff1..e25bf5b52f 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -40,6 +40,11 @@ else
 BOTAN_CONF_OPTS += --without-stack-protector
 endif
 
+ifeq ($(BR2_PACKAGE_BOOST),y)
+BOTAN_DEPENDENCIES += boost
+BOTAN_CONF_OPTS += --with-boost
+endif
+
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 BOTAN_DEPENDENCIES += bzip2
 BOTAN_CONF_OPTS += --with-bzip2

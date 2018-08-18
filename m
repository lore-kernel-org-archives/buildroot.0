From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Aug 2018 01:30:50 +0200
Subject: [Buildroot] [PATCH/next 2/4] package/botan: add optional dependency
 to boost
In-Reply-To: <20180818233052.30190-1-bernd.kuhls@t-online.de>
References: <20180818233052.30190-1-bernd.kuhls@t-online.de>
Message-ID: <20180818233052.30190-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.18.0

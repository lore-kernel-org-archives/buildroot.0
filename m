From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 11 Sep 2019 19:46:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/sslh: fixup the 'v' prefix in the
 version
Message-ID: <20190911174630.648-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order for the sslh version to match what is given by
release-monitoring.org, the 'v' prefix should be encoded in
SSLH_SOURCE and not SSLH_VERSION.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sslh/sslh.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sslh/sslh.mk b/package/sslh/sslh.mk
index 6e29a99189..ba91f8c4d6 100644
--- a/package/sslh/sslh.mk
+++ b/package/sslh/sslh.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-SSLH_VERSION = v1.20
+SSLH_VERSION = 1.20
+SSLH_SOURCE = sslh-v$(SSLH_VERSION).tar.gz
 SSLH_SITE = http://www.rutschle.net/tech/sslh
 SSLH_LICENSE = GPL-2.0+
 SSLH_LICENSE_FILES = COPYING
-- 
2.23.0.rc1

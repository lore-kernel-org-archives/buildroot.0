From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Wed, 25 Nov 2015 09:44:13 -0300
Subject: [Buildroot] [PATCH] c-ares: define random file
Message-ID: <1448455453-22572-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

When cross-compiling it assumes there's none, however that's not true.
Specify the usual /dev/urandom for this usage, it's used for random key
generation on startup.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/c-ares/c-ares.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index c858887..77ae4b9 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -7,6 +7,7 @@
 C_ARES_VERSION = 1.10.0
 C_ARES_SITE = http://c-ares.haxx.se/download
 C_ARES_INSTALL_STAGING = YES
+C_ARES_CONF_OPTS = --with-random=/dev/urandom
 # Rebuild configure to avoid XC_CHECK_USER_CFLAGS
 C_ARES_AUTORECONF = YES
 C_ARES_LICENSE = MIT
-- 
2.4.10

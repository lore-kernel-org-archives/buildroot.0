From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 16 Apr 2012 15:06:55 +0200
Subject: [Buildroot] [PATCH] boost: pass -dumpversion to user-config.jam
Message-ID: <1334581615-27627-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Short version avoids compiling problems with toolchains
containing long version string like Linaro toolchain.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/boost.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index e25e24d..b106be7 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -10,7 +10,7 @@ BOOST_SOURCE = boost_$(BOOST_FILE_VERSION).tar.bz2
 BOOST_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/boost
 BOOST_INSTALL_STAGING = YES
 
-TARGET_CC_VERSION = $(shell $(TARGET_CC) --version | head -n 1 | sed -e "s/.*[[:space:]]\([[:digit:].]\+$$\)/\1/g" )
+TARGET_CC_VERSION = $(shell $(TARGET_CC) -dumpversion | head -n 1 | sed -e "s/.*[[:space:]]\([[:digit:].]\+$$\)/\1/g" )
 
 BOOST_DEPENDENCIES = bzip2 zlib
 
-- 
1.7.7

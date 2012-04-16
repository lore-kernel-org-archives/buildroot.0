From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 Apr 2012 22:33:08 +0200
Subject: [Buildroot] [git commit] boost: pass -dumpversion to user-config.jam
Message-ID: <20120416203435.B713396AED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5d8af3747afb10094886e282f416fb0221cb1350
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Short version avoids compiling problems with toolchains
containing long version string like Linaro toolchain.

[Peter: drop head/sed as -dumpversion returns version directly]
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/boost/boost.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 8b8a3cf..9da427a 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -10,7 +10,7 @@ BOOST_SOURCE = boost_$(BOOST_FILE_VERSION).tar.bz2
 BOOST_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/boost
 BOOST_INSTALL_STAGING = YES
 
-TARGET_CC_VERSION = $(shell $(TARGET_CC) --version | head -n 1 | sed -e "s/.*[[:space:]]\([[:digit:].]\+$$\)/\1/g" )
+TARGET_CC_VERSION = $(shell $(TARGET_CC) -dumpversion)
 
 BOOST_DEPENDENCIES = bzip2 zlib
 

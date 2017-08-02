From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 19:07:22 +0200
Subject: [Buildroot] [git commit] package/libcodec2: disable unittest
Message-ID: <20170802170315.0EADF821E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2385ce1f40278fe6af5035300e2d959f1d9b56e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Quoting
https://svn.code.sf.net/p/freetel/code/codec2-dev/CMakeLists.txt
"# Unittest should be on for dev builds and off for releases."

If unittest is enabled libcodec2 depends on speex and libsamplerate.
To avoid these dependencies we simply disable unittest.

Fixes
http://autobuild.buildroot.net/results/da2/da2b6402c8fabd85a9ee728e8dbf7b78c5aa801e/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcodec2/libcodec2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcodec2/libcodec2.mk b/package/libcodec2/libcodec2.mk
index 38ecac1..7d1c6c3 100644
--- a/package/libcodec2/libcodec2.mk
+++ b/package/libcodec2/libcodec2.mk
@@ -11,6 +11,7 @@ LIBCODEC2_LICENSE = LGPL-2.1
 LIBCODEC2_LICENSE_FILES = COPYING
 LIBCODEC2_INSTALL_STAGING = YES
 LIBCODEC2_SUPPORTS_IN_SOURCE_BUILD = NO
+LIBCODEC2_CONF_OPTS = -DUNITTEST=OFF
 
 ifeq ($(BR2_PACKAGE_LIBCODEC2_EXAMPLES),y)
 LIBCODEC2_CONF_OPTS += -DINSTALL_EXAMPLES=ON

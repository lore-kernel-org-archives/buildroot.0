From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Oct 2014 19:26:00 +0200
Subject: [Buildroot] [git commit] libxml2: explicitly state zlib dir
Message-ID: <20141018172604.E2FA5B3A9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=91709de4175a27bc5cdecd4bb65b505c726e3aa1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pass the zlib directory prefix to --with-zlib otherwise it expands into
absolute (distribution) directories leading to bad test results in
configure. Fixes:
http://autobuild.buildroot.net/results/303/303d6d165c5423944122bf430575c018479733f8/build-end.log

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxml2/libxml2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 4e296fa..354c178 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -25,7 +25,7 @@ HOST_LIBXML2_CONF_OPTS = --without-zlib --without-lzma --without-python
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBXML2_DEPENDENCIES += zlib
-LIBXML2_CONF_OPTS += --with-zlib
+LIBXML2_CONF_OPTS += --with-zlib=$(STAGING_DIR)/usr
 else
 LIBXML2_CONF_OPTS += --without-zlib
 endif

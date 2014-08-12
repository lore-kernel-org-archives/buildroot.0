From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Aug 2014 09:08:53 +0200
Subject: [Buildroot] [git commit] fbv: fix typo in pkg-config variable
Message-ID: <20140812070948.9E56B9D42F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3bb4ac791b78ad9ba86f36d13ffd2525c0e9b80
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fbv/fbv.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
index cc1dc7b..19d5cea 100644
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -18,7 +18,7 @@ FBV_DEPENDENCIES += libpng
 
 # libpng in turn depends on other libraries
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-FBV_CONFIGURE_OPTS += "--libs=$(shell $(PKGg_CONFIG_HOST_BINARY) --libs libpng --static)"
+FBV_CONFIGURE_OPTS += "--libs=$(shell $(PKG_CONFIG_HOST_BINARY) --libs libpng --static)"
 endif
 
 else

From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Mar 2021 23:15:17 +0100
Subject: [Buildroot] [git commit] package/janet: add -std=c99 to CFLAGS
Message-ID: <20210308072137.1AC728893D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5e8f1c1475b46c8d9b7159aafe983e72d329d29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As upstream says Janet should be compiled with -std=c99
so pass this in order to fix the failures below.

Fixes:
 http://autobuild.buildroot.net/results/192/1922ec115b9dc9e879760a6868969d9677093510/build-end.log
 ...
 http://autobuild.buildroot.net/results/355/355e0992338a8d132050517f83a3884606b00529/build-end.log

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/janet/janet.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index 7243d60c01..ea042221d8 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -8,8 +8,8 @@ JANET_VERSION = 1.15.0
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
-
 JANET_INSTALL_STAGING = YES
+JANET_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
 ifeq ($(BR2_STATIC_LIBS),y)
 JANET_CONF_OPTS += -Ddynamic_modules=false

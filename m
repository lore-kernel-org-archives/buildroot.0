From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 14 Sep 2014 10:14:51 -0400
Subject: [Buildroot] [PATCH 1/2] libqrencode: link with pthread to avoid
	build failure
Message-ID: <1410704092-3006-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes: http://autobuild.buildroot.net/results/1ca0719dd1fe0bbc528ec99b5bc2b42e985bfdca/

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/libqrencode/libqrencode.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libqrencode/libqrencode.mk b/package/libqrencode/libqrencode.mk
index d445763..085d0ae 100644
--- a/package/libqrencode/libqrencode.mk
+++ b/package/libqrencode/libqrencode.mk
@@ -11,6 +11,8 @@ LIBQRENCODE_INSTALL_STAGING = YES
 LIBQRENCODE_LICENSE = LGPLv2.1+
 LIBQRENCODE_LICENSE_FILES = COPYING
 
+LIBQRENCODE_CONF_OPT = LIBS='-pthread'
+
 ifeq ($(BR2_PACKAGE_LIBQRENCODE_TOOLS),y)
 LIBQRENCODE_CONF_OPT += --with-tools=yes
 LIBQRENCODE_DEPENDENCIES += libpng
-- 
1.9.1

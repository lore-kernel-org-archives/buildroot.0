From: Karoly Kasza <kaszak@gmail.com>
Date: Mon,  6 Oct 2014 13:17:18 +0200
Subject: [Buildroot] [PATCH 1/1] openvmtools: remove unnecessary C flag
Message-ID: <1412594238-39906-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 8bec0a1af57165081dc275f813c8c5c74ff12c14
the -Wno-unused-local-typedefs CFLAG in not needed.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/openvmtools/openvmtools.mk |    1 -
 1 file changed, 1 deletion(-)

diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 598107c..7aa04af 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -41,7 +41,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PAM),y)
 OPENVMTOOLS_CONF_OPTS += --with-pam
-OPENVMTOOLS_MAKE_OPTS += CFLAGS+="-Wno-unused-local-typedefs"
 OPENVMTOOLS_DEPENDENCIES += linux-pam
 else
 OPENVMTOOLS_CONF_OPTS += --without-pam
-- 
1.7.10.4

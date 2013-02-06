From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  6 Feb 2013 10:36:56 -0300
Subject: [Buildroot] [PATCH 1/2] iw: use BR2_KERNEL_MIRROR for SITE
Message-ID: <1360157817-18509-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As pointed by Arnout Vandecappelle.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iw/iw.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 9233833..54c42d7 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -6,7 +6,7 @@
 
 IW_VERSION = 3.8
 IW_SOURCE = iw-$(IW_VERSION).tar.bz2
-IW_SITE = http://www.kernel.org/pub/software/network/iw
+IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = iw license
 IW_LICENSE_FILES = COPYING
 IW_DEPENDENCIES = host-pkgconf libnl
-- 
1.7.12.4

From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 11 Nov 2013 15:43:47 +0000
Subject: [Buildroot] [PATCH] libqmi: fix autobuild failures
Message-ID: <1384184627-8102-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

The libqmi build specifies -Werror in the CFLAGS by default. This causes
build failures such as the following.

  http://autobuild.buildroot.net/results/070/070449299aa9025c4bc6769524a6e22d66c92a65/

The -Werror flag can be disabled using a configuration switch.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/libqmi/libqmi.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 911b1a7..8bd4577 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -13,4 +13,6 @@ LIBQMI_INSTALL_STAGING = YES
 
 LIBQMI_DEPENDENCIES = libglib2
 
+LIBQMI_CONF_OPT = --enable-more-warnings=yes
+
 $(eval $(autotools-package))
-- 
1.8.3.2

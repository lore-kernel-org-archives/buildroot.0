From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 26 Sep 2013 18:21:44 -0500
Subject: [Buildroot] [PATCH v3 01/11] udev: explicitly include pthreads
In-Reply-To: <1380237714-2470-1-git-send-email-spenser@gillilanding.com>
References: <1380237714-2470-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1380237714-2470-2-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes builds with Linaro hard float toolchains.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/udev/udev.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index db86850..b512ec5 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -12,7 +12,7 @@ UDEV_LICENSE_FILES = COPYING
 UDEV_INSTALL_STAGING = YES
 
 # mq_getattr is in librt
-UDEV_CONF_ENV += LIBS=-lrt
+UDEV_CONF_ENV += LIBS="-lrt -lpthread"
 
 UDEV_CONF_OPT =			\
 	--sbindir=/sbin		\
-- 
1.7.1

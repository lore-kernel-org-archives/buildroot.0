From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 11 Mar 2012 14:15:00 +0100
Subject: [Buildroot] [PATCH] libethumb: Fix automagic dependencies on
	libedbus and libexif
In-Reply-To: <4F54C2BC.8090703@imgtec.com>
References: <4F54C2BC.8090703@imgtec.com>
Message-ID: <1331471700-17563-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

libethumb will determine during configuration phase whether to build the
optional libexif and libedbus modules. It will enable this modules if
libedbus or libexif are present on the target system. Therefore, we need
to add these packages as optional dependencies to libethumb.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
Arnout: Resending as in-line patch for easy review.
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/efl/libethumb/libethumb.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/efl/libethumb/libethumb.mk b/package/efl/libethumb/libethumb.mk
index 16b2ba9..617de0d 100644
--- a/package/efl/libethumb/libethumb.mk
+++ b/package/efl/libethumb/libethumb.mk
@@ -13,4 +13,12 @@ LIBETHUMB_DEPENDENCIES = libeina libevas libecore libedje host-libedje
 
 LIBETHUMB_CONF_OPT = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc
 
+ifeq ($(BR2_PACKAGE_LIBEXIF),y)
+LIBETHUMB_DEPENDENCIES += libexif
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEDBUS),y)
+LIBETHUMB_DEPENDENCIES += libedbus
+endif
+
 $(eval $(call AUTOTARGETS))
-- 
1.7.9.1

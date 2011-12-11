From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 11 Dec 2011 12:25:59 -0300
Subject: [Buildroot] [PATCH 4/5] wavpack: fix broken build with binutils
	2.22+
In-Reply-To: <1323617160-4360-1-git-send-email-gustavo@zacarias.com.ar>
References: <1323617160-4360-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1323617160-4360-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/wavpack/wavpack.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/wavpack/wavpack.mk b/package/multimedia/wavpack/wavpack.mk
index 8b0af0b..9680385 100644
--- a/package/multimedia/wavpack/wavpack.mk
+++ b/package/multimedia/wavpack/wavpack.mk
@@ -11,6 +11,8 @@ WAVPACK_INSTALL_STAGING = YES
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
 WAVPACK_DEPENDENCIES += libiconv
+# Fix for binutils 2.22+ new default --no-copy-dt-needed
+WAVPACK_CONF_ENV = LIBS="-liconv"
 endif
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.3.4

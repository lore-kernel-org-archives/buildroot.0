From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 11 Nov 2013 21:59:42 +0100
Subject: [Buildroot] [PATCH 2/6] Makefile: add $(HOST_DIR)/sbin to BR2_PATH
In-Reply-To: <1384203586-17790-1-git-send-email-s.martin49@gmail.com>
References: <1384203586-17790-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1384203586-17790-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Extend BR2_PATH because few host-packages install programs in this
location.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 5a99bbb..4010c65 100644
--- a/Makefile
+++ b/Makefile
@@ -267,7 +267,7 @@ TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 HOST_DIR:=$(call qstrip,$(BR2_HOST_DIR))
 
 # Set BR2_PATH (including host bindirs)
-BR2_PATH:="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(PATH)"
+BR2_PATH:="$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(PATH)"
 
 # locales to generate
 GENERATE_LOCALE=$(call qstrip,$(BR2_GENERATE_LOCALE))
-- 
1.8.4.2

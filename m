From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 30 Jan 2014 21:38:49 +0100
Subject: [Buildroot] [PATCH v3 2/6] Makefile: add $(HOST_DIR)/sbin to
	BR2_PATH
In-Reply-To: <1391114333-28001-1-git-send-email-s.martin49@gmail.com>
References: <1391114333-28001-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1391114333-28001-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Extend BR2_PATH because few host-packages install programs in this
location.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v2 -> v3:
- rebase

changes v1 -> v2:
- rebase
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 0d638ce..5e8cfd8 100644
--- a/Makefile
+++ b/Makefile
@@ -306,7 +306,7 @@ TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 HOST_DIR:=$(call qstrip,$(BR2_HOST_DIR))
 
 # Set BR2_PATH (including host bindirs)
-BR2_PATH:="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(PATH)"
+BR2_PATH:="$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(PATH)"
 
 # locales to generate
 GENERATE_LOCALE=$(call qstrip,$(BR2_GENERATE_LOCALE))
-- 
1.8.5.3

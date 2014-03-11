From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 11 Mar 2014 23:39:43 +0100
Subject: [Buildroot] [PATCH v7 2/6] Makefile: add $(HOST_DIR)/sbin to BR_PATH
In-Reply-To: <1394577587-6426-1-git-send-email-s.martin49@gmail.com>
References: <1394577587-6426-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1394577587-6426-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Extend BR_PATH because a few host-packages install programs in this
location.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v6 -> v7:
- rebase
- fix typo (Yann)

changes v4 -> v6:
- rebase

changes v3 -> v4:
- rebase
- fix typo in commit log (ThomasP)
- rename BR2_PATH -> BR_PATH

changes v2 -> v3:
- rebase

changes v1 -> v2:
- rebase
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1329ada..3654845 100644
--- a/Makefile
+++ b/Makefile
@@ -330,7 +330,7 @@ TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 HOST_DIR:=$(call qstrip,$(BR2_HOST_DIR))
 
 # Quotes are needed for spaces and all in the original PATH content.
-BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin:$(PATH)"
+BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin:$(PATH)"
 
 # locales to generate
 GENERATE_LOCALE=$(call qstrip,$(BR2_GENERATE_LOCALE))
-- 
1.9.0

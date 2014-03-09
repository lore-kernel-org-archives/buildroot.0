From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  9 Mar 2014 15:00:19 +0100
Subject: [Buildroot] [PATCH v6 2/6] Makefile: add $(HOST_DIR)/sbin to BR_PATH
In-Reply-To: <1394373623-10650-1-git-send-email-s.martin49@gmail.com>
References: <1394373623-10650-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1394373623-10650-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Extend BR_PATH because a few host-packages install programs in this
location.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
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
index 1329ada..f815b93 100644
--- a/Makefile
+++ b/Makefile
@@ -330,7 +330,7 @@ TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 HOST_DIR:=$(call qstrip,$(BR2_HOST_DIR))
 
 # Quotes are needed for spaces and all in the original PATH content.
-BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin:$(PATH)"
+BR_PATH:="$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin:$(PATH)"
 
 # locales to generate
 GENERATE_LOCALE=$(call qstrip,$(BR2_GENERATE_LOCALE))
-- 
1.9.0

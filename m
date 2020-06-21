From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Jun 2020 23:04:47 +0200
Subject: [Buildroot] [git commit] package/cryptsetup: bump to version 2.3.3
Message-ID: <20200621210415.2A9B883AA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7275741011070066ed08960c9f49d4d845128a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update indentation in hash file (two spaces)
- Send patch upstream

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cryptsetup/0001-Remove-json_object-typedef.patch | 2 ++
 package/cryptsetup/cryptsetup.hash                       | 8 ++++----
 package/cryptsetup/cryptsetup.mk                         | 4 ++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/cryptsetup/0001-Remove-json_object-typedef.patch b/package/cryptsetup/0001-Remove-json_object-typedef.patch
index fa865314a7..bbfd1aa075 100644
--- a/package/cryptsetup/0001-Remove-json_object-typedef.patch
+++ b/package/cryptsetup/0001-Remove-json_object-typedef.patch
@@ -12,6 +12,8 @@ In file included from lib/luks2/luks2_internal.h:32,
 lib/luks2/luks2.h:86: error: redefinition of typedef 'json_object'
 
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+[Upstream status:
+https://gitlab.com/cryptsetup/cryptsetup/-/merge_requests/91]
 ---
  lib/luks2/luks2.h | 1 -
  lib/setup.c       | 1 +
diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index 175ecf33cf..c47d701baa 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.2/sha256sums.asc
-sha256 2af0ec9551ab9c870074cae9d3f68d82cab004f4095fa89db0e4413713424a46  cryptsetup-2.2.2.tar.xz
-sha256 45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
-sha256 8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL
+# From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.3/sha256sums.asc
+sha256  3bca4ffe39e2f94cef50f6ea65acb873a6dbce5db34fc6bcefe38b6d095e82df  cryptsetup-2.3.3.tar.xz
+sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
+sha256  8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 197f5f25b2..587ef0a810 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CRYPTSETUP_VERSION_MAJOR = 2.2
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).2
+CRYPTSETUP_VERSION_MAJOR = 2.3
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).3
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = lvm2 popt util-linux host-pkgconf json-c libargon2 \

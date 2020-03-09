From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 09 Mar 2020 14:21:42 -0000
Subject: [Buildroot] [git commit] package/libosip2: bump to version 5.1.1
Message-ID: <20200309140904.3D4D57F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf2317dacf33556aff1df7f837b4e1be8b100306
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch that was applied upstream

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ort-sr-109133-Heap-buffer-overflow-in-uti.patch | 30 ----------------------
 package/libosip2/libosip2.hash                     |  2 +-
 package/libosip2/libosip2.mk                       |  2 +-
 3 files changed, 2 insertions(+), 32 deletions(-)

diff --git a/package/libosip2/0001-fix-bug-report-sr-109133-Heap-buffer-overflow-in-uti.patch b/package/libosip2/0001-fix-bug-report-sr-109133-Heap-buffer-overflow-in-uti.patch
deleted file mode 100644
index 7f2c2d46d2..0000000000
--- a/package/libosip2/0001-fix-bug-report-sr-109133-Heap-buffer-overflow-in-uti.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7e0793e15e21f68337e130c67b031ca38edf055f Mon Sep 17 00:00:00 2001
-From: Aymeric Moizard <amoizard@gmail.com>
-Date: Mon, 5 Sep 2016 15:01:53 +0200
-Subject: [PATCH]  * fix bug report: sr #109133: Heap buffer overflow in
- utility function *osip_clrncpy*    https://savannah.gnu.org/support/?109133
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/osipparser2/osip_port.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/osipparser2/osip_port.c b/src/osipparser2/osip_port.c
-index 0e64147..d8941b0 100644
---- a/src/osipparser2/osip_port.c
-+++ b/src/osipparser2/osip_port.c
-@@ -1291,8 +1291,10 @@ osip_clrncpy (char *dst, const char *src, size_t len)
- 	char *p;
- 	size_t spaceless_length;
- 
--	if (src == NULL)
-+	if (src == NULL || len == 0) {
-+		*dst = '\0';
- 		return NULL;
-+	}
- 
- 	/* find the start of relevant text */
-	pbeg = src;
--- 
-2.11.0
-
diff --git a/package/libosip2/libosip2.hash b/package/libosip2/libosip2.hash
index c6df5f2362..76bc29d5fe 100644
--- a/package/libosip2/libosip2.hash
+++ b/package/libosip2/libosip2.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	c9a18b0c760506d150017cdb1fa5c1cefe12b8dcbbf9a7e784eb75af376e96cd	libosip2-3.6.0.tar.gz
+sha256	61bb28317221a630e47f65389d5ff3e4693996d3128e9e0d5d1399e4feebf64d	libosip2-5.1.1.tar.gz
 
 # Hash for license file:
 sha256	8d9e95ed0e48df46dc758eb0d86df611f771eab4eed94bebb77dca87f1c897de	COPYING
diff --git a/package/libosip2/libosip2.mk b/package/libosip2/libosip2.mk
index 9302b9912e..e608f671c8 100644
--- a/package/libosip2/libosip2.mk
+++ b/package/libosip2/libosip2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSIP2_VERSION = 3.6.0
+LIBOSIP2_VERSION = 5.1.1
 LIBOSIP2_SITE = $(BR2_GNU_MIRROR)/osip
 LIBOSIP2_INSTALL_STAGING = YES
 LIBOSIP2_LICENSE = LGPL-2.1+

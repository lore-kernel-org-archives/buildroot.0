From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Fri,  7 Aug 2020 11:47:34 +0300
Subject: [Buildroot] [PATCH 1/1] package/htop: add debian patch for fixing
 build with gcc 10
Message-ID: <20200807084734.1528758-1-fido_max@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/htop/htop.hash | 1 +
 package/htop/htop.mk   | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index e764644a0b..005e6ab0d9 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,3 +1,4 @@
 # Locally calculated
 sha256  d9d6826f10ce3887950d709b53ee1d8c1849a70fa38e91d5896ad8cbc6ba3c57  htop-2.2.0.tar.gz
 sha256  70466e76443cb5b68144d9fcedca9584e7bfdb6c50859daa5a0290ea27c58aad  COPYING
+sha256  259bbff6bb18e2e39981519bbe536c82d3eb1d291904c2d17d1bfa3e48093691  gcc10.patch
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index dc84e32708..3f8c66a952 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -12,6 +12,9 @@ HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONF
 HTOP_LICENSE = GPL-2.0
 HTOP_LICENSE_FILES = COPYING
 
+HTOP_PATCH = \
+	https://sources.debian.org/data/main/h/htop/2.2.0-3/debian/patches/gcc10.patch
+
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 HTOP_CONF_OPTS += --enable-unicode
 else
-- 
2.27.0

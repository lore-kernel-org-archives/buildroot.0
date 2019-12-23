From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Mon, 23 Dec 2019 11:48:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: remove trailing space in
 samba4.mk
Message-ID: <20191223104801.50165-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes the following warning from `make check-package`:
    package/samba4/samba4.mk:34: line contains trailing whitespace

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/samba4/samba4.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 955de8f764..c5d2d6c6ea 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -31,7 +31,7 @@ SAMBA4_PYTHON = \
 	PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config"
 SAMBA4_DEPENDENCIES += host-python3 python3
 else
-SAMBA4_PYTHON = PYTHON="$(HOST_DIR)/bin/python2" 
+SAMBA4_PYTHON = PYTHON="$(HOST_DIR)/bin/python2"
 SAMBA4_DEPENDENCIES += host-python
 SAMBA4_CONF_OPTS += --disable-python
 endif
-- 
2.23.0

From: Ilias Apalodimas <apalos@gmail.com>
Date: Wed, 15 Feb 2017 10:18:54 +0200
Subject: [Buildroot] [PATCH 1/2] ipset: install libraries
Message-ID: <1487146735-12418-1-git-send-email-apalos@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages may require libipset(i.e keepalived introduced in this patch).

Signed-off-by: Ilias Apalodimas <apalos@gmail.com>
---
 package/ipset/ipset.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index db4952b..bb40fee 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -13,5 +13,6 @@ IPSET_CONF_OPTS = --with-kmod=no
 IPSET_AUTORECONF = YES
 IPSET_LICENSE = GPLv2
 IPSET_LICENSE_FILES = COPYING
+IPSET_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
1.9.1

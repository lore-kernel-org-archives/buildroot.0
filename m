From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu,  3 Oct 2013 21:12:41 +0100
Subject: [Buildroot] [PATCH] pppd: add license information
Message-ID: <1380831161-3225-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/pppd/pppd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index b2ced29..471a71e 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -7,6 +7,10 @@
 PPPD_VERSION = 2.4.5
 PPPD_SOURCE = ppp-$(PPPD_VERSION).tar.gz
 PPPD_SITE = ftp://ftp.samba.org/pub/ppp
+PPPD_LICENSE = LGPLv2+ LGPL BSD-4c BSD-3c GPLv2+
+PPPD_LICENSE_FILES = pppd/tdb.c pppd/plugins/pppoatm/COPYING \
+	pppdump/bsd-comp.c pppd/ccp.c pppd/plugins/passprompt.c
+
 PPPD_TARGET_BINS = chat pppd pppdump pppstats
 PPPD_MANPAGES = $(if $(BR2_HAVE_DOCUMENTATION),chat pppd pppdump pppstats)
 PPPD_RADIUS_MANPAGES = $(if $(BR2_HAVE_DOCUMENTATION),pppd-radattr pppd-radius)
-- 
1.8.1.2

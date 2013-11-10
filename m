From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 Nov 2013 23:33:54 +0100
Subject: [Buildroot] [git commit] libmicrohttpd: disable epoll support on
	avr32
Message-ID: <20131110223451.CDCEE9BB2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb17c71dd37aae6908c97e79d2d8c3878d83c9f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As it isn't available.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmicrohttpd/libmicrohttpd.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index e3ad026..8d5395d 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -20,4 +20,9 @@ LIBMICROHTTPD_LICENSE = LGPLv2.1+ or eCos
 LIBMICROHTTPD_CONF_OPT += --disable-https
 endif
 
+ifeq ($(BR2_avr32),y)
+# no epoll_create1
+LIBMICROHTTPD_CONF_OPT += --disable-epoll
+endif
+
 $(eval $(autotools-package))

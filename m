From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Sep 2009 21:25:00 +0200
Subject: [Buildroot] [git commit master] samba: explicitly link with
	-pthread if avahi support is enabled
Message-ID: <20090921194548.C305E7774A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5fda7023ff87c3103f4eb52b4205fb2549e17423
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The avahi-client library makes use of threads. We need to link the
smbd binary with -pthread if avahi support is enabled. Otherwise the
binary will crash at startup.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/samba/samba.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 45e9938..82bf152 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -36,6 +36,7 @@ $(SAMBA_DIR)/.configured: $(SAMBA_DIR)/.unpacked
 		samba_cv_CC_NEGATIVE_ENUM_VALUES=yes \
 		samba_cv_fpie=no \
 		libreplace_cv_HAVE_IPV6=$(if $(BR2_INET_IPV6),yes,no) \
+		AVAHI_LIBS=-pthread \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
-- 
1.6.3.3

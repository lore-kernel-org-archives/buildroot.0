From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 22 Mar 2010 15:19:42 +0100
Subject: [Buildroot] [git commit master] pppd: only install manpages if
	BR2_HAVE_MANPAGES is enabled
Message-ID: <20100322145736.D6FC47771C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a7d8592333fc89d667562688703ad405121fb575
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

They do get removed in target-finalize, but we might as well not install
them in the first place.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    2 +-
 package/pppd/pppd.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3461cd5..3f5f941 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,7 +6,7 @@
 	X.org updated to 7.5.
 
 	Updated/fixed packages: busybox, dosfstools, e2fsprogs,
-	libglib2, libpng, mtd-utils, setserial, squashfs
+	libglib2, libpng, mtd-utils, pppd, setserial, squashfs
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 6620abc..32be428 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -8,7 +8,7 @@ PPPD_VERSION = 2.4.5
 PPPD_SOURCE = ppp-$(PPPD_VERSION).tar.gz
 PPPD_SITE = ftp://ftp.samba.org/pub/ppp
 PPPD_TARGET_BINS = chat pppd pppdump pppstats
-PPPD_MANPAGES = chat pppd pppdump pppstats
+PPPD_MANPAGES = $(if $(BR2_HAVE_MANPAGES),chat pppd pppdump pppstats)
 PPPD_MAKE = $(MAKE) CC=$(TARGET_CC) COPTS="$(TARGET_CFLAGS)" -C $(PPPD_DIR) $(PPPD_MAKE_OPT)
 
 ifeq ($(BR2_PACKAGE_PPPD_FILTER),y)
-- 
1.6.3.3

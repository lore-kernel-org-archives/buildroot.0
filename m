From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Oct 2009 22:12:33 +0100
Subject: [Buildroot] [git commit master] synergy: get rid of superfluous
	configure args and use sourceforge mirror
Message-ID: <20091027211438.245E97773A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=61b57f10a688f1714fea41bd9910fe9d50c6d789
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These are all provided by Makefile.autotools.in

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/synergy/synergy.mk |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
index f298351..f70806d 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -6,14 +6,11 @@
 
 SYNERGY_VERSION = 1.3.1
 SYNERGY_SOURCE = synergy-$(SYNERGY_VERSION).tar.gz
-SYNERGY_SITE = http://internap.dl.sourceforge.net/sourceforge/synergy2/
+SYNERGY_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/synergy2/
 SYNERGY_AUTORECONF = NO
 SYNERGY_INSTALL_STAGING = NO
 SYNERGY_INSTALL_TARGET = YES
 
-SYNERGY_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) --prefix=/usr --sysconfdir=/etc
-
 SYNERGY_DEPENDENCIES = xserver_xorg-server
 
 $(eval $(call AUTOTARGETS,package,synergy))
-- 
1.6.3.3

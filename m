From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 29 Nov 2010 21:15:53 +0100
Subject: [Buildroot] [git commit master 1/1] sysstat: forcibly disable
	sensors to avoid build failures
Message-ID: <20101129201621.6C23F8D34B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e7fbeda8013d74ef9b179d67efd0ec2ac5d271d5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    3 ++-
 package/sysstat/sysstat.mk |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index bbf5048..fc15f3f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,8 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: libgcrypt, qt, tcpdump, xserver-xorg
+	Updated/fixed packages: libgcrypt, qt, sysstat, tcpdump,
+	xserver-xorg
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 4f2f663..c5fe5c9 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -7,8 +7,8 @@
 SYSSTAT_VERSION = 9.1.6
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.bz2
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard/
+SYSSTAT_CONF_OPT = --disable-man-group --disable-sensors
 
-SYSSTAT_CONF_OPT = --disable-man-group
 ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 SYSSTAT_CONF_OPT += --disable-documentation
 endif
-- 
1.7.2.2

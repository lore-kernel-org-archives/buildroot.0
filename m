From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 22 Dec 2010 23:47:28 +0100
Subject: [Buildroot] [git commit master 1/1] ed: bump to version 1.5
Message-ID: <20101222232249.DB1F38E20B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8960ecf5a2bef97eeac1ade21cc3987dfd22a461
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Bump to version 1.5

* Really configure right (or wrong depending on perspective) since we
  weren't building ed for the target it was completely broken.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ed/ed.mk |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 158667b..e7016bf 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -3,8 +3,10 @@
 # ed
 #
 #############################################################
-ED_VERSION:=1.1
-ED_SOURCE:=ed-$(ED_VERSION).tar.bz2
-ED_SITE:=$(BR2_GNU_MIRROR)/ed/
+
+ED_VERSION = 1.5
+ED_SITE = $(BR2_GNU_MIRROR)/ed
+ED_CONF_OPT = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)"
 
 $(eval $(call AUTOTARGETS,package,ed))
-- 
1.7.2.2

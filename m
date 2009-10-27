From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Oct 2009 21:52:32 +0100
Subject: [Buildroot] [git commit master] libart: get rid of superfluous
	configure args
Message-ID: <20091027205759.868157773A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=95d7c269156de54c245b2c43343e034c9eb479f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These are all provided by Makefile.autotools.in

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libart/libart.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/libart/libart.mk b/package/libart/libart.mk
index 690324c..47ff59e 100644
--- a/package/libart/libart.mk
+++ b/package/libart/libart.mk
@@ -11,8 +11,4 @@ LIBART_AUTORECONF = YES
 LIBART_STAGING = YES
 LIBART_TARGET = YES
 
-LIBART_CONF_OPT = --target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) --build=$(GNU_HOST_NAME) \
-		--prefix=/usr --sysconfdir=/etc
-
 $(eval $(call AUTOTARGETS,package,libart))
-- 
1.6.3.3

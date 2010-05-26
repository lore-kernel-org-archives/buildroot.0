From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 May 2010 00:49:29 +0200
Subject: [Buildroot] [git commit master] gob2: workaround configure
	misdetecting library needed for flex
Message-ID: <20100526225934.E088812DEF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2f9784f3961e98b54bda2e2f71cbb84f74f32075
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gob2/gob2.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gob2/gob2.mk b/package/gob2/gob2.mk
index 5d50ed6..04b3798 100644
--- a/package/gob2/gob2.mk
+++ b/package/gob2/gob2.mk
@@ -6,6 +6,7 @@
 GOB2_VERSION = 2.0.15
 GOB2_SOURCE = gob2-$(GOB2_VERSION).tar.gz
 GOB2_SITE = http://ftp.5z.com/pub/gob/
+IPERF_CONF_ENV = ac_cv_lib_lex=-lfl
 
 GOB2_DEPENDENCIES = libglib2 flex bison host-pkg-config host-flex
 
-- 
1.6.3.3

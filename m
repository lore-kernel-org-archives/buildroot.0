From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Nov 2010 14:22:16 +0100
Subject: [Buildroot] [git commit master 1/1] ntp: disable ntpsnmpd support
Message-ID: <20101104132338.60C438DAFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=382ade52a5275c1e84882afc46f2aa2e8259bc19
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Doesn't build.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ntp/ntp.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 7265083..51e3956 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -16,7 +16,8 @@ endif
 NTP_CONF_OPT = --with-shared \
 		--program-transform-name=s,,, \
 		--without-crypto \
-		--disable-tickadj
+		--disable-tickadj \
+		--without-ntpsnmpd
 
 define NTP_PATCH_FIXUPS
 	$(SED) "s,^#if.*__GLIBC__.*_BSD_SOURCE.*$$,#if 0," $(@D)/ntpd/refclock_pcf.c
-- 
1.7.1

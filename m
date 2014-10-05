From: Francois Perrad <fperrad@gmail.com>
Date: Sun,  5 Oct 2014 09:59:13 +0200
Subject: [Buildroot] [PATCH] perl: fix build on big endian arch
Message-ID: <1412495953-24980-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

see http://autobuild.buildroot.org/results/3a1/3a1c2f0bc802d3cec26ffd4ded8f5c04473a3d4b/build-end.log

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index f8e5173..97a3d34 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -58,6 +58,7 @@ PERL_CONF_OPT = \
 	-Dld="$(TARGET_CC_NOCCACHE)" \
 	-Dccflags="$(TARGET_CFLAGS)" \
 	-Dldflags="$(TARGET_LDFLAGS) -lm" \
+	-Dmultiarch \
 	-Dmydomain="" \
 	-Dmyhostname="$(BR2_TARGET_GENERIC_HOSTNAME)" \
 	-Dmyuname="Buildroot $(BR2_VERSION_FULL)" \
-- 
1.9.1

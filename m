From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 23:14:02 +0200
Subject: [Buildroot] [git commit] package/clamav: fix clamsubmit linking
Message-ID: <20191014210802.193A18E050@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ebf031102bf0345c74e712296291adcf41625c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested by Arnout in review of
https://patchwork.ozlabs.org/patch/1175732/, set OBJC to $(TARGET_CC)

Fixes:
 - http://autobuild.buildroot.org/results/49973b2283c65de5155deaf633cd6569a37af375

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/clamav/clamav.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 18aedd7591..5caab1e0f6 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -22,7 +22,8 @@ CLAMAV_DEPENDENCIES = \
 # mmap cannot be detected when cross-compiling, needed for mempool support
 CLAMAV_CONF_ENV = \
 	ac_cv_c_mmap_private=yes \
-	have_cv_ipv6=yes
+	have_cv_ipv6=yes \
+	OBJC=$(TARGET_CC)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 CLAMAV_LIBS += -latomic

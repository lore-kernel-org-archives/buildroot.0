From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 22:31:03 +0200
Subject: [Buildroot] [git commit] package/libtasn1: fix build with gcc 4.8
Message-ID: <20200427201620.3E42190972@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf3636af9bcea734c4428b0422a645d4c09698a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/0030c903abf6c964806a97067af94a99867a3896

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libtasn1/libtasn1.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index 9b8260ab48..d5a6c69965 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -17,4 +17,6 @@ LIBTASN1_AUTORECONF = YES
 # 'missing' fallback logic botched so disable it completely
 LIBTASN1_CONF_ENV = MAKEINFO="true"
 
+LIBTASN1_CONF_OPTS = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
+
 $(eval $(autotools-package))

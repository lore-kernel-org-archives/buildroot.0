From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 22:07:45 +0200
Subject: [Buildroot] [git commit] botan: disable documentation
Message-ID: <20181011200632.F273D8346E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9561504fe5d5bbfe2f2aecbfa8d24724a26a2cfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix following error if sphinx is found but its version is too low:
Sphinx version error:
This project needs at least Sphinx v1.2 and therefore cannot be built with this version.
Ignoring ImportError and using old theme
  ERROR: Error running sphinx-build -q -c ./src/configs/sphinx -b html ./doc/manual build/docs/manual

Fixes:
 - http://autobuild.buildroot.net/results/c15715a05a41035954f32510483314060ea31260

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/botan/botan.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 3de54aa3e1..7f0bbb66c9 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -17,7 +17,8 @@ BOTAN_CONF_OPTS = \
 	--os=linux \
 	--cc=gcc \
 	--cc-bin="$(TARGET_CXX)" \
-	--prefix=/usr
+	--prefix=/usr \
+	--without-documentation
 
 ifeq ($(BR2_SHARED_LIBS),y)
 BOTAN_CONF_OPTS += \

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 May 2017 15:35:08 +0200
Subject: [Buildroot] [git commit] poppler: bump version to 0.55.0
Message-ID: <20170601202852.A887D807D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a29a2612ee2313112736e54fa68bf6b291c07fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--enable-libjpeg option is now --enable-dctdecoder=libjpeg, and
--disable-libjpeg is now --enable-dctdecoder=none. See this upstream
commit:
  https://cgit.freedesktop.org/poppler/poppler/commit/?id=b286a6b5b1a63563263072305da04604cb022488

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/poppler/poppler.hash | 2 +-
 package/poppler/poppler.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/poppler/poppler.hash b/package/poppler/poppler.hash
index 4ef5799..699e705 100644
--- a/package/poppler/poppler.hash
+++ b/package/poppler/poppler.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 10cca9a67cc2e6f4f9024192b1067c444218bf94430891f43dc819d78536ca31  poppler-0.54.0.tar.xz
+sha256 537f2bc60d796525705ad9ca8e46899dcc99c2e9480b80051808bae265cdc658  poppler-0.55.0.tar.xz
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 056193c..5757100 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POPPLER_VERSION = 0.54.0
+POPPLER_VERSION = 0.55.0
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = http://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig host-pkgconf
@@ -46,10 +46,10 @@ POPPLER_CONF_OPTS += --disable-libtiff
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
-POPPLER_CONF_OPTS += --enable-libjpeg
+POPPLER_CONF_OPTS += --enable-dctdecoder=libjpeg
 POPPLER_DEPENDENCIES += jpeg
 else
-POPPLER_CONF_OPTS += --disable-libjpeg
+POPPLER_CONF_OPTS += --enable-dctdecoder=none
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)

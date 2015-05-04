From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 May 2015 19:11:09 +0200
Subject: [Buildroot] [git commit] sane-backends: unbreak on toolchains
	without threads support
Message-ID: <20150504171528.4FE6F81894@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0045808c1b271eef75e08fe02b4032f3f0e3dfc7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/f2a/f2a43b62aa2a720c538fc60c80c78c8ed5b04dea/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sane-backends/sane-backends.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index 4b29dda..3cb81a9 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -11,6 +11,9 @@ SANE_BACKENDS_LICENSE = GPLv2+
 SANE_BACKENDS_LICENSE_FILES = COPYING
 SANE_BACKENDS_INSTALL_STAGING = YES
 
+SANE_BACKENDS_CONF_OPTS = \
+	$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-pthread,--disable-pthread)
+
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 SANE_BACKENDS_DEPENDENCIES += libusb
 SANE_BACKENDS_CONF_OPTS += --enable-libusb_1_0

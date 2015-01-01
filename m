From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 16:49:54 +0100
Subject: [Buildroot] [git commit] sane-backends: install to staging
Message-ID: <20150101155022.6FA0780806@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8acf0600953f273c00ecba00535afdadcf477da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other packages might depend on sane, thus it should install its
development files.

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sane-backends/sane-backends.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index ab40993..f8c59e8 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -9,6 +9,7 @@ SANE_BACKENDS_SITE = http://sources.buildroot.net
 SANE_BACKENDS_CONFIG_SCRIPTS = sane-config
 SANE_BACKENDS_LICENSE = GPLv2+
 SANE_BACKENDS_LICENSE_FILES = COPYING
+SANE_BACKENDS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 SANE_BACKENDS_DEPENDENCIES += libusb

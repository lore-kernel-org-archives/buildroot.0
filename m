From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Dec 2013 00:06:58 +0100
Subject: [Buildroot] [git commit] gstreamer: fix xtensa configure
Message-ID: <20131230230705.EB8C69C2A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02b31c6556b504c327d58e38055844ab9cae9bb3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable unaligned access to avoid configure run test.

Fixes
http://autobuild.buildroot.net/results/a0c/a0cca019b0b2f33b6c2be17e5a44a807bbb4dac1/.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer/gstreamer/gstreamer.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gstreamer/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer/gstreamer.mk
index f7919ea..0667e38 100644
--- a/package/gstreamer/gstreamer/gstreamer.mk
+++ b/package/gstreamer/gstreamer/gstreamer.mk
@@ -12,7 +12,7 @@ GSTREAMER_INSTALL_STAGING = YES
 # Checking if unaligned memory access works correctly cannot be done when cross
 # compiling. For the following architectures there is no information available
 # in the configure script.
-ifeq ($(BR2_avr32),y)
+ifeq ($(BR2_avr32)$(BR2_xtensa),y)
 GSTREAMER_CONF_ENV = as_cv_unaligned_access=no
 endif
 ifeq ($(BR2_aarch64),y)

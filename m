From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Feb 2012 22:30:12 +0100
Subject: [Buildroot] [git commit branch/next] qt: fix build with gcc 4.6.x
	on arm
Message-ID: <20120226213202.86B4F90B88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=974a0da6e1bf73c5091d21f1e89e08974b078432
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As noted by Ismael Luceno. For details, see:
http://gcc.gnu.org/ml/gcc-patches/2010-11/msg02245.html

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 68f9348..776eb63 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -201,6 +201,11 @@ endif
 
 ifeq ($(BR2_arm)$(BR2_armeb),y)
 QT_EMB_PLATFORM = arm
+ifeq ($(BR2_GCC_VERSION_4_6_X),y)
+# workaround for gcc issue
+# http://gcc.gnu.org/ml/gcc-patches/2010-11/msg02245.html
+QT_CXXFLAGS += -fno-strict-volatile-bitfields
+endif
 else ifeq ($(BR2_avr32),y)
 QT_EMB_PLATFORM = avr32
 else ifeq ($(BR2_i386),y)

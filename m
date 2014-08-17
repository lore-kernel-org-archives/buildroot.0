From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Aug 2014 09:13:34 +0200
Subject: [Buildroot] [git commit] configs/{atngw100,
	atstk100x}: fix build of AVR32 defconfigs
Message-ID: <20140817072258.3E9BA9C769@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be7ac54e4bb4ca6eccc762b91289a80ad14118ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we marked the AVR32 architecture deprecated, it can no longer be
selected in a normal configuration. This has caused the AVR32
defconfigs to fail to build in our daily Jenkins tests. In order to
make them build again, they must use BR2_DEPRECATED=y. Of course, when
we remove AVR32 completely, we'll remove those defconfigs as well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/atngw100_defconfig  |    3 +++
 configs/atstk100x_defconfig |    3 +++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index cf727f9..d410f5b 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -1,3 +1,6 @@
+# AVR32 is deprecated
+BR2_DEPRECATED=y
+
 # Architecture
 BR2_avr32=y
 
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index 6a77b41..0e17e36 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -1,3 +1,6 @@
+# AVR32 is deprecated
+BR2_DEPRECATED=y
+
 # Architecture
 BR2_avr32=y
 

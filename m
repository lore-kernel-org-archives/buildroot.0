From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Jan 2015 21:28:51 +0100
Subject: [Buildroot] [git commit] package/openocd: disable aice programmer
	on non-MMU architecture
Message-ID: <20150103202901.3ABD27FF9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0eec7d8fecd3eeb5d43898dadc2bf54dce6758b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

aice sources use fork function, which is only available on architecture
with MMU.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openocd/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index 1f9889c..7c140c7 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -76,6 +76,7 @@ config BR2_PACKAGE_OPENOCD_OPENDOUS
 config BR2_PACKAGE_OPENOCD_AICE
 	bool "Andes JTAG Programmer"
 	select BR2_PACKAGE_LIBUSB
+	depends on BR2_USE_MMU # use fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	help
 	  Enable building support for the Andes JTAG

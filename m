From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 22:53:17 +0200
Subject: [Buildroot] [git commit] package/libdrm: radeon does not depend on
	x86
Message-ID: <20140417210125.16D239C845@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=661139f9180f256389fb8b5bab7b6dc94ae50a0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thomas reported that the libdrm-radeon dependency on x86 (32- or 64-bit)
dates back to the time where it also depended on libpciaccess.

Now that the libpciacess dependency has been dropped, Thomas managed to
build a libdrm-radeon on something else than an x86 (an ARM for example).

Make libdrm-radeon no longer depend on x86

As a side effect, this fixes some potential "unmet direct dependencies"
from the xdriver_xf86-video-ati package (which was the initial problem
I was trying to solve.)

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdrm/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 7192e94..72cf5f8 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -22,7 +22,6 @@ config BR2_PACKAGE_LIBDRM_INTEL
 
 config BR2_PACKAGE_LIBDRM_RADEON
 	bool "radeon"
-	depends on BR2_i386 || BR2_x86_64
 	help
 	  install AMD/ATI graphics driver
 

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Apr 2014 18:04:13 +0200
Subject: [Buildroot] [PATCH 01/14] package/libdrm: radeon does not depend on
	x86
In-Reply-To: <cover.1397750571.git.yann.morin.1998@free.fr>
References: <cover.1397750571.git.yann.morin.1998@free.fr>
Message-ID: <9692179bd203124bf18603d01d50e5b1c5472bb7.1397750571.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

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
---
 package/libdrm/Config.in | 1 -
 1 file changed, 1 deletion(-)

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
 
-- 
1.8.3.2

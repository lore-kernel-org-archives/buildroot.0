From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Jun 2014 23:52:04 +0200
Subject: [Buildroot] [PATCH 04/14] package/gpu-viv-bin-mx6q: only available
	for i.MX6Q
In-Reply-To: <cover.1404164261.git.yann.morin.1998@free.fr>
References: <cover.1404164261.git.yann.morin.1998@free.fr>
Message-ID: <caba0f441fb5a814ccd17759a45ae3ec9f4910ca.1404164261.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gary Bisson <bisson.gary@gmail.com>

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
[yann.morin.1998 at free.fr: split from the previous patch]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Hadrien Boutteville <hadrien.boutteville@gmail.com>

---
Gary, I took the liberty of adding your SoB line, since that change was
initially in a patch of yours with your SoB line. If you believe that's
not correct, please say so.
---
 package/freescale-imx/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index f87efcb..0626a74 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -44,6 +44,8 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
 
 source "package/freescale-imx/imx-lib/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
+if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
 source "package/freescale-imx/gpu-viv-bin-mx6q/Config.in"
+endif
 
 endif
-- 
1.9.1

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Mon, 19 Feb 2018 16:56:30 +0100
Subject: [Buildroot] [PATCH master 0/2] uboot: better fix for host-dtc
 influence
Message-ID: <20180219155632.30086-1-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While testing 2018.02-rc1 with a vendor-provided old U-boot tree, I came across
build errors in uboot. The attempted fix currently in Buildroot is not
sufficient.

In this series I provide an alternative fix, tested on the original failure
scenario as well, and then backout the previous fix.

Best regards,
Thomas


Thomas De Schampheleire (2):
  uboot: use local fdt headers
  Revert "uboot: use local libfdt.h"

 boot/uboot/uboot.mk | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

-- 
2.13.6

From: Robert J. Heywood <robert.heywood@codethink.co.uk>
Date: Tue, 29 Jan 2019 13:23:09 +0000
Subject: [Buildroot] [PATCH 8/8] board/raspberrypi: post-image --kernel
 option
In-Reply-To: <20190129132309.3455-1-robert.heywood@codethink.co.uk>
References: <20190129132309.3455-1-robert.heywood@codethink.co.uk>
Message-ID: <20190129132309.3455-9-robert.heywood@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an option to specify the kernel to boot.
This can be used to enable uboot on the pi.

Signed-off-by: Robert J. Heywood <robert.heywood@codethink.co.uk>
---
 board/raspberrypi/post-image.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index dbcaf3b1f8..71d9857f09 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -66,6 +66,9 @@ __EOF__
 		--skip-sdimg)
 		SEDCMD_SDIMG=" -e '/{SDIMG_START}/,/{SDIMG_END}/d' "
 		;;
+		--kernel=*)
+		sed -e "/^kernel=/s,=.*,=${arg:9}," -i "${BINARIES_DIR}/rpi-firmware/config.txt"
+		;;
 	esac
 
 done
-- 
2.11.0

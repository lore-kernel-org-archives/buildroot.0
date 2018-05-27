From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 May 2018 22:05:35 +0200
Subject: [Buildroot] [git commit branch/next] board: amarula: vyasa: Give
 raw space for falcon mode
Message-ID: <20180527200508.37F6D8287A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82d882eef0939ff98622dc8ec1ae724ae65befbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

RK3288 Vyasa board support falcon mode in U-Boot and SD layout start from
16MB offset for args and 17MB for uImage. So give full u-boot partition
space as 30M so-that it can occupy bigger uImage file and doesn't overlap
rootfs partition.

[Peter: use # as comment character, clarify comment wording]
Reported-by: Shyam Saini <shyam@amarulasolutions.com>
Tested-by: Shyam Saini <shyam@amarulasolutions.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Shyam saini <shyam@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/amarula/vyasa/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/amarula/vyasa/genimage.cfg b/board/amarula/vyasa/genimage.cfg
index fa41de3672..e7076679da 100644
--- a/board/amarula/vyasa/genimage.cfg
+++ b/board/amarula/vyasa/genimage.cfg
@@ -12,6 +12,7 @@ image sdcard.img {
 		in-partition-table = "no"
 		image = "u-boot-dtb.img"
 		offset = 8M
+		size = 30M # falcon mode: args @ 16M args, uImage @ 17M
 	}
 
 	partition rootfs {

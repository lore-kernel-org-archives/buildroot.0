From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 21:31:13 +0200
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: fix the
 target in systemd service
Message-ID: <20200907192557.AE22A86B2C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=698ba568589dc056eb184032290333b25ca16b38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

graphical is equivalent to the sysvinit runlevel 5
multi-user is equivalent to a runlevel between 2 and 4

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xserver_xorg-server/xorg.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/xorg.service b/package/x11r7/xserver_xorg-server/xorg.service
index 2745711cf3..553d8b2560 100644
--- a/package/x11r7/xserver_xorg-server/xorg.service
+++ b/package/x11r7/xserver_xorg-server/xorg.service
@@ -8,4 +8,4 @@ ExecStart=/usr/bin/Xorg :0.0 vt01 -s 0 -noreset -allowMouseOpenFail
 Restart=always
 
 [Install]
-WantedBy=multi-user.target
+WantedBy=graphical.target

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 15:54:27 +0200
Subject: [Buildroot] [git commit] rpi-userland: add Restart=always to
	vcfiled.service
Message-ID: <20150714135519.DF64C81D43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bc395dd0b5b2fd9852b937a4ee54b6d8caff6812
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested by Maxime Hadjinlian, add Restart=always to
vcfiled.service so that this service gets restarted if it ever exits
for some reason.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-userland/vcfiled.service |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/rpi-userland/vcfiled.service b/package/rpi-userland/vcfiled.service
index 2b8f1dc..b09aa62 100644
--- a/package/rpi-userland/vcfiled.service
+++ b/package/rpi-userland/vcfiled.service
@@ -3,6 +3,7 @@ Description=VideoCore file server daemon
 
 [Service]
 ExecStart=/usr/sbin/vcfiled --foreground
+Restart=always
 
 [Install]
 WantedBy=multi-user.target

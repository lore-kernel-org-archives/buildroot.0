From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Mar 2019 10:49:51 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/busybox:
 busybox.config: enable base64 applet
Message-ID: <20190328095003.E774F884A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13724665e97beb5d123137ce7060b9a950ad360d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

base64 reuses the uuencode logic, so only adds very little extra overhead,
is enabled by default upstream and is used more often than uuencode - So
enable it in the default busybox config.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 855a863ae9256045cf62edff9ddbfd33a3971891)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 38de13d4d9..1d9560d655 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -321,7 +321,7 @@ CONFIG_UNIQ=y
 CONFIG_UNLINK=y
 CONFIG_USLEEP=y
 CONFIG_UUDECODE=y
-# CONFIG_BASE64 is not set
+CONFIG_BASE64=y
 CONFIG_UUENCODE=y
 CONFIG_WC=y
 # CONFIG_FEATURE_WC_LARGE is not set

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 00:57:51 +0200
Subject: [Buildroot] [git commit] busybox: adjust configuration to add fancy
	options to the sleep applet
Message-ID: <20150710225757.094C481973@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa1362f220e733689fe4210b0bb2433f6d595e6b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set CONFIGURE_FEATURE_FANCY_SLEEP and CONFIG_FEATURE_FLOAT_SLEEP so that sleep accept floating point arguments.
This add 492 bytes to the busybox binary compiled for arm or 2748 bytes when compiled for i386.

Signed-off-by: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.config |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 9d930d1..8d1d80a 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -273,8 +273,8 @@ CONFIG_SHA256SUM=y
 CONFIG_SHA512SUM=y
 CONFIG_SHA3SUM=y
 CONFIG_SLEEP=y
-# CONFIG_FEATURE_FANCY_SLEEP is not set
-# CONFIG_FEATURE_FLOAT_SLEEP is not set
+CONFIG_FEATURE_FANCY_SLEEP=y
+CONFIG_FEATURE_FLOAT_SLEEP=y
 CONFIG_SORT=y
 CONFIG_FEATURE_SORT_BIG=y
 # CONFIG_SPLIT is not set

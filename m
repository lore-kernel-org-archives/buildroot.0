From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 2 Jan 2014 09:44:55 +0100
Subject: [Buildroot] [git commit] busybox 1.22.x: disable touch -h
Message-ID: <20140102084516.E41949C35C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c906a2e5c59f208c64a99485ffab3f8eb6348a09
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable the busybox touch --no-dereference since it requires lutimes
support and breaks old toolchains that don't support it (example:
avr32). Probably nobody cares that much since it's a new feature. Fixes:
http://autobuild.buildroot.net/results/9c2/9c29379719ae5cf5800c0dcb4cf514c5dc15d9b6/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox-1.22.x.config |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/busybox/busybox-1.22.x.config b/package/busybox/busybox-1.22.x.config
index 41761ba..e8db3bc 100644
--- a/package/busybox/busybox-1.22.x.config
+++ b/package/busybox/busybox-1.22.x.config
@@ -186,7 +186,7 @@ CONFIG_ID=y
 CONFIG_TEST=y
 CONFIG_FEATURE_TEST_64=y
 CONFIG_TOUCH=y
-CONFIG_FEATURE_TOUCH_NODEREF=y
+# CONFIG_FEATURE_TOUCH_NODEREF is not set
 CONFIG_FEATURE_TOUCH_SUSV3=y
 CONFIG_TR=y
 CONFIG_FEATURE_TR_CLASSES=y

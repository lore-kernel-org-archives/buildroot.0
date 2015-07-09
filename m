From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Thu,  9 Jul 2015 18:21:59 +0200
Subject: [Buildroot] [PATCH 5/7 v2] busybox: adjust configuration to add
	fancy options to the sleep applet
In-Reply-To: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>
References: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>
Message-ID: <1436458921-4199-6-git-send-email-sylvain.raybaud@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set CONFIGURE_FEATURE_FANCY_SLEEP and CONFIG_FEATURE_FLOAT_SLEEP so that sleep accept floating point arguments.
This add 492 bytes to the busybox binary compiled for arm or 2748 bytes when compiled for i386.

Signed-off-by: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
---
Changes v1 -> v2:
 - Add information about the impact on busybox binary size induced by patching busybox.config (suggested by Thomas Petazzoni)

 package/busybox/busybox.config | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.9.1

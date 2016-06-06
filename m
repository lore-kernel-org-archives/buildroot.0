From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Jun 2016 21:41:08 +0200
Subject: [Buildroot] [git commit] Config.in: add BR2_HOST_GCC_AT_LEAST_6
Message-ID: <20160606195009.0AA5D818FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d2175780d70a864836c75343fd969fba1109057
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Config.in b/Config.in
index 1dd2bb3..9fa7415 100644
--- a/Config.in
+++ b/Config.in
@@ -47,6 +47,11 @@ config BR2_HOST_GCC_AT_LEAST_5
 	default y if BR2_HOST_GCC_VERSION = "5"
 	select BR2_HOST_GCC_AT_LEAST_4_9
 
+config BR2_HOST_GCC_AT_LEAST_6
+	bool
+	default y if BR2_HOST_GCC_VERSION = "6"
+	select BR2_HOST_GCC_AT_LEAST_5
+
 # Hidden boolean selected by packages in need of Java in order to build
 # (example: xbmc)
 config BR2_NEEDS_HOST_JAVA

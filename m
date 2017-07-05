From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Jul 2017 16:49:58 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] Config.in: add
	BR2_HOST_GCC_AT_LEAST_7
Message-ID: <20170705144652.EED4E81932@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c0cab92767659c5c61235848ec73a5179fcf218
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 435b4cce0f054dc4f8549d1ab89e2b45039e015b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Config.in b/Config.in
index bd8f0d1..434935b 100644
--- a/Config.in
+++ b/Config.in
@@ -57,6 +57,11 @@ config BR2_HOST_GCC_AT_LEAST_6
 	default y if BR2_HOST_GCC_VERSION = "6"
 	select BR2_HOST_GCC_AT_LEAST_5
 
+config BR2_HOST_GCC_AT_LEAST_7
+	bool
+	default y if BR2_HOST_GCC_VERSION = "7"
+	select BR2_HOST_GCC_AT_LEAST_6
+
 # Hidden boolean selected by packages in need of Java in order to build
 # (example: xbmc)
 config BR2_NEEDS_HOST_JAVA

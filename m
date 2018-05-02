From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 May 2018 21:27:57 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] Config.in: add
 BR2_HOST_GCC_AT_LEAST_8
Message-ID: <20180502193044.CCD9D8B4BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d1ad92d4f6a059e61abe431c2f69d2d511abf22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fedora 28 switched to GCC 8.x.

Signed-off-by: Stefan Becker <chemobejk@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e13ab2e04a300f332d80f9b81c8830df07e3fd61)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Config.in b/Config.in
index 25f24b9d20..52fb53bc6a 100644
--- a/Config.in
+++ b/Config.in
@@ -62,6 +62,11 @@ config BR2_HOST_GCC_AT_LEAST_7
 	default y if BR2_HOST_GCC_VERSION = "7"
 	select BR2_HOST_GCC_AT_LEAST_6
 
+config BR2_HOST_GCC_AT_LEAST_8
+	bool
+	default y if BR2_HOST_GCC_VERSION = "8"
+	select BR2_HOST_GCC_AT_LEAST_7
+
 # Hidden boolean selected by packages in need of Java in order to build
 # (example: kodi)
 config BR2_NEEDS_HOST_JAVA

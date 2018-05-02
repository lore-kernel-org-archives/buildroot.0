From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 May 2018 14:50:14 +0200
Subject: [Buildroot] [git commit] Config.in: add BR2_HOST_GCC_AT_LEAST_8
Message-ID: <20180502125040.32F0C81265@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e13ab2e04a300f332d80f9b81c8830df07e3fd61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fedora 28 switched to GCC 8.x.

Signed-off-by: Stefan Becker <chemobejk@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Config.in b/Config.in
index 62d2dc3473..6b5b2b043c 100644
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

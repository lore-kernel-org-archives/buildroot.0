From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 14:55:27 +0100
Subject: [Buildroot] [git commit] Config.in: add symbols for
	BR2_HOST_GCC_AT_LEAST_4_6
Message-ID: <20160320135629.EEF56802E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8fce6d7c16ee844ec3e4484096c4fcc1cf297ff2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This option is needed to fix the Kodi build with older host gcc
versions.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Config.in b/Config.in
index dfb5721..b5cc892 100644
--- a/Config.in
+++ b/Config.in
@@ -23,9 +23,14 @@ config BR2_HOST_GCC_VERSION
 	string
 	option env="HOST_GCC_VERSION"
 
+config BR2_HOST_GCC_AT_LEAST_4_6
+	bool
+	default y if BR2_HOST_GCC_VERSION = "4 6"
+
 config BR2_HOST_GCC_AT_LEAST_4_7
 	bool
 	default y if BR2_HOST_GCC_VERSION = "4 7"
+	select BR2_HOST_GCC_AT_LEAST_4_6
 
 config BR2_HOST_GCC_AT_LEAST_4_8
 	bool

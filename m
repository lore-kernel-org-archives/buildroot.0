From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Apr 2014 00:46:27 +0200
Subject: [Buildroot] [git commit] external toolchain: add 3.14 choice for
	kernel headers
Message-ID: <20140406224914.EA2ED9C550@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11547ca648adaf85a0e72ad743e15c3f5b059e98
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 3990336..9499629 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -965,6 +965,10 @@ choice
 	    m = ( LINUX_VERSION_CODE >> 8  ) & 0xFF
 	    p = ( LINUX_VERSION_CODE >> 0  ) & 0xFF
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_14
+	bool "3.14.x"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_13
 	bool "3.13.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13

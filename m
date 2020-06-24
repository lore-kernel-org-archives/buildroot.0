From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jun 2020 21:57:43 +0200
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-custom: add gcc 10 version
 selection
Message-ID: <20200624195533.1743383FD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1bc9166ff3b4cee754daf382b6b160aaa31e8a2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch allows to use custom external toolchains based on gcc 10.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external/toolchain-external-custom/Config.in.options    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index a4430f7169..ee45e73292 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -31,6 +31,10 @@ choice
 	  Set to the gcc version that is used by your external
 	  toolchain.
 
+config BR2_TOOLCHAIN_EXTERNAL_GCC_10
+	bool "10.x"
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+
 config BR2_TOOLCHAIN_EXTERNAL_GCC_9
 	bool "9.x"
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9

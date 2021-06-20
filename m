From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 20 Jun 2021 18:59:28 +0200
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-custom: add gcc 11 version
 selection
Message-ID: <20210621055325.5B7428B70A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbaabbd42f9c632691ba78babb8f41084fa2e356
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch allows to use an external toolchain based on gcc 11.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../toolchain-external/toolchain-external-custom/Config.in.options    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index ba9aeb29ad..4a3345e4a5 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -31,6 +31,10 @@ choice
 	  Set to the gcc version that is used by your external
 	  toolchain.
 
+config BR2_TOOLCHAIN_EXTERNAL_GCC_11
+	bool "11.x"
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+
 config BR2_TOOLCHAIN_EXTERNAL_GCC_10
 	bool "10.x"
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10

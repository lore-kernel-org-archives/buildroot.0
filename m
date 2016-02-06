From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2016 11:16:00 +0100
Subject: [Buildroot] [git commit] docs/manual: document usage of
	BR2_TOOLCHAIN_HAS_SYNC_x
Message-ID: <20160206101651.5566E805BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=508c3e0c50c836f03b26cf08b96310e783830744
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit updates the documentation to detail when and how to use
the BR2_TOOLCHAIN_HAS_SYNC_x dependency. Note that we chose to not add
a comment about this dependency, because it is mainly tied to
architecture capabilities (except in very specific cases, which would
be way too complicated to explain in a Config.in comment).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-directory.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index b9596a2..aa9f4e8 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -279,6 +279,20 @@ use in the comment.
 ** Dependency symbol: +BR2_ARCH_HAS_ATOMICS+
 ** Comment string: no comment to be added
 
+* Gcc +__sync_*+ built-ins used for atomic operations. They are
+  available in variants operating on 1 byte, 2 bytes, 4 bytes and 8
+  bytes. Since different architectures support atomic operations on
+  different sizes, one dependency symbol is available for each size:
+** Dependency symbol: +BR2_TOOLCHAIN_HAS_SYNC_1+ for 1 byte,
+   +BR2_TOOLCHAIN_HAS_SYNC_2+ for 2 bytes,
+   +BR2_TOOLCHAIN_HAS_SYNC_4+ for 4 bytes, +BR2_TOOLCHAIN_HAS_SYNC_8+
+   for 8 bytes.
+** Comment string: no comment to be added
+
+* Gcc +__atomic_*+ built-ins used for atomic operations.
+** Dependency symbol: +BR2_TOOLCHAIN_HAS_ATOMIC+.
+** Comment string: no comment to be added
+
 * Kernel headers
 ** Dependency symbol: +BR2_TOOLCHAIN_HEADERS_AT_LEAST_X_Y+, (replace
    +X_Y+ with the proper version, see +toolchain/toolchain-common.in+)

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  2 Feb 2016 16:31:21 +0100
Subject: [Buildroot] [PATCH v3 03/18] docs/manual: document usage of
	BR2_TOOLCHAIN_HAS_SYNC_x
In-Reply-To: <1454427096-20967-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1454427096-20967-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1454427096-20967-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.6.4

From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Tue,  3 Nov 2020 12:29:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/libgit2: bump version to 1.1.0
Message-ID: <20201103112920.23345-1-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---

no security patches
tested with various test-pkg configurations on top of 105004f72, except
the riscv32 toolchain which never works:
>>> toolchain-external-bootlin 2020.08-1 Configuring
f951: Warning: Reading file ?<stdin>? as free form
RPC support not available in C library, please disable BR2_TOOLCHAIN_EXTERNAL_INET_RPC
make[1]: *** [package/pkg-generic.mk:240: /home/nc/br-test-pkg/br-riscv32/build/toolchain-external-bootlin-2020.08-1/.stamp_configured] Error 1

---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 1cb12ea035..367ade3afe 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  689f442c39c4117df515d1a0ffd7b401b91a500d7e2875ac45a440d86f198f5a  libgit2-1.0.1.tar.gz
+sha256  ad73f845965cfd528e70f654e428073121a3fa0dc23caac81a1b1300277d4dba  libgit2-1.1.0.tar.gz
 sha256  afc8bde99ba630012107c25d3c42dde628ec5f0cd3f428131f7e3a0f7d58ff42  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index d674f17c7f..30e6f24887 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.0.1
+LIBGIT2_VERSION = 1.1.0
 LIBGIT2_SITE = https://github.com/libgit2/libgit2/releases/download/v$(LIBGIT2_VERSION)
 LIBGIT2_LICENSE = GPL-2.0 with linking exception, MIT (sha1), wildmatch license (wildmatch)
 LIBGIT2_LICENSE_FILES = COPYING
-- 
2.28.0

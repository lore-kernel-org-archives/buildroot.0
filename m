From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jan 2021 19:41:35 +0100
Subject: [Buildroot] [git commit] package/libclc: switch to use the frozen,
 legacy mirror
Message-ID: <20210110205118.B8581870BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=971d1ea7acb44e60e79808bd30e0e50ef1bfc863
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The LLVM project has switched to using a monorepo to host all their
components. The separate, individual repositories have been closed
late 2020 / early 2021. The libclc repository is no longer.

Switch to using the libclc source from the llvm legacy and frozen
mirror.

Even though we could switch over to using the github helper, we just
keep using the git download method: it is a small repository, and it
will not impact people that were already using it.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Acked-by: Romain Naour <romain.naour@gmail.com>

---
Changes v1 -> v2:
  - keep everything as-is, just switch to the frozen mirror
---
 package/libclc/libclc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libclc/libclc.mk b/package/libclc/libclc.mk
index 630616905c..6fe8e10a77 100644
--- a/package/libclc/libclc.mk
+++ b/package/libclc/libclc.mk
@@ -6,7 +6,7 @@
 
 # Use the latest commit from release_90 branch.
 LIBCLC_VERSION = d1cbc92e2ceee59963f5c3a576382e5bba31f060
-LIBCLC_SITE = https://git.llvm.org/git/libclc
+LIBCLC_SITE = https://github.com/llvm-mirror/libclc
 LIBCLC_SITE_METHOD = git
 LIBCLC_LICENSE = Apache-2.0 with exceptions or MIT
 LIBCLC_LICENSE_FILES = LICENSE.TXT

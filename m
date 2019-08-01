From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 1 Aug 2019 10:23:24 +0200
Subject: [Buildroot] [git commit] toolchain-external: anchor sysroot regex
 with /
Message-ID: <20190801082103.48070814DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23c0e97b29afddff0a69dfc3406ad673e6a07cd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Anchor the regex in toolchain_find_sysroot macro with a / to avoid
unexpected substitution for Realtek mips toolchain, for which the libc.a
path ends with 'mips-linux-uclibc/lib/libc.a'.

Signed-off-by: ?????? ??? <shawn_chen@realsil.com.cn>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index baf719ad1f..e618aa7a09 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -331,7 +331,7 @@ endef
 #
 # And variations on these.
 define toolchain_find_sysroot
-$$(printf $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:(usr/)?lib(32|64)?([^/]*)?/([^/]*/)?libc\.a::')
+$$(printf $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:/(usr/)?lib(32|64)?([^/]*)?/([^/]*/)?libc\.a::')
 endef
 
 # Returns the lib subdirectory for the given compiler + flags (i.e

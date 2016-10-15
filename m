From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 13:22:16 +0200
Subject: [Buildroot] [git commit] MIPS: add default CPU ISAs
Message-ID: <20161015112247.4C4A981EB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6fae290a94d436d24fc19d27d1a70123baa07a86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Meant to be used by the target architecture variants.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.mips | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index fda1a1d..5e97fd0 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -1,3 +1,17 @@
+# mips default CPU ISAs
+config BR2_MIPS_CPU_MIPS32
+	bool
+config BR2_MIPS_CPU_MIPS32R2
+	bool
+config BR2_MIPS_CPU_MIPS32R6
+	bool
+config BR2_MIPS_CPU_MIPS64
+	bool
+config BR2_MIPS_CPU_MIPS64R2
+	bool
+config BR2_MIPS_CPU_MIPS64R6
+	bool
+
 choice
 	prompt "Target Architecture Variant"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el

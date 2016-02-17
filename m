From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2016 21:32:47 +0100
Subject: [Buildroot] [git commit] spice: arch-mask toolchain comment
Message-ID: <20160217203311.CB2FA81941@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c686eb407be5775d7eb0e942f377cd106896f69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise it shows up for other architectures with minimal toolchains
giving the impression that it's available/tested.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/spice/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/spice/Config.in b/package/spice/Config.in
index f1fcf69..bde3a92 100644
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -1,4 +1,5 @@
 comment "spice server needs a toolchain w/ wchar, threads"
+	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "spice server depends on python (for pyparsing)"

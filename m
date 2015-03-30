From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 23:30:28 +0200
Subject: [Buildroot] [git commit] arch/sparc: doesn't have atomics
Message-ID: <20150330213034.64D6081640@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7428ffe3375712871a83355b2752096f35992025
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cores older than v9 don't seem to have atomics so remove it.
Fixes a test build of pulseaudio for example.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.sparc |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/arch/Config.in.sparc b/arch/Config.in.sparc
index 4e502d5..cc10e8d 100644
--- a/arch/Config.in.sparc
+++ b/arch/Config.in.sparc
@@ -17,9 +17,6 @@ config BR2_ARCH
 config BR2_ENDIAN
 	default "BIG"
 
-config BR2_ARCH_HAS_ATOMICS
-	default y
-
 config BR2_GCC_TARGET_CPU
 	default "leon3"		if BR2_sparc_leon3
 	default "v8"		if BR2_sparc_v8

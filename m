From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Aug 2014 11:02:57 +0200
Subject: [Buildroot] [git commit] arch/powerpc: always has atomic ops
Message-ID: <20140818090640.680E59D4A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=84e8a337d546015f67fa8e4103261fc2938d4aba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.powerpc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index e444cb8..239f5dc 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -157,6 +157,9 @@ config BR2_ENDIAN
 	default "BIG"    if BR2_powerpc || BR2_powerpc64
 	default "LITTLE" if BR2_powerpc64le
 
+config BR2_ARCH_HAS_ATOMICS
+	default y
+
 config BR2_GCC_TARGET_TUNE
 	default "401"		if BR2_powerpc_401
 	default "403"		if BR2_powerpc_403

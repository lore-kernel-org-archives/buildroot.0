From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Aug 2014 11:03:16 +0200
Subject: [Buildroot] [git commit] arch/x86: all x86 but i386 has atomics
	operations
Message-ID: <20140818090640.78FAD9D4A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4f07578a868f426a8794abb775e0ac4c9e772cc0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.x86 |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 327aff0..9aa4ea2 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -202,6 +202,9 @@ config BR2_ARCH
 config BR2_ENDIAN
 	default "LITTLE"
 
+config BR2_ARCH_HAS_ATOMICS
+	default y if !BR2_x86_i386
+
 config BR2_GCC_TARGET_TUNE
 	default "i386"		if BR2_x86_i386
 	default "i486"		if BR2_x86_i486

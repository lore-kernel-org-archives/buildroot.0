From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Aug 2014 11:03:36 +0200
Subject: [Buildroot] [git commit] arch: remove no-longer default on atomics
	option
Message-ID: <20140818090640.8448F9D4A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a690fea1ace03643cbe7b6fb41438855a8a88444
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that all architectures explicitly select this option when it makes
sense, there is no need to have a default value.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 6bcafd4..1126d43 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -253,7 +253,6 @@ config BR2_GCC_TARGET_MODE
 # If the architecture has atomic operations, select this:
 config BR2_ARCH_HAS_ATOMICS
 	bool
-	default y if !BR2_arc
 
 # Set up target binary format
 choice

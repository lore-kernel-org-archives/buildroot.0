From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Aug 2014 11:03:02 +0200
Subject: [Buildroot] [git commit] arch/sh: always has atomic ops
Message-ID: <20140818090640.6DB7C9D4A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5d22b6e06c65a65de1c39a98b6a84a9eeb751936
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.sh |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.sh b/arch/Config.in.sh
index 1bdea37..9f8f79c 100644
--- a/arch/Config.in.sh
+++ b/arch/Config.in.sh
@@ -28,3 +28,6 @@ config BR2_ARCH
 config BR2_ENDIAN
 	default "LITTLE"	if BR2_sh4 || BR2_sh4a || BR2_sh64
 	default "BIG"		if BR2_sh2a || BR2_sh4eb || BR2_sh4aeb
+
+config BR2_ARCH_HAS_ATOMICS
+	default y

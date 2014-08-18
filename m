From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Aug 2014 11:02:41 +0200
Subject: [Buildroot] [git commit] arch/mips: always has atomic ops
Message-ID: <20140818090640.5C8DF9D4A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e99ab9bd7a7e20adaf21529e36a8955f8e1dbc0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.mips |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 20951e0..18138de 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -73,6 +73,9 @@ config BR2_ENDIAN
 	default "LITTLE"	if BR2_mipsel || BR2_mips64el
 	default "BIG" 	    	if BR2_mips || BR2_mips64
 
+config BR2_ARCH_HAS_ATOMICS
+	default y
+
 config BR2_GCC_TARGET_ARCH
 	default "mips1"		if BR2_mips_1
 	default "mips2"		if BR2_mips_2

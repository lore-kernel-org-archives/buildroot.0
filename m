From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Sep 2020 21:36:07 +0200
Subject: [Buildroot] [git commit] arch/Config.in.s390x: drop redundant
 depends on BR2_s390x
Message-ID: <20200930192603.8AE3A8E1CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d2f97aabd40566b045ef96bbe2042702ea5d1a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The whole arch/Config.in.s390x file is only included by arch/Config.in
if BR2_s390x=y, so having "depends on" conditions on each options of
the choice doesn't make much sense.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998 at free.fr: drop first, empty line]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in.s390x | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/Config.in.s390x b/arch/Config.in.s390x
index 1d3079c942..ad866b421e 100644
--- a/arch/Config.in.s390x
+++ b/arch/Config.in.s390x
@@ -1,4 +1,3 @@
-
 choice
 	prompt "Target Architecture Variant"
 	help
@@ -6,15 +5,12 @@ choice
 
 config BR2_s390x_z13
 	bool "z13"
-	depends on BR2_s390x
 
 config BR2_s390x_z14
 	bool "z14"
-	depends on BR2_s390x
 
 config BR2_s390x_z15
 	bool "z15"
-	depends on BR2_s390x
 
 endchoice
 

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 21:29:57 +0200
Subject: [Buildroot] [PATCH] arch/Config.in.s390x: drop redundant depends on
 BR2_s390x
Message-ID: <20200930192958.239834-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The whole arch/Config.in.s390x file is only included by arch/Config.in
if BR2_s390x=y, so having "depends on" conditions on each options of
the choice doesn't make much sense.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.s390x | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/Config.in.s390x b/arch/Config.in.s390x
index 1d3079c942..fa893608a5 100644
--- a/arch/Config.in.s390x
+++ b/arch/Config.in.s390x
@@ -6,15 +6,12 @@ choice
 
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
 
-- 
2.26.2

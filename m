From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Dec 2017 22:25:58 +0100
Subject: [Buildroot] [PATCH] gitlab-ci: add .config to artefacts
Message-ID: <20171218212558.22912-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a run-time test fails to build, it is interesting to get the
corresponding .config file directly as an artifact, rather than
reconstruct it manually from the various config snippets embedded
in the many runtime-test scripts.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 691669f7f1..32f6d7d224 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -61,6 +61,7 @@ check-package:
         expire_in: 2 weeks
         paths:
             - test-output/*.log
+            - test-output/*/.config
             - test-output/*/images/*
 acmesystems_aria_g25_128mb_defconfig: *defconfig
 acmesystems_aria_g25_256mb_defconfig: *defconfig
-- 
2.11.0

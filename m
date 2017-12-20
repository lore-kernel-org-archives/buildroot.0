From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 20 Dec 2017 15:19:33 +0100
Subject: [Buildroot] [PATCHv2] gitlab-ci: add .config to artefacts
Message-ID: <20171220141933.27736-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The defconfig is dumped at the very beginning of the build log, but the
resulting .config is still interesting to get, in case some settings did
not end up in there (e.g. because of the host gcc version, or because of
conflicting settings, or because the Config.in changed without the tests
being updated, or...).

So, add the .config to the list of artefacts to save.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2:
  - update .gitlab-ci.yml.in too  (Ricardo)
  - update commit log to refer to the defconfig  (Ricardo)
  - (s/artifact/artefact/, to use the english spelling, not the
    american one  (Ricardo ;-] )
---
 .gitlab-ci.yml    | 1 +
 .gitlab-ci.yml.in | 1 +
 2 files changed, 2 insertions(+)

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
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index 9a1e7a1e34..f763fdd454 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -61,4 +61,5 @@ check-package:
         expire_in: 2 weeks
         paths:
             - test-output/*.log
+            - test-output/*/.config
             - test-output/*/images/*
-- 
2.11.0

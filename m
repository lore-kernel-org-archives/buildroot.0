From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Dec 2017 22:36:07 +0100
Subject: [Buildroot] [git commit] gitlab-ci: add .config to artefacts
Message-ID: <20171230213612.9099A838A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2438d9058985324c8066d708f2ed32d94ec2dcf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Acked-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml    | 1 +
 .gitlab-ci.yml.in | 1 +
 2 files changed, 2 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c816979..ef2e3a4 100644
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
index 9a1e7a1..f763fdd 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -61,4 +61,5 @@ check-package:
         expire_in: 2 weeks
         paths:
             - test-output/*.log
+            - test-output/*/.config
             - test-output/*/images/*

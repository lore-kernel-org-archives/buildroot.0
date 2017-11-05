From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 5 Nov 2017 15:53:46 +0100
Subject: [Buildroot] [git commit] .gitlab-ci.yml: use gitlab 9.0 varaible
 names
Message-ID: <20171105145201.7E16481114@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e869e04be9c0c8b5ab42e7107c70c82c6896631
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gitlab 9.0 prefers "job" instead of "build" for CI variables names.
http://docs.gitlab.com/ce/ci/variables/README.html#9-0-renaming

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml    | 4 ++--
 .gitlab-ci.yml.in | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ebaac7a..0dddb22 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -8,7 +8,7 @@ image: buildroot/base
 
 .defconfig_script: &defconfig_script
     - echo 'Configure Buildroot'
-    - make ${CI_BUILD_NAME}
+    - make ${CI_JOB_NAME}
     - echo 'Build buildroot'
     - |
         make > >(tee build.log |grep '>>>') 2>&1 || {
@@ -51,7 +51,7 @@ check-DEVELOPERS:
     # runner will clean up those files for us.
     # Multiply every emulator timeout by 10 to avoid sporadic failures in
     # elastic runners.
-    script: ./support/testing/run-tests -o test-output/ -d test-dl/ -k --timeout-multiplier 10 ${CI_BUILD_NAME}
+    script: ./support/testing/run-tests -o test-output/ -d test-dl/ -k --timeout-multiplier 10 ${CI_JOB_NAME}
     artifacts:
         when: always
         expire_in: 2 weeks
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index 3abf7d5..33c7b13 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -8,7 +8,7 @@ image: buildroot/base
 
 .defconfig_script: &defconfig_script
     - echo 'Configure Buildroot'
-    - make ${CI_BUILD_NAME}
+    - make ${CI_JOB_NAME}
     - echo 'Build buildroot'
     - |
         make > >(tee build.log |grep '>>>') 2>&1 || {
@@ -51,7 +51,7 @@ check-DEVELOPERS:
     # runner will clean up those files for us.
     # Multiply every emulator timeout by 10 to avoid sporadic failures in
     # elastic runners.
-    script: ./support/testing/run-tests -o test-output/ -d test-dl/ -k --timeout-multiplier 10 ${CI_BUILD_NAME}
+    script: ./support/testing/run-tests -o test-output/ -d test-dl/ -k --timeout-multiplier 10 ${CI_JOB_NAME}
     artifacts:
         when: always
         expire_in: 2 weeks

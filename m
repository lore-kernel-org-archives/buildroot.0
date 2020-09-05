From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Sep 2020 22:04:40 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] .gitlab-ci.yml: use
 python3 for flake8 run
Message-ID: <20200905195637.9B51784762@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec766fc712aaa705608012d4f26077f93cfbb455
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab-ci.yml    | 2 +-
 .gitlab-ci.yml.in | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 60f54642fa..89604e6c47 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -28,7 +28,7 @@ check-flake8:
         - find * -type f -print0 | xargs -0 file | grep 'Python script' | cut -d':' -f1 >> files.txt
         - sort -u files.txt | tee files.processed
     script:
-        - python -m flake8 --statistics --count --max-line-length=132 $(cat files.processed)
+        - python3 -m flake8 --statistics --count --max-line-length=132 $(cat files.processed)
     after_script:
         - wc -l files.processed
 
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index 2d26f38011..b1d0dec203 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -28,7 +28,7 @@ check-flake8:
         - find * -type f -print0 | xargs -0 file | grep 'Python script' | cut -d':' -f1 >> files.txt
         - sort -u files.txt | tee files.processed
     script:
-        - python -m flake8 --statistics --count --max-line-length=132 $(cat files.processed)
+        - python3 -m flake8 --statistics --count --max-line-length=132 $(cat files.processed)
     after_script:
         - wc -l files.processed
 

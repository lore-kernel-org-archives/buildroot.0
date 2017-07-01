From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 1 Jul 2017 18:55:19 +0200
Subject: [Buildroot] [PATCH] .gitlab-ci.yml: update reference to
	support/scripts
Message-ID: <20170701165519.12438-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

getdeveloperlib has moved to utils/ so update .gitlab-ci.yml
accordingly.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml    | 2 +-
 .gitlab-ci.yml.in | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index cc048a0df6..7190b88126 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -36,7 +36,7 @@ check-gitlab-ci.yml:
 
 check-DEVELOPERS:
     script:
-        - PYTHONPATH=$PWD/support/scripts
+        - PYTHONPATH=$PWD/utils
                 python -c 'from getdeveloperlib import parse_developers; parse_developers()' |
                 grep . && exit 1
 
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index 0b6e634a4b..8f50f84582 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -36,7 +36,7 @@ check-gitlab-ci.yml:
 
 check-DEVELOPERS:
     script:
-        - PYTHONPATH=$PWD/support/scripts
+        - PYTHONPATH=$PWD/utils
                 python -c 'from getdeveloperlib import parse_developers; parse_developers()' |
                 grep . && exit 1
 
-- 
2.13.1

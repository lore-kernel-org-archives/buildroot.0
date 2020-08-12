From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Aug 2020 16:29:05 +0200
Subject: [Buildroot] [PATCH 7/7] support/misc/gitlab-ci.yml.in: use python3
 for flake8
In-Reply-To: <20200812142906.598755-1-thomas.petazzoni@bootlin.com>
References: <20200812142906.598755-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200812142906.598755-8-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The pkg-stats script now uses Python3 only constructs (the "async"
keyword) and therefore fails to pass the Python2 flake8 test.

Let's use the Python3 flake8 instead.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/681711009

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/misc/gitlab-ci.yml.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index 7218ea027e..75ffaab8fe 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -25,7 +25,7 @@ check-flake8:
         - find * -type f -print0 | xargs -0 file | grep 'Python script' | cut -d':' -f1 >> files.txt
         - sort -u files.txt | tee files.processed
     script:
-        - python -m flake8 --statistics --count --max-line-length=132 $(cat files.processed)
+        - python3 -m flake8 --statistics --count --max-line-length=132 $(cat files.processed)
     after_script:
         - wc -l files.processed
 
-- 
2.26.2

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 15 Sep 2020 21:38:32 +0200
Subject: [Buildroot] [PATCH] support/misc/gitlab-ci.yml.in: specify image to
 use
Message-ID: <20200915193832.291674-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 93a2870966 split off the generated gitlab-ci.yml into a child
pipeline. However, the generated gitlab-ci.yml file no longer had an
'image' tag. The result is that the jobs will use whatever image happens
to be configured on the runner - which leads to frequent pipeline
failures.

Fix this by explicitly specifying the image to use (the same one as in
top-level .gitlab-ci.yml).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/misc/gitlab-ci.yml.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index fcfff5c6aa..892eb9ed64 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -1,3 +1,5 @@
+image: buildroot/base:20200814.2228
+
 .check-DEVELOPERS_base:
     # get-developers should print just "No action specified"; if it prints
     # anything else, it's a parse error.
-- 
2.26.2

From: Alexander Dahl <post@lespocky.de>
Date: Wed, 18 Mar 2020 10:11:40 +0100
Subject: [Buildroot] [PATCH] package/monit: Fix URL in comment
Message-ID: <20200318091140.2344-1-post@lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Previous URL gives:

    % curl https://mmonit.com/monit/dist/monit-5.25.3.tar.gz.sha256
    c10258c8839d20864d30390e7cbf2ff5e0480a67a6fb80c02aa457d6e3390569 monit-5.25.3.tar.gz

Current URL is:

    % curl https://mmonit.com/monit/dist/monit-5.26.0.tar.gz.sha256
    87fc4568a3af9a2be89040efb169e3a2e47b262f99e78d5ddde99dd89f02f3c2 monit-5.26.0.tar.gz

This was probably just forgotten on the last version bump.

Fixes: ad250c3d1884 ("package/monit: bump to version 5.26.0")
Signed-off-by: Alexander Dahl <post@lespocky.de>
---
 package/monit/monit.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/monit/monit.hash b/package/monit/monit.hash
index 0de0d675aa..26d665c083 100644
--- a/package/monit/monit.hash
+++ b/package/monit/monit.hash
@@ -1,4 +1,4 @@
-# From https://mmonit.com/monit/dist/monit-5.25.3.tar.gz.sha256:
+# From https://mmonit.com/monit/dist/monit-5.26.0.tar.gz.sha256:
 sha256  87fc4568a3af9a2be89040efb169e3a2e47b262f99e78d5ddde99dd89f02f3c2  monit-5.26.0.tar.gz
 # Locally computed
 sha256  d5a4f52b1a5e1e7fe14e01a76aac8b08dc6bbea15466058f271456c97aac1ada  COPYING
-- 
2.11.0

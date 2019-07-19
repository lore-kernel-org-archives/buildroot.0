From: Victor Huesca <victor.huesca@bootlin.com>
Date: Fri, 19 Jul 2019 16:35:52 +0200
Subject: [Buildroot] [PATCH v2 1/5] support/scripts/pkg-stats: Use the
 'multiprocess' fork instead of 'multiprocessing'
In-Reply-To: <20190719143556.14907-1-victor.huesca@bootlin.com>
References: <20190719143556.14907-1-victor.huesca@bootlin.com>
Message-ID: <20190719143556.14907-2-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fork has a better serialization process whereas 'multiprocessing'
uses the half-broken pickle. This allow to use any kind of object for
process-pool related function. In particular this change allow
lambdas to be used as asynchronous function in 'Pool.apply_async'.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 7dcb2b4cbd..77819c4804 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -28,7 +28,7 @@ import json
 import certifi
 from urllib3 import HTTPSConnectionPool
 from urllib3.exceptions import HTTPError
-from multiprocessing import Pool
+from multiprocess import Pool
 
 INFRA_RE = re.compile(r"\$\(eval \$\(([a-z-]*)-package\)\)")
 URL_RE = re.compile(r"\s*https?://\S*\s*$")
-- 
2.21.0

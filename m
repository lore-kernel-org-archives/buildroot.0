From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  5 Jan 2020 10:23:28 +0100
Subject: [Buildroot] [PATCH v2 6/8] support/scripts/pkg-stats: add package
 count to stats
In-Reply-To: <20200105092329.6288-1-heiko.thiery@gmail.com>
References: <20200105092329.6288-1-heiko.thiery@gmail.com>
Message-ID: <20200105092329.6288-7-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 support/scripts/pkg-stats | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index ace092cf3b..8ec3204d9a 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -407,6 +407,7 @@ def check_package_latest_version(packages):
 
 def calculate_stats(packages):
     stats = defaultdict(int)
+    stats['packages'] = len(packages)
     for pkg in packages:
         # If packages have multiple infra, take the first one. For the
         # vast majority of packages, the target and host infra are the
-- 
2.20.1

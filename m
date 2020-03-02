From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon,  2 Mar 2020 15:50:08 +0100
Subject: [Buildroot] [PATCH v4 06/12] support/scripts/pkg-stats: add package
 count to stats
In-Reply-To: <20200302145013.9574-1-heiko.thiery@gmail.com>
References: <20200302145013.9574-1-heiko.thiery@gmail.com>
Message-ID: <20200302145013.9574-7-heiko.thiery@gmail.com>
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
index 47f7507540..2847cb82f3 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -549,6 +549,7 @@ def check_package_cves(nvd_path, packages):
 
 def calculate_stats(packages):
     stats = defaultdict(int)
+    stats['packages'] = len(packages)
     for pkg in packages:
         # If packages have multiple infra, take the first one. For the
         # vast majority of packages, the target and host infra are the
-- 
2.20.1

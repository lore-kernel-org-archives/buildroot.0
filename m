From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat,  7 Mar 2020 08:56:27 +0100
Subject: [Buildroot] [PATCH v5 06/12] support/scripts/pkg-stats: add package
 count to stats
In-Reply-To: <20200307075633.7514-1-heiko.thiery@gmail.com>
References: <20200307075633.7514-1-heiko.thiery@gmail.com>
Message-ID: <20200307075633.7514-7-heiko.thiery@gmail.com>
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
index 0d4bb13196..0e7d60bdbb 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -552,6 +552,7 @@ def check_package_cves(nvd_path, packages):
 
 def calculate_stats(packages):
     stats = defaultdict(int)
+    stats['packages'] = len(packages)
     for pkg in packages:
         # If packages have multiple infra, take the first one. For the
         # vast majority of packages, the target and host infra are the
-- 
2.20.1

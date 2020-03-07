From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 21:36:45 +0100
Subject: [Buildroot] [git commit branch/next] support/scripts/pkg-stats: add
 package count to stats
Message-ID: <20200307204504.EA4F38FC5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e267518cbd13747726fd946f6430e4bdcb1c121
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 17:41:59 +0200
Subject: [Buildroot] [git commit branch/2020.02.x]
 support/scripts/pkg-stats: add package count to stats
Message-ID: <20200828155253.B3DC386539@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a8dd28bc5d7d0ef5d232fbedbdb06ae35499313
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0e267518cbd13747726fd946f6430e4bdcb1c121)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 23:17:02 +0200
Subject: [Buildroot] [git commit] package/perf: if libunwind is enabled,
	depend on it
Message-ID: <20150714213615.4DEB281D5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=71e5ff61eeab0ba7cdeb2eae9fa566110d7ed212
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
[Romain:
  - fix coding style]
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perf/perf.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/perf/perf.mk b/package/perf/perf.mk
index 9fdce95..42fbe24 100644
--- a/package/perf/perf.mk
+++ b/package/perf/perf.mk
@@ -36,6 +36,10 @@ ifeq ($(BR2_PACKAGE_SLANG),y)
 PERF_DEPENDENCIES += slang
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
+PERF_DEPENDENCIES += libunwind
+endif
+
 ifeq ($(BR2_PACKAGE_NUMACTL),y)
 PERF_DEPENDENCIES += numactl
 endif

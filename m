From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 23:16:44 +0200
Subject: [Buildroot] [git commit] package/perf: if slang is enabled,
	depend on it
Message-ID: <20150714213615.3E7CC81938@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=15f2cc5f81ea4ee9e6e219426d469f50d49b98d5
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
index 36989fc..dee05c3 100644
--- a/package/perf/perf.mk
+++ b/package/perf/perf.mk
@@ -32,6 +32,10 @@ ifeq ($(BR2_arc),y)
 PERF_MAKE_FLAGS += NO_BACKTRACE=1
 endif
 
+ifeq ($(BR2_PACKAGE_SLANG),y)
+PERF_DEPENDENCIES += slang
+endif
+
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 PERF_DEPENDENCIES += elfutils
 else

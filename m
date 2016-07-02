From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 Jul 2016 12:00:24 +0200
Subject: [Buildroot] [git commit] reproducibility: introduce config knob
Message-ID: <20160702100057.6BD7D81843@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71574a65e80d04db193432a7525eb49f1acdf614
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Making the builds reproducible involves turning off build timestamps,
which some users may find annoying. So make the reproducible builds
optional.

Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Config.in b/Config.in
index 820b1f0..bbe2bc3 100644
--- a/Config.in
+++ b/Config.in
@@ -728,6 +728,17 @@ config BR2_COMPILER_PARANOID_UNSAFE_PATH
 
 endmenu
 
+config BR2_REPRODUCIBLE
+	bool "Make the build reproducible (experimental)"
+        help
+          This option will remove all sources of non-reproducibility
+          from the build process. For a given Buildroot configuration,
+          this allows to generate exactly identical binaries from one
+          build to the other, including on different machines.
+
+          This is labeled as an experimental feature, as not all
+          packages behave properly to ensure reproducibility.
+
 endmenu
 
 source "toolchain/Config.in"

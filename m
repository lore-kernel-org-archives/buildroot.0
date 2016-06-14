From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Tue, 14 Jun 2016 17:31:09 +0200
Subject: [Buildroot] [PATCH 01/12] reproducibility: introduce config knob
In-Reply-To: <20160614152928.GH3060@hermes.click-hack.org>
References: <20160614152928.GH3060@hermes.click-hack.org>
Message-ID: <1465918277-30675-1-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Making the builds reproducible involves turning off build timestamps,
which some users may find annoying. So make the reproducible builds
optional.

Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
---
 Config.in | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Config.in b/Config.in
index 9fa7415..faf4c71 100644
--- a/Config.in
+++ b/Config.in
@@ -724,6 +724,17 @@ config BR2_COMPILER_PARANOID_UNSAFE_PATH
 
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
-- 
2.8.2

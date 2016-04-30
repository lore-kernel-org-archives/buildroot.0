From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:48:57 +0200
Subject: [Buildroot] [PATCH 01/34] reproducibility: introduce config knob
In-Reply-To: <20160430074358.GE1781@hermes.click-hack.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
Message-ID: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Making the builds reproducible involves turning off build timestamps,
which some users may find annoying. So make the reproducible builds
optional.
---
 Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Config.in b/Config.in
index d795361..3cdd659 100644
--- a/Config.in
+++ b/Config.in
@@ -623,6 +623,9 @@ config BR2_COMPILER_PARANOID_UNSAFE_PATH
 
 endmenu
 
+config BR2_REPRODUCIBLE
+	bool "Try and remove all sources of non-reproducibility from the build"
+
 endmenu
 
 source "toolchain/Config.in"
-- 
2.7.4

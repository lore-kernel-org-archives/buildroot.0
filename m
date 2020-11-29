From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Nov 2020 22:20:13 +0100
Subject: [Buildroot] [git commit] package/jemalloc: add jemalloc-config to
 _CONFIG_SCRIPTS handling
Message-ID: <20201129210736.C9A3B81466@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=288ece60bbe182a2192d5553ba15cbdeedea3ba6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes (part of) http://autobuild.buildroot.net/results/23fe4365ca65f37eace8265a70fbfb9723b8ee9d/

jemalloc installs a jemalloc-config script, leaking build paths and breaking
reproducible builds (and per-package builds).

Add it to _CONFIG_SCRIPTS so the paths get fixed up for staging and the
script removed from target.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jemalloc/jemalloc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jemalloc/jemalloc.mk b/package/jemalloc/jemalloc.mk
index aedc1f04bf..e43a4f7906 100644
--- a/package/jemalloc/jemalloc.mk
+++ b/package/jemalloc/jemalloc.mk
@@ -10,6 +10,7 @@ JEMALLOC_SITE = https://github.com/jemalloc/jemalloc/releases/download/$(JEMALLO
 JEMALLOC_LICENSE = BSD-2-Clause
 JEMALLOC_LICENSE_FILES = COPYING
 JEMALLOC_INSTALL_STAGING = YES
+JEMALLOC_CONFIG_SCRIPTS = jemalloc-config
 
 # gcc bug internal compiler error: in merge_overlapping_regs, at
 # regrename.c:304. This bug is fixed since gcc 6.

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Jul 2017 16:31:02 +0200
Subject: [Buildroot] [PATCH 2/7 v4] tools: move get-developers out of
	support/scripts/
In-Reply-To: <cover.1498919458.git.yann.morin.1998@free.fr>
References: <cover.1498919458.git.yann.morin.1998@free.fr>
Message-ID: <a2dfcf2f0603067fdb9feb28f7b240e10f49a933.1498919458.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move it to the top-level tools/ directory, so that it is easier to
find for users.

Add a legacy symlink for those users who already used them, so as
not to break their habits.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v3 -> v4:
  - drop legacy symlink  (Arnout, Thomas)
---
 docs/manual/contribute.txt                    | 2 +-
 {support/scripts => tools}/get-developers     | 0
 {support/scripts => tools}/getdeveloperlib.py | 0
 tools/readme.txt                              | 5 +++++
 4 files changed, 6 insertions(+), 1 deletion(-)
 rename {support/scripts => tools}/get-developers (100%)
 rename {support/scripts => tools}/getdeveloperlib.py (100%)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 719032bcc4..c10587726c 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -295,7 +295,7 @@ information). This tool reads your patches and outputs the appropriate
 +git send-email+ command to use:
 
 ---------------------
-$ ./support/scripts/get-developers outgoing/*
+$ ./tools/get-developers outgoing/*
 ---------------------
 
 Use the output of +get-developers+ to send your patches:
diff --git a/support/scripts/get-developers b/tools/get-developers
similarity index 100%
rename from support/scripts/get-developers
rename to tools/get-developers
diff --git a/support/scripts/getdeveloperlib.py b/tools/getdeveloperlib.py
similarity index 100%
rename from support/scripts/getdeveloperlib.py
rename to tools/getdeveloperlib.py
diff --git a/tools/readme.txt b/tools/readme.txt
index 5b418dd41f..1439a0a99f 100644
--- a/tools/readme.txt
+++ b/tools/readme.txt
@@ -2,6 +2,11 @@ This directory contains various useful scripts and tools for working
 with Buildroot. You need not add this directory in your PATH to use
 any of those tools, but you may do so if you want.
 
+get-developpers
+    a script to return the list of people interested in a specific part
+    of Buildroot, so they can be Cc:ed on a mail. Accepts a patch as
+    input, a package name or and architecture name.
+
 test-pkg
     a script that tests a specific package against a set of various
     toolchains, with the goal to detect toolchain-related dependencies
-- 
2.11.0

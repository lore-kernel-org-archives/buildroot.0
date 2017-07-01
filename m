From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 17:53:04 +0200
Subject: [Buildroot] [git commit] tools: move get-developers out of
	support/scripts/
Message-ID: <20170701160502.CC61E7F9C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27b7bd6ad04b34b9bbcce5fb9e29677bc2afc606
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move it to the top-level tools/ directory, so that it is easier to
find for users.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/contribute.txt                    | 2 +-
 {support/scripts => tools}/get-developers     | 0
 {support/scripts => tools}/getdeveloperlib.py | 0
 tools/readme.txt                              | 5 +++++
 4 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 719032b..c105877 100644
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
index 5b418dd..1439a0a 100644
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

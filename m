From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Jul 2017 16:31:04 +0200
Subject: [Buildroot] [PATCH 4/7 v4] tools: move size-stat-compare out of
	support/scripts/
In-Reply-To: <cover.1498919458.git.yann.morin.1998@free.fr>
References: <cover.1498919458.git.yann.morin.1998@free.fr>
Message-ID: <1f7606d932bd480bca466181658e656f93c4fe9e.1498919458.git.yann.morin.1998@free.fr>
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
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v3 -> v4:
  - drop legacy symlink  (Arnout, Thomas)
---
 tools/readme.txt                              | 6 ++++++
 {support/scripts => tools}/size-stats-compare | 0
 2 files changed, 6 insertions(+)
 rename {support/scripts => tools}/size-stats-compare (100%)

diff --git a/tools/readme.txt b/tools/readme.txt
index fc1108fded..dd8a1d4494 100644
--- a/tools/readme.txt
+++ b/tools/readme.txt
@@ -11,6 +11,12 @@ get-developpers
     of Buildroot, so they can be Cc:ed on a mail. Accepts a patch as
     input, a package name or and architecture name.
 
+size-stat-compare
+    a script to compare the rootfs size between two differnt Buildroot
+    configurations. This can be used to identify the size impact of
+    a specific option, or of a set of specific options, or an update
+    to a newer Buildroot version...
+
 test-pkg
     a script that tests a specific package against a set of various
     toolchains, with the goal to detect toolchain-related dependencies
diff --git a/support/scripts/size-stats-compare b/tools/size-stats-compare
similarity index 100%
rename from support/scripts/size-stats-compare
rename to tools/size-stats-compare
-- 
2.11.0

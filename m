From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Jul 2017 16:31:05 +0200
Subject: [Buildroot] [PATCH 5/7 v4] tools: move scancpan out of
	support/scripts/
In-Reply-To: <cover.1498919458.git.yann.morin.1998@free.fr>
References: <cover.1498919458.git.yann.morin.1998@free.fr>
Message-ID: <4faaff199d7c7459cb03636bbfe8c41f272d0169.1498919458.git.yann.morin.1998@free.fr>
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
Cc: "Fran?ois Perrad" <francois.perrad@gadz.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v3 -> v4:
  - drop legacy symlink  (Arnout, Thomas)
---
 tools/readme.txt                    | 4 ++++
 {support/scripts => tools}/scancpan | 0
 2 files changed, 4 insertions(+)
 rename {support/scripts => tools}/scancpan (100%)

diff --git a/tools/readme.txt b/tools/readme.txt
index dd8a1d4494..20581740cb 100644
--- a/tools/readme.txt
+++ b/tools/readme.txt
@@ -11,6 +11,10 @@ get-developpers
     of Buildroot, so they can be Cc:ed on a mail. Accepts a patch as
     input, a package name or and architecture name.
 
+scancpan
+    a script to create a Buildroot package by scanning a CPAN module
+    description.
+
 size-stat-compare
     a script to compare the rootfs size between two differnt Buildroot
     configurations. This can be used to identify the size impact of
diff --git a/support/scripts/scancpan b/tools/scancpan
similarity index 100%
rename from support/scripts/scancpan
rename to tools/scancpan
-- 
2.11.0

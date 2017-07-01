From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Jul 2017 16:31:06 +0200
Subject: [Buildroot] [PATCH 6/7 v4] tools: move scanpypi out of
	support/scripts/
In-Reply-To: <cover.1498919458.git.yann.morin.1998@free.fr>
References: <cover.1498919458.git.yann.morin.1998@free.fr>
Message-ID: <50b7f8458ed1f6d8a28f64402999018c97a5a1be.1498919458.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move it to the top-level tools/ directory, so that it is easier to
find for users.

Add a legacy symlink for those users who already used them, so  as
not to break their habits.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v3 -> v4:
  - drop legacy symlink  (Arnout, Thomas)
---
 tools/readme.txt                    | 4 ++++
 {support/scripts => tools}/scanpypi | 0
 2 files changed, 4 insertions(+)
 rename {support/scripts => tools}/scanpypi (100%)

diff --git a/tools/readme.txt b/tools/readme.txt
index 20581740cb..94843332c9 100644
--- a/tools/readme.txt
+++ b/tools/readme.txt
@@ -15,6 +15,10 @@ scancpan
     a script to create a Buildroot package by scanning a CPAN module
     description.
 
+scanpypi
+    a script to create a Buildroot package by scanning a PyPI package
+    description.
+
 size-stat-compare
     a script to compare the rootfs size between two differnt Buildroot
     configurations. This can be used to identify the size impact of
diff --git a/support/scripts/scanpypi b/tools/scanpypi
similarity index 100%
rename from support/scripts/scanpypi
rename to tools/scanpypi
-- 
2.11.0

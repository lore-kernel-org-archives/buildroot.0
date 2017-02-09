From: Adam Duskett <aduskett@gmail.com>
Date: Wed,  8 Feb 2017 19:07:10 -0500
Subject: [Buildroot] [PATCH 1/1] automake: fix unescaped left brace warning
	patch.
Message-ID: <20170209000710.13754-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Automake currently has a unescaped left brace in it's automake.in folder
that generates the warning:
Unescaped left brace in regex is deprecated, passed through in regex;
This patch fixes this warning.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 .../0002-fix-unescaped-left-brace-warning.patch       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/automake/0002-fix-unescaped-left-brace-warning.patch

diff --git a/package/automake/0002-fix-unescaped-left-brace-warning.patch b/package/automake/0002-fix-unescaped-left-brace-warning.patch
new file mode 100644
index 0000000..a33b1f1
--- /dev/null
+++ b/package/automake/0002-fix-unescaped-left-brace-warning.patch
@@ -0,0 +1,19 @@
+Automake currently has a unescaped left brace in it's automake.in folder
+that generates the warning:
+Unescaped left brace in regex is deprecated, passed through in regex;
+This patch fixes this warning.
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+
+diff -Naur a/bin/automake.in b/bin/automake.in
+--- a/bin/automake.in	2015-01-05 14:25:55.000000000 -0500
++++ b/bin/automake.in	2017-02-08 18:59:24.963611569 -0500
+@@ -3878,7 +3878,7 @@
+ sub substitute_ac_subst_variables
+ {
+   my ($text) = @_;
+-  $text =~ s/\${([^ \t=:+{}]+)}/substitute_ac_subst_variables_worker ($1)/ge;
++  $text =~ s/\$\{([^ \t=:+{}]+)\}/substitute_ac_subst_variables_worker ($1)/ge;
+   return $text;
+ }
+
-- 
2.9.3

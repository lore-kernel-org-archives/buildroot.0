From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  1 Sep 2012 09:25:25 +0200
Subject: [Buildroot] [PATCH 07/14] microperl: install more modules by default
In-Reply-To: <1346484332-31433-1-git-send-email-francois.perrad@gadz.org>
References: <1346484332-31433-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1346484332-31433-7-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/microperl/microperl.mk |   45 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index 4b68567..c0f6029 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -31,9 +31,52 @@ endif
 MICROPERL_ARCH_MODS = Config.pm Config_git.pl Config_heavy.pl
 MICROPERL_BASE_MODS = strict.pm vars.pm warnings.pm warnings/register.pm
 
+# other pragma modules (from lib/)
+MICROPERL_BASE_MODS += \
+  bytes.pm \
+  deprecate.pm \
+  feature.pm \
+  integer.pm \
+  less.pm \
+  locale.pm \
+  overloading.pm \
+  overload.pm \
+  sigtrap.pm \
+  sort.pm \
+  subs.pm \
+  utf8.pm utf8_heavy.pl \
+  version.pm
+
+# some common modules (from lib/)
+MICROPERL_BASE_MODS += \
+  Benchmark.pm \
+  Carp.pm \
+  Class/Struct.pm \
+  Exporter.pm Exporter/Heavy.pm \
+  File/Basename.pm \
+  File/Compare.pm \
+  Getopt/Std.pm \
+  Tie/Array.pm \
+  Tie/Hash.pm \
+  Tie/Scalar.pm \
+  UNIVERSAL.pm
+
+# other common modules (from dist/)
+MICROPERL_MODS += \
+  Dumpvalue.pm \
+  Env.pm \
+  autouse.pm \
+  base.pm \
+  constant.pm
+
+# other common modules (from cpan/)
+MICROPERL_MODS += \
+  Getopt/Long.pm \
+  parent.pm
+
 # CGI bundle
 ifeq ($(BR2_PACKAGE_MICROPERL_BUNDLE_CGI),y)
-MICROPERL_MODS += constant.pm CGI CGI.pm Carp.pm Exporter.pm overload.pm
+MICROPERL_MODS += CGI CGI.pm
 endif
 
 # Host microperl is actually full-blown perl
-- 
1.7.9.5

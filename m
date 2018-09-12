From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 22:47:31 +0200
Subject: [Buildroot] [git commit] perl-sys-cpu: new package
Message-ID: <20180912204945.BF740873DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39bdf3bdbbe3ed2db51ec08daeddb2485aa2859d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/perl-sys-cpu/Config.in         |  5 +++++
 package/perl-sys-cpu/perl-sys-cpu.hash |  2 ++
 package/perl-sys-cpu/perl-sys-cpu.mk   | 13 +++++++++++++
 5 files changed, 22 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6db07e1ada..e454149002 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -506,6 +506,7 @@ F:	package/perl-module-runtime/
 F:	package/perl-number-bytes-human/
 F:	package/perl-params-util/
 F:	package/perl-sub-install/
+F:	package/perl-sys-cpu/
 F:	package/perl-sys-meminfo/
 F:	package/perl-sys-mmap/
 F:	package/perl-time-parsedate/
diff --git a/package/Config.in b/package/Config.in
index bae9ed02b3..3faffca271 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -729,6 +729,7 @@ menu "Perl libraries/modules"
 	source "package/perl-params-util/Config.in"
 	source "package/perl-path-tiny/Config.in"
 	source "package/perl-sub-install/Config.in"
+	source "package/perl-sys-cpu/Config.in"
 	source "package/perl-sys-meminfo/Config.in"
 	source "package/perl-sys-mmap/Config.in"
 	source "package/perl-time-hires/Config.in"
diff --git a/package/perl-sys-cpu/Config.in b/package/perl-sys-cpu/Config.in
new file mode 100644
index 0000000000..d5fff5b849
--- /dev/null
+++ b/package/perl-sys-cpu/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_PERL_SYS_CPU
+	bool "perl-sys-cpu"
+	help
+	  perl-sys-cpu
+
diff --git a/package/perl-sys-cpu/perl-sys-cpu.hash b/package/perl-sys-cpu/perl-sys-cpu.hash
new file mode 100644
index 0000000000..0977606b1a
--- /dev/null
+++ b/package/perl-sys-cpu/perl-sys-cpu.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256 ca0ec47ab24070e3040e5075337cfc69721362d9bef50f6992072efe644d4d26  Sys-CPU-0.52.tar.gz
diff --git a/package/perl-sys-cpu/perl-sys-cpu.mk b/package/perl-sys-cpu/perl-sys-cpu.mk
new file mode 100644
index 0000000000..8402bef8fd
--- /dev/null
+++ b/package/perl-sys-cpu/perl-sys-cpu.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-sys-cpu
+#
+################################################################################
+
+PERL_SYS_CPU_VERSION = 0.52
+PERL_SYS_CPU_SOURCE = Sys-CPU-$(PERL_SYS_CPU_VERSION).tar.gz
+PERL_SYS_CPU_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MK/MKODERER
+PERL_SYS_CPU_LICENSE = Artistic or GPL-1.0+
+PERL_SYS_CPU_LICENSE_FILES = README
+
+$(eval $(perl-package))

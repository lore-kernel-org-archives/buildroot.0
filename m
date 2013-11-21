From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 21 Nov 2013 13:35:09 +0100
Subject: [Buildroot] [pkg-perl infra V2 02/12] cpan: a home for Perl modules
In-Reply-To: <1385037319-2456-1-git-send-email-francois.perrad@gadz.org>
References: <1385037319-2456-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1385037319-2456-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 Config.in            |    7 +++++++
 package/Config.in    |    1 +
 package/cpan/cpan.mk |    1 +
 3 files changed, 9 insertions(+)
 create mode 100644 package/cpan/Config.in
 create mode 100644 package/cpan/cpan.mk

diff --git a/Config.in b/Config.in
index d87e0f0..1b4bf99 100644
--- a/Config.in
+++ b/Config.in
@@ -207,6 +207,13 @@ config BR2_DEBIAN_MIRROR
 
 endif
 
+config BR2_CPAN_MIRROR
+	string "CPAN mirror"
+	default "http://search.cpan.org/CPAN"
+	help
+	  CPAN has multiple software mirrors scattered around the world.
+	  The following allows you to select your preferred mirror.
+
 endmenu
 
 config BR2_JLEVEL
diff --git a/package/Config.in b/package/Config.in
index 311cc6c..3f7bb3e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -382,6 +382,7 @@ source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
 source "package/cpanminus/Config.in"
+source "package/cpan/Config.in"
 endmenu
 endif
 source "package/php/Config.in"
diff --git a/package/cpan/Config.in b/package/cpan/Config.in
new file mode 100644
index 0000000..e69de29
diff --git a/package/cpan/cpan.mk b/package/cpan/cpan.mk
new file mode 100644
index 0000000..764a156
--- /dev/null
+++ b/package/cpan/cpan.mk
@@ -0,0 +1 @@
+include package/cpan/*/*.mk
-- 
1.7.9.5

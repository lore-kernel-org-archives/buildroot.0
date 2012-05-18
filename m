From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Fri, 18 May 2012 22:47:01 +0200
Subject: [Buildroot] [PATCH] apply-patches.sh: add documentation
Message-ID: <1337374021-26978-1-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ludovic Desroches <ludovic.desroches@gmail.com>

Signed-off-by: Ludovic Desroches <ludovic.desroches@gmail.com>
---
Hi,

Sorry for the delay, but as promised, some comments about the changes done to
apply-patches.sh.

Regards

 support/scripts/apply-patches.sh |   23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index f82be86..7a6c1fa 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -4,6 +4,29 @@
 # -Erik
 #
 # (c) 2002 Erik Andersen <andersen@codepoet.org>
+#
+# Parameters:
+# - the build directory, optional, default value is '.'. The place where are
+# the package sources.
+# - the patch directory, optional, default '../kernel-patches'. The place
+# where are the scripts you want to apply.
+# - other parameters are the patch name patterns, optional, default value is
+# '*'. Pattern(s) describing the patch names you want to apply.
+#
+# The script will look recursively for patches from the patch directory. If a
+# file is named 'series' then only patches mentionned into it will be applied.
+# If not, the script will look for file names matching pattern(s). If the name
+# ends with '.tar.*', '.tbz2' or '.tgz', the file is considered as an archive
+# and will be uncompressed into a directory named
+# '.patches-name_of_the_archive-unpacked'. It's the turn of this directory to
+# be scanned with '*' as pattern. Remember that scanning is recursive. Other
+# files than series file and archives are considered as a patch.
+#
+# Once a patch is found, the script will try to apply it. If its name doesn't
+# end with '.gz', '.bz', '.bz2', '.zip', '.Z', '.diff*' or '.patch*', it will
+# be skipped. If necessary, the patch will be uncompressed before being
+# applied. The list of the patches applied is stored in '.applied_patches_list'
+# file in the build directory.
 
 # Set directories from arguments, or use defaults.
 builddir=${1-.}
-- 
1.7.9.5

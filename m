From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:35 -0000
Subject: [Buildroot] [git commit branch/next] apply-patches.sh: add
	documentation
Message-ID: <20120802195233.0E8CD96FF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=38b1ba3681416692c97689b01c9302877949c693
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Ludovic Desroches <ludovic.desroches@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/apply-patches.sh |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

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

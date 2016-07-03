From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jul 2016 11:19:50 +0200
Subject: [Buildroot] [git commit] docs/manual: document FOO_GIT_SUBMODULE
Message-ID: <20160703092145.C87E481DEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02f0878078a037c4c76ab1e478dad67ce422a148
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix typo as noticed by Samuel]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-generic.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index de8aca2..f18465b 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -310,6 +310,12 @@ information is (assuming the package name is +libfoo+) :
      the package source code. Buildroot copies the contents of the
      source directory into the package's build directory.
 
+* +LIBFOO_GIT_SUBMODULES+, when +LIBFOO_SITE_METHOD=git+, will create
+  an archive with the git submodules in the repository.
+  Note that we try not to use such git submodules when they contain
+  bundled libraries, in which case we prefer to use those libraries
+  from their own package.
+
 * +LIBFOO_STRIP_COMPONENTS+ is the number of leading components
   (directories) that tar must strip from file names on extraction.
   The tarball for most packages has one leading component named

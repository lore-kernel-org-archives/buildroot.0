From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 14:49:12 +0200
Subject: [Buildroot] [git commit] docs/manual/adding-packages-golang.txt:
 update following go.mod integration
Message-ID: <20200902161638.3EBD585EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a289fc8b69b71a4ab0585e23e2004c01db821e2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-golang.txt | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/docs/manual/adding-packages-golang.txt b/docs/manual/adding-packages-golang.txt
index 8c467689be..3b34579200 100644
--- a/docs/manual/adding-packages-golang.txt
+++ b/docs/manual/adding-packages-golang.txt
@@ -76,15 +76,13 @@ optionally be defined, depending on the package's needs. Many of them
 are only useful in very specific cases, typical packages will
 therefore only use a few of them, or none.
 
-* If your package need a custom +GOPATH+ to be compiled in, you can
-  use the +FOO_WORKSPACE+ variable. The +GOPATH+ being used will be
-  +<package-srcdir>/<FOO_WORKSPACE>+. If +FOO_WORKSPACE+ is not
-  specified, it defaults to +_gopath+.
-
-* +FOO_SRC_SUBDIR+ is the sub-directory where your source will be
-  compiled relatively to the +GOPATH+. An example value is
-  +github.com/bar/foo+. If +FOO_SRC_SUBDIR+ is not specified, it
-  defaults to a value infered from the +FOO_SITE+ variable.
+* The package must specify its Go module name in the +FOO_GOMOD+
+  variable. If not specified, it defaults to
+  +URL-domain/1st-part-of-URL/2nd-part-of-URL+, e.g +FOO_GOMOD+ will
+  take the value +github.com/bar/foo+ for a package that specifies
+  +FOO_SITE = $(call github,bar,foo,$(FOO_VERSION))+. The Go package
+  infrastructure will automatically generate a minimal +go.mod+ file
+  in the package source tree if it doesn't exist.
 
 * +FOO_LDFLAGS+ and +FOO_TAGS+ can be used to pass respectively the
   +LDFLAGS+ or the +TAGS+ to the +go+ build command.

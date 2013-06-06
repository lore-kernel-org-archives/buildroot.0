From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Jun 2013 22:27:49 +0200
Subject: [Buildroot] [git commit] doc: Add txt document for the new
	package-specific FLAT_STACKSIZE option.
Message-ID: <20130606211250.1E2699A9A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51dea66f96b5c00433070ef126d829292b3cad97
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-generic.txt |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index aa94b88..0d75042 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -342,6 +342,12 @@ information is (assuming the package name is +libfoo+) :
   non-opensource packages: Buildroot will not save the source code for this
   package when collecting the +legal-info+.
 
+* +LIBFOO_FLAT_STACKSIZE+ defines the stack size of an application built into
+  the FLAT binary format. The application stack size on the NOMMU architecture
+  processors can't be enlarged at run time. The default stack size for the
+  FLAT binary format is only 4k bytes. If the application consumes more stack,
+  append the required number here.
+
 The recommended way to define these variables is to use the following
 syntax:
 

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 26 Jun 2012 09:58:38 +0200
Subject: [Buildroot] [git commit] gzip: 1.5+ needs wchar support
Message-ID: <20120626082357.137BD8282E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c18532766f65ea19b29000ccbb56a5aa7777f698
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/267404bccd9582d3b85b99b16b47b580bf239eb9/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gzip/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/gzip/Config.in b/package/gzip/Config.in
index dc9d50b..f501d5c 100644
--- a/package/gzip/Config.in
+++ b/package/gzip/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_GZIP
 	bool "gzip"
+	depends on BR2_USE_WCHAR
 	help
 	  Standard GNU compressor.  Provides things like gzip,
 	  gunzip, gzcat, etc...
 
 	  http://www.gnu.org/software/gzip/gzip.html
+
+comment "gzip requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR

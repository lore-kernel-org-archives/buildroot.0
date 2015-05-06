From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 May 2015 23:48:51 +0200
Subject: [Buildroot] [git commit] ola: depend on python for bindings instead
	of selecting it
Message-ID: <20150506214905.2D35D7FA34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f751579945792d6127ffa239fd803d996709e18
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Most likely people have already enabled python if they want to use the
bindings for ola, so use depends on instead of select so we don't need to
propagate the dependencies here.

Python already depends on mmu, so drop that here.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ola/Config.in |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/ola/Config.in b/package/ola/Config.in
index 1c4b8d8..f587db5 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -32,9 +32,8 @@ config BR2_PACKAGE_OLA_WEB
 
 config BR2_PACKAGE_OLA_PYTHON_BINDINGS
 	bool "python bindings"
-	select BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_PROTOBUF
-	depends on BR2_USE_MMU
 	help
 	  Build OLA with support for the Python language.
 
@@ -55,8 +54,7 @@ config BR2_PACKAGE_OLA_EXAMPLES
 
 config BR2_PACKAGE_OLA_RDM_TESTS
 	bool "rdm tests"
-	select BR2_PACKAGE_OLA_PYTHON_BINDINGS
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_OLA_PYTHON_BINDINGS
 	help
 	  Build OLA RDM tests.
 

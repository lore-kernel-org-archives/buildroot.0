From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 May 2014 15:01:38 +0200
Subject: [Buildroot] [git commit] slang: needs mmu
Message-ID: <20140526130225.B1F739CDD9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fcff0d9cd0d077a35aab4250060a3362678ad2ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/dbc/dbce9e591466717d9c87f42b5f192d8fd1be0475/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/newt/Config.in  |    2 ++
 package/slang/Config.in |    1 +
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/newt/Config.in b/package/newt/Config.in
index 1737f31..1b3068a 100644
--- a/package/newt/Config.in
+++ b/package/newt/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NEWT
 	bool "newt"
 	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # slang
 	select BR2_PACKAGE_SLANG
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
@@ -10,4 +11,5 @@ config BR2_PACKAGE_NEWT
 	  http://www.redhat.com/
 
 comment "newt needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
diff --git a/package/slang/Config.in b/package/slang/Config.in
index 9d8f047..a500ff5 100644
--- a/package/slang/Config.in
+++ b/package/slang/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SLANG
 	bool "slang"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Multi-platform console display library.
 

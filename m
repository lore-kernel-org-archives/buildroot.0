From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Nov 2013 17:12:51 +0100
Subject: [Buildroot] [PATCH] ruby: needs thread support
Message-ID: <1384963971-32670-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

   http://autobuild.buildroot.org/results/7c6/7c6cc07e360aa998957a48e834b8cc086282d716/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ruby/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/ruby/Config.in b/package/ruby/Config.in
index 9b50501..0de756b 100644
--- a/package/ruby/Config.in
+++ b/package/ruby/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_RUBY
 	bool "ruby"
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Object Oriented Scripting Language.
 
 	  http://www.ruby-lang.org/
 
-comment "ruby needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
+comment "ruby needs a toolchain w/ wchar, threads"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2

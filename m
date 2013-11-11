From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 09:41:41 +0100
Subject: [Buildroot] [git commit] cppdb: fix comment dependency
Message-ID: <20131111084233.A887F9BB32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1eee94dd910abd76009fbfffdc29abd88e1ca81f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As noticed by Thomas De Schampheleir.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cppdb/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/cppdb/Config.in b/package/cppdb/Config.in
index f0c48e3..f79b70b 100644
--- a/package/cppdb/Config.in
+++ b/package/cppdb/Config.in
@@ -12,4 +12,5 @@ config BR2_PACKAGE_CPPDB
 	  http://cppcms.com/sql/cppdb/
 
 comment "cppdb needs a toolchain w/ C++, threads"
+	depends on BR2_PACKAGE_MYSQL_CLIENT || BR2_PACKAGE_SQLITE
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS

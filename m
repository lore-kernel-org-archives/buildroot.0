From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Nov 2013 16:39:11 +0100
Subject: [Buildroot] [git commit] cppzmq/czmq: Update comment for needs
	threads support
Message-ID: <20131104211054.CCC009BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a2ffd684924880f3a59d2ed875afb8cc8d2ed823
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Comment 7e37d235f "zeromq: needs threads" adds BR2_TOOLCHAIN_HAS_THREADS
dependency but forgot to add corresponding comment for cppzmq and czmq. Fix it.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cppzmq/Config.in |    2 +-
 package/czmq/Config.in   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cppzmq/Config.in b/package/cppzmq/Config.in
index 9629383..e17963e 100644
--- a/package/cppzmq/Config.in
+++ b/package/cppzmq/Config.in
@@ -11,6 +11,6 @@ config BR2_PACKAGE_CPPZMQ
 
 	  http://github.com/zeromq/cppzmq
 
-comment "cppzmq needs a toolchain w/ C++, IPv6, largefile, wchar"
+comment "cppzmq needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
 		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/czmq/Config.in b/package/czmq/Config.in
index 9ba5e65..d442293 100644
--- a/package/czmq/Config.in
+++ b/package/czmq/Config.in
@@ -15,6 +15,6 @@ config BR2_PACKAGE_CZMQ
 
 	  http://czmq.zeromq.org/
 
-comment "czmq needs a toolchain w/ C++, IPv6, largefile, wchar"
+comment "czmq needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
 		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)

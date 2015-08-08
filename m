From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Aug 2015 10:56:20 -0000
Subject: [Buildroot] [git commit branch/next] conntrack-tools: adjust
	comment to match conditional
Message-ID: <20150808105602.9158E7F8ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5bcd317740f5601923370c555cb3c953a2e5e8af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 3afbc4f3 (conntrack-tools: uses dlopen(), not available on static
builds) adjusted the dependencies for the comment, but forgot to update the
comment itself.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/conntrack-tools/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/conntrack-tools/Config.in b/package/conntrack-tools/Config.in
index 03e3ed9..87bf2d0 100644
--- a/package/conntrack-tools/Config.in
+++ b/package/conntrack-tools/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_CONNTRACK_TOOLS
 
 	  http://www.netfilter.org/projects/conntrack-tools/
 
-comment "conntrack-tools needs a toolchain w/ threads"
+comment "conntrack-tools needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC) || \
 		BR2_STATIC_LIBS

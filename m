From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 14:02:36 +0100
Subject: [Buildroot] [git commit] quota: select
	BR2_PACKAGE_UTIL_LINUX_BINARIES
Message-ID: <20130324130310.865899B26A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0be9ece5e75d6eeff06f3c8f395dcbb4ef95a16c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All of the util-linux tools options depend on
BR2_PACKAGE_UTIL_LINUX_BINARIES that select all the required util-linux
libraries and enable the tools build process.
So basically quota is selecting a hidden/unavailable option and
triggering a util-linux build failure. Fixes:
http://autobuild.buildroot.net/results/bc3c75e7c60fe6db54ea56dd7c398ba7878bff83/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/quota/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/quota/Config.in b/package/quota/Config.in
index f6341d3..5127a9a 100644
--- a/package/quota/Config.in
+++ b/package/quota/Config.in
@@ -3,7 +3,9 @@ config BR2_PACKAGE_QUOTA
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
+	depends on !(BR2_microblazeel || BR2_microblazebe) # util-linux
 	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_BINARIES
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC

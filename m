From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 27 Feb 2013 09:22:59 +0100
Subject: [Buildroot] [git commit] quota: needs mmu
Message-ID: <20130227082311.32E0D9AB74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9403f92867f67c26ccbfba3fd47de03a52d1a776
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/85e3c73d1c0b5c6843d65a487203b20f62bf3075

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/quota/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/quota/Config.in b/package/quota/Config.in
index f7d0fe9..f6341d3 100644
--- a/package/quota/Config.in
+++ b/package/quota/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_QUOTA
 	bool "quota"
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE

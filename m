From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Sep 2013 16:55:17 +0200
Subject: [Buildroot] [git commit] knock: needs mmu
Message-ID: <20130918222318.865099B7D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c97b9cc2529d8c34d3d67829046f9df6da00593c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Rommel <rommel@layer-7.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/knock/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/knock/Config.in b/package/knock/Config.in
index a50860b..8778a7e 100644
--- a/package/knock/Config.in
+++ b/package/knock/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_KNOCK
 	bool "knock"
 	select BR2_PACKAGE_LIBPCAP
+	depends on BR2_USE_MMU # fork()
 	help
 	  A port knocking implementation.
 	  Provides a daemon and a user application. Port knocking can be

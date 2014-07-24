From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Jul 2014 22:28:20 +0200
Subject: [Buildroot] [git commit] gnupg2: fix dependency on libpthsem
Message-ID: <20140724202941.35AD39D2E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2141e06c4f55ff36abf781a64fa9e581cbf091b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit beb49d882e03d4596d40dafad21e50460a6f1ef0 ('gnupg2: new
package') was incorrect in its dependency on libpthsem: it was
selecting BR2_PACKAGE_PTHSEM while it should select
BR2_PACKAGE_LIBPTHSEM. This commit fixes that.

Fixes:

  http://autobuild.buildroot.org/results/6e0/6e02b42f01986a56c22c44658fa1e488c0a08e7c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnupg2/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnupg2/Config.in b/package/gnupg2/Config.in
index ea74404..be97a20 100644
--- a/package/gnupg2/Config.in
+++ b/package/gnupg2/Config.in
@@ -5,8 +5,8 @@ config BR2_PACKAGE_GNUPG2
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBASSUAN
 	select BR2_PACKAGE_LIBKSBA
-	select BR2_PACKAGE_PTHSEM
-	select BR2_PACKAGE_PTHSEM_COMPAT
+	select BR2_PACKAGE_LIBPTHSEM
+	select BR2_PACKAGE_LIBPTHSEM_COMPAT
 	depends on BR2_USE_MMU # libassuan
 	help
 	  GnuPG is the GNU project's complete and free implementation

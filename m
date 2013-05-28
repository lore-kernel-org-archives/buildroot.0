From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 28 May 2013 23:39:55 +0200
Subject: [Buildroot] [git commit] flex: propagate m4 dependency on wchar
Message-ID: <20130528214155.524019A3F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c0d30d4c94047ab29db021a921dc3762e81ac5e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit fe6a9e5e9d4046173a60235f8fd9a3b4746929c6 missed the fact that
m4 has a dependency on wide char support, so this dependency should be
propagated to flex.

Fixes:

  http://autobuild.buildroot.org/results/495/49502b2e33a346b2fcebf5e2da00af2661b54d6e/build-end.log

[Peter: Note where wchar dep comes from, show comment if not available]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/flex/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/flex/Config.in b/package/flex/Config.in
index 1ecd0c3..4fbc56c 100644
--- a/package/flex/Config.in
+++ b/package/flex/Config.in
@@ -14,5 +14,9 @@ config BR2_PACKAGE_FLEX_BINARY
 	depends on BR2_PACKAGE_FLEX
 	# runtime dependency
 	select BR2_PACKAGE_M4
+	depends on BR2_USE_WCHAR # m4
 	help
 	  Install the flex binary tool in the target filesystem.
+
+comment "flex binary requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR

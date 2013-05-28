From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 May 2013 23:27:00 +0200
Subject: [Buildroot] [PATCH] flex: propagate m4 dependency on wchar
Message-ID: <1369776420-4492-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit fe6a9e5e9d4046173a60235f8fd9a3b4746929c6 missed the fact that
m4 has a dependency on wide char support, so this dependency should be
propagated to flex.

Fixes:

  http://autobuild.buildroot.org/results/495/49502b2e33a346b2fcebf5e2da00af2661b54d6e/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flex/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/flex/Config.in b/package/flex/Config.in
index 1ecd0c3..45e3bac 100644
--- a/package/flex/Config.in
+++ b/package/flex/Config.in
@@ -14,5 +14,6 @@ config BR2_PACKAGE_FLEX_BINARY
 	depends on BR2_PACKAGE_FLEX
 	# runtime dependency
 	select BR2_PACKAGE_M4
+	depends on BR2_USE_WCHAR
 	help
 	  Install the flex binary tool in the target filesystem.
-- 
1.7.9.5

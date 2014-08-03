From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Aug 2014 14:38:03 +0200
Subject: [Buildroot] [git commit] ltrace: add comment for dependencies
Message-ID: <20140803123809.5DAC69D365@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=292d9a85ee6158bef103abe4c1237f7ad4fbc3fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltrace/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index 4389210..4d1acfa 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -13,3 +13,6 @@ config BR2_PACKAGE_LTRACE
 	  process and the signals received by that process.
 
 	  http://ltrace.org
+
+comment "ltrace needs toolchain w/ largefile, wchar"
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR

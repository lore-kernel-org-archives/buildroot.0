From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Apr 2014 22:32:48 +0200
Subject: [Buildroot] [git commit] libdrm: Explain dependency on xorg in
	Kconfig
Message-ID: <20140427203319.DEBB89C210@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a729659d70270adfb683acda6c234d137c142b20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdrm/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index df95eec..e6a7a42 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -21,6 +21,9 @@ config BR2_PACKAGE_LIBDRM_INTEL
 	help
 	  installs intel graphics driver
 
+comment "libdrm intel driver depends on X.org"
+	depends on !BR2_PACKAGE_XORG7
+
 config BR2_PACKAGE_LIBDRM_RADEON
 	bool "radeon"
 	help

From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 15:13:35 +0100
Subject: [Buildroot] [git commit] mtr: not available for avr32
Message-ID: <20140204141913.5B7939C7C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0c535e15fae24b8cd9ea6a3537168e9bc59547f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The uclibc version condition is accurate but doesn't cover external
toolchains, so also exclude for avr32 too which only has 0.9.31 enabled.
Fixes:
http://autobuild.buildroot.net/results/4ee/4eec6e29d0f2a46bbbe3a748e85bd06c3601b7c1/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtr/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/mtr/Config.in b/package/mtr/Config.in
index 842d6ca..7e5ad90 100644
--- a/package/mtr/Config.in
+++ b/package/mtr/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_MTR
 	bool "mtr"
 	# res_mkquery() only available in 0.9.33+
 	depends on !BR2_UCLIBC_VERSION_0_9_31 && !BR2_UCLIBC_VERSION_0_9_32
+	depends on !BR2_avr32
 	help
 	  mtr combines the functionality of the 'traceroute' and 'ping'
 	  programs in a single network diagnostic tool.

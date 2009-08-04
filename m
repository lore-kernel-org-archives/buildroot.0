From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Aug 2009 21:17:40 +0200
Subject: [Buildroot] [git commit] ipsec-tools: only show the security
	context choice when ipsec enabled
Message-ID: <20090804192339.27D01776C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=070424f0c84a68078ac08fdc908542830f3d843f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ipsec-tools/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/ipsec-tools/Config.in b/package/ipsec-tools/Config.in
index a55ff0c..d29cb86 100644
--- a/package/ipsec-tools/Config.in
+++ b/package/ipsec-tools/Config.in
@@ -61,6 +61,8 @@ config BR2_PACKAGE_IPSEC_TOOLS_LIBS
 	  Install libipsec.a and libracoon.a under staging_dir/lib for further
 	  development on a host machine.
 
+if BR2_PACKAGE_IPSEC_TOOLS
+
 choice
 	prompt "Security context"
 	default BR2_PACKAGE_IPSEC_SECCTX_DISABLE
@@ -77,3 +79,5 @@ config BR2_PACKAGE_IPSEC_SECCTX_KERNEL
 	bool "Enable kernel security context"
 
 endchoice
+
+endif
-- 
1.6.3.3

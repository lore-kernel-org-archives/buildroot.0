From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 4 May 2013 23:03:38 +0200
Subject: [Buildroot] [git commit] arc: Add option for ARC-specific download
	site
Message-ID: <20130504212450.CF818972A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1445b7fd2e46db5d39ad5e2f5cc262574399f5f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As ARC support is not yet in all upstream packages, a different location is
required to download the packages from. This adds an option to specify a
site for ARC-specific versions of packages such as binutils, gcc.

When ARC support has been upstreamed for all packages, this option can be
removed again.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 arch/Config.in.arc |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index 60b59f0..9f68b46 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -12,3 +12,7 @@ config BR2_ENDIAN
 
 config BR2_GCC_TARGET_CPU
 	default "arc700"
+
+config BR2_ARC_SITE
+	string
+	default "http://www.synopsys.com/apps/arc-developer/"

From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 May 2014 23:29:02 +0200
Subject: [Buildroot] [git commit] package/elf2flt: hide when an MMU is used
Message-ID: <20140601083246.D68B69CE5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=36017b3d3acdbcfeb8c6e89f5bd71c379f5f5ecf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

elf2flt is specifically for cases where an MMU is not available.
There is no point in building elf2flt when using an MMU.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/elf2flt/Config.in.host |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/elf2flt/Config.in.host b/package/elf2flt/Config.in.host
index dad48d8..605ce20 100644
--- a/package/elf2flt/Config.in.host
+++ b/package/elf2flt/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_ELF2FLT
 	bool "Enable elf2flt support?"
 	depends on BR2_arm || BR2_bfin || BR2_sh || BR2_sparc
+	depends on !BR2_USE_MMU
 	help
 	  uCLinux uses a Binary Flat format commonly known as BFLT. It
 	  is a relatively simple and lightweight executable format

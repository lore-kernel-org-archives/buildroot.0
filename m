From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 22:12:53 +0100
Subject: [Buildroot] [git commit] elf2flt: disable for blackfin
Message-ID: <20150320211258.6849F7FA52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3503386aad14e662bc101b7184973a59dab489bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we don't support the internal blackfin toolchain any more it
makes no sense to have this enabled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/elf2flt/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/elf2flt/Config.in.host b/package/elf2flt/Config.in.host
index 605ce20..eb86b11 100644
--- a/package/elf2flt/Config.in.host
+++ b/package/elf2flt/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_ELF2FLT
 	bool "Enable elf2flt support?"
-	depends on BR2_arm || BR2_bfin || BR2_sh || BR2_sparc
+	depends on BR2_arm || BR2_sh || BR2_sparc
 	depends on !BR2_USE_MMU
 	help
 	  uCLinux uses a Binary Flat format commonly known as BFLT. It

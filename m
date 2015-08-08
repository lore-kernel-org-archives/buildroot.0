From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:38 -0000
Subject: [Buildroot] [git commit branch/next] libsigsegv: unavailable for
	powerpc with uclibc
Message-ID: <20150808105637.DB11B80414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b3850d837888afacc48eef3c2c6514e282724a27
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
http://autobuild.buildroot.net/results/c5f/c5fef9a89f99e13de9cabe52c2ac1602d85974fe/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsigsegv/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/libsigsegv/Config.in b/package/libsigsegv/Config.in
index 2ca9a28..35f6d67 100644
--- a/package/libsigsegv/Config.in
+++ b/package/libsigsegv/Config.in
@@ -3,7 +3,12 @@ config BR2_PACKAGE_LIBSIGSEGV
 	depends on !BR2_xtensa
 	depends on !BR2_arc # no ucontext_i.sym file
 	depends on !BR2_microblaze
+	# No ucontext support in uclibc for powerpc
+	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
 	help
 	  Library for handling page faults in user mode.
 
 	  http://libsigsegv.sourceforge.net/
+
+comment "libsigsegv needs an (e)glibc toolchain"
+	depends on BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC

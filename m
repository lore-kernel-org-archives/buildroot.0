From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Mar 2015 12:03:05 +0100
Subject: [Buildroot] [git commit branch/next] uclibc: enable Xtensa NPTL
	support with uClibc-ng
Message-ID: <20150301110350.4A61E7F8D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=060125b4fed11458288b14fbd2d49e1c12eb11df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Contrary to mainline uClibc, uClibc-ng has support for NPTL on Xtensa,
so let's allow selecting NPTL when a uClibc version other than the
Xtensa special uClibc version is used.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
---
 package/uclibc/Config.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index a8af197..3a65752 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -129,7 +129,9 @@ choice
 		select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 		depends on !BR2_arc
 		depends on !BR2_bfin
-		depends on !BR2_xtensa
+		# There is NPTL support for Xtensa in uClibc-ng, but
+		# not in the main uClibc repository.
+		depends on !BR2_xtensa || !BR2_UCLIBC_VERSION_XTENSA_GIT
 		depends on !BR2_x86_i386
 endchoice
 

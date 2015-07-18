From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 11:17:32 +0200
Subject: [Buildroot] [git commit] gcc/libmudflap: also unavailable for gcc
	5.x
Message-ID: <20150718091736.42D547FFB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b0d6d3071b51365ff9c6e4b46a13b03e3513dd51
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 545cfe7..bd5c13f 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -144,6 +144,7 @@ config BR2_GCC_ENABLE_LIBMUDFLAP
 	# which mudflap is not supported.
 	depends on !BR2_ARM_INSTRUCTIONS_THUMB && !BR2_powerpc_SPE
 	depends on !BR2_GCC_VERSION_4_9_X
+	depends on !BR2_GCC_VERSION_5_X
 	help
 	  libmudflap is a gcc library used for the mudflap pointer
 	  debugging functionality. It is only needed if you intend to

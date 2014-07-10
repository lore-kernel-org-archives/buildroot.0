From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jul 2014 16:49:36 +0200
Subject: [Buildroot] [git commit] arch: deprecate the AVR32 architecture
Message-ID: <20140710150058.176F09C46A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=01efcf84fe48060a1cfb5b154842e9670d11d979
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The AVR32 architecture from Atmel is obsolete since a long time, not
supported upstream in most of the toolchain components (requires a
special version of gcc, an old version of uClibc, etc.). Until
February, Simon Dawson was making an excellent job at maintaining
AVR32 in Buildroot, and fixing all the issues caused by this
architecture. However, Simon focus has changed, and despite his call
for a new maintainer for AVR32 in Buildroot, nobody stepped up.

The issue of maintaining AVR32 is becoming worse and worse, so this
patch proposes to deprecate it for 2014.08, but keeping the support
around, to remove it for sure in 2014.11.

Cc: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 1f60f81..77fae7a 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -56,6 +56,12 @@ config BR2_aarch64
 config BR2_avr32
 	bool "AVR32"
 	select BR2_SOFT_FLOAT
+	# This architecture is obsolete and complicated to maintain to
+	# do the lack of upstream support in the major toolchain
+	# components. If you're interested by AVR32, contact the
+	# Buildroot community. Otherwise, its support will be removed
+	# in 2014.11.
+	depends on BR2_DEPRECATED_SINCE_2014_08
 	help
 	  The AVR32 is a 32-bit RISC microprocessor architecture designed by
 	  Atmel.

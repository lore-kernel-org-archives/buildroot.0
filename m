From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 22:24:39 +0100
Subject: [Buildroot] [git commit] bctoolbox: remove redundant mbedtls
	dependency
Message-ID: <20170223212642.565397FEB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a862b53ef953b14dc864f04694e8bf3ebfb29162
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  Makefile:532: *** mbedtls is in the dependency chain of bctoolbox that
  has added it to its _DEPENDENCIES variable without selecting it or
  depending on it from Config.in.  Stop.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Acked-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bctoolbox/bctoolbox.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/bctoolbox/bctoolbox.mk b/package/bctoolbox/bctoolbox.mk
index 76737aa..7826975 100644
--- a/package/bctoolbox/bctoolbox.mk
+++ b/package/bctoolbox/bctoolbox.mk
@@ -8,7 +8,6 @@ BCTOOLBOX_VERSION = 0.4.0
 BCTOOLBOX_SITE = $(call github,BelledonneCommunications,bctoolbox,$(BCTOOLBOX_VERSION))
 BCTOOLBOX_LICENSE = GPLv2+
 BCTOOLBOX_LICENSE_FILES = COPYING
-BCTOOLBOX_DEPENDENCIES = mbedtls
 BCTOOLBOX_INSTALL_STAGING = YES
 
 # Set CMAKE_SKIP_RPATH to prevent bctoolbox from adding the rpath to

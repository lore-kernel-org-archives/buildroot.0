From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Feb 2019 09:07:35 +0100
Subject: [Buildroot] [git commit] package/googlefontdirectory: silence false
 positive check-package warning
Message-ID: <20190207080709.47D1C87FE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96b1c19b74885f3ad156a963443f02282169e2d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

check-package OverriddenVariable check believes we are overriding the
value of GOOGLEFONTDIRECTORY_LICENSE, but in fact we are not. Let's
tell check-package not to complain about this.

Fixes:

package/googlefontdirectory/googlefontdirectory.mk:28: unconditional override of variable GOOGLEFONTDIRECTORY_LICENSE previously conditionally set

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/googlefontdirectory/googlefontdirectory.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/googlefontdirectory/googlefontdirectory.mk b/package/googlefontdirectory/googlefontdirectory.mk
index f202d29c56..cf918ac4ae 100644
--- a/package/googlefontdirectory/googlefontdirectory.mk
+++ b/package/googlefontdirectory/googlefontdirectory.mk
@@ -25,6 +25,7 @@ GOOGLEFONTDIRECTORY_LICENSE += UFL-1.1
 GOOGLEFONTDIRECTORY_LICENSE_FILES += $(addsuffix /LICENCE.txt,$(filter ufl/%,$(GOOGLEFONTDIRECTORY_FONTS)))
 endif
 
+# check-package OverriddenVariable
 GOOGLEFONTDIRECTORY_LICENSE := $(subst $(space),$(comma)$(space),$(GOOGLEFONTDIRECTORY_LICENSE))
 
 define GOOGLEFONTDIRECTORY_INSTALL_TARGET_CMDS

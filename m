From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Aug 2013 11:42:09 +0200
Subject: [Buildroot] [git commit] Fix ARM uclibc build with
	!BR2_UCLIBC_ARM_BX.
Message-ID: <20130807094156.DD88A9B230@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ffc999d851a590091bad44d623364f4c9105989
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_UCLIBC_ARM_BX is not set, UCLIBC_OPT_UNSET gets called with an extra
argument.  Remove it.

Signed-off-by: Justin Maggard <jmaggard10@gmail.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 644c531..36a5001 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -85,7 +85,7 @@ define UCLIBC_ARM_BX_CONFIG
 endef
 else
 define UCLIBC_ARM_BX_CONFIG
-	$(call UCLIBC_OPT_UNSET,USE_BX,y,$(@D))
+	$(call UCLIBC_OPT_UNSET,USE_BX,$(@D))
 endef
 endif
 

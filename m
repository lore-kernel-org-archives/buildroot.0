From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Sep 2013 00:29:38 +0200
Subject: [Buildroot] [git commit] uclibc: Add UCLIBC_MMU_CONFIG to
	UCLIBC_SETUP_DOT_CONFIG
Message-ID: <20130918223048.CD46D9B216@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3fce526c2d8390877daa69c9171bdbd3f682a64b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

commit c798bec25 "uclibc: set MMU usage accordingly" defines UCLIBC_MMU_CONFIG,
but forgot adding it to UCLIBC_SETUP_DOT_CONFIG. Fix it.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/uclibc/uclibc.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 181a772..3993d9b 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -425,6 +425,7 @@ define UCLIBC_SETUP_DOT_CONFIG
 	$(call UCLIBC_OPT_SET,RUNTIME_PREFIX,"/",$(@D))
 	$(call UCLIBC_OPT_SET,DEVEL_PREFIX,"/usr",$(@D))
 	$(call UCLIBC_OPT_SET,SHARED_LIB_LOADER_PREFIX,"/lib",$(@D))
+	$(UCLIBC_MMU_CONFIG)
 	$(UCLIBC_ARM_TYPE_CONFIG)
 	$(UCLIBC_ARM_ABI_CONFIG)
 	$(UCLIBC_ARM_BX_CONFIG)

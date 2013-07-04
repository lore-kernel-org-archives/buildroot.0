From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Jul 2013 12:10:47 +0200
Subject: [Buildroot] [git commit] uclibc: fix PowerPC build problem
Message-ID: <20130704101256.074FF9A2A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=963065ed0821770b10694ce9f4cfdb69ef6f95cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A stupid Unicode character was inserted instead of 'D'.

Fixes:
http://autobuild.buildroot.org/results/7a4/7a45fb1379307a788047ec859a4ce2c42d6eb077/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/uclibc/uclibc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 1c5340c..f8495ba 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -140,7 +140,7 @@ UCLIBC_POWERPC_TYPE = CONFIG_$(call qstrip,$(BR2_UCLIBC_POWERPC_TYPE))
 define UCLIBC_POWERPC_TYPE_CONFIG
 	$(call UCLIBC_OPT_UNSET,CONFIG_GENERIC,$(@D))
 	$(call UCLIBC_OPT_UNSET,CONFIG_E500,$(@D))
-	$(call UCLIBC_OPT_SET,$(UCLIBC_POWERPC_TYPE),y,$(@??))
+	$(call UCLIBC_OPT_SET,$(UCLIBC_POWERPC_TYPE),y,$(@D))
 endef
 endif # powerpc
 

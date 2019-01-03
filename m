From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu,  3 Jan 2019 10:58:41 +0100
Subject: [Buildroot] [PATCH] package/efivar: bump version to 35
Message-ID: <20190103095842.1670-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/545/545013d3977b3eddd27ca0fc21cc1248f3bb0dbb/
http://autobuild.buildroot.net/results/695/6952b99eb0b0e85b2f5408accdca2b4dd17d14c0/

Includes a workaround for -Werror=stringop-overflow= erroring out on strncpy
on some toolchains:

https://github.com/rhboot/efivar/commit/7461d47cddf1cb27b1aeb646e1cdc9f7ecc6219a

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efivar/efivar.hash | 2 +-
 package/efivar/efivar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/efivar/efivar.hash b/package/efivar/efivar.hash
index e8a65adc4b..7feb5b7533 100644
--- a/package/efivar/efivar.hash
+++ b/package/efivar/efivar.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256 9691399a424b8e3776b7ed2df1893c4162285a93697d781f387d0f0d258a7f4b  efivar-34.tar.gz
+sha256 747bc4d97b4bd74979e5356c44a172534a8a07184f130349fd201742e683d292  efivar-35.tar.gz
 sha256 91df770634adc2755e78cae33a0d01e702ce2f69046408ae93d0d934ff29691b  COPYING
diff --git a/package/efivar/efivar.mk b/package/efivar/efivar.mk
index 492a4468bf..d96bd98d09 100644
--- a/package/efivar/efivar.mk
+++ b/package/efivar/efivar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFIVAR_VERSION = 34
+EFIVAR_VERSION = 35
 EFIVAR_SITE = $(call github,rhboot,efivar,$(EFIVAR_VERSION))
 EFIVAR_LICENSE = LGPL-2.1
 EFIVAR_LICENSE_FILES = COPYING
-- 
2.11.0

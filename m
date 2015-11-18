From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Nov 2015 21:58:23 +0100
Subject: [Buildroot] [git commit branch/next] syslog-ng: Bump version to
	3.7.2
Message-ID: <20151118210009.6F2C080085@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b981df4fcee131b19c8f3e06489485346d38e942
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/syslog-ng/syslog-ng.hash |    8 +-------
 package/syslog-ng/syslog-ng.mk   |    9 +--------
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index fed2475..0213d2d 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,8 +1,2 @@
 # Locally computed
-sha256 4c19841b9079b377cd814b1e6ebbf273af41d04d51c648f4c31f19bfadc20220  syslog-ng-3.7.1.tar.gz
-sha256 ca6b18c00e72a531dc3e4da24ff79e4b4420cb0f666b3d72af6597648b36a696  7b2b673ae2640ce9ad396f538fc25acb6e4405ec.patch
-sha256 77fcbe7d6df23e710a81d8e065e17ab91b14d580aead65bb292e4f25b4369192  f10941e565d402e032948bb9711bfbab43eadd88.patch
-sha256 4547b44d8241be716f321d2aed225197e517db9912d6aedd8565765b427db6f2  96a633ce3f46ed102f38115000730bad41c4ed65.patch
-sha256 15cdd963f5cae0e113724fb202baccc0056f8618723d7f7290f15e082f9e16cd  00526014247bb63680e53c35d4a76d0dac989405.patch
-sha256 ec76ed27ab01f9487a8adf092655bc99167a9e81f6be685a8a45fdb1b07cca32  46b07ecaffc154aa7cc713409196020736fe4f33.patch
-sha256 737b34b4457a1fa9cd38be6a98119f131f7d64e82480011880c178d3d2618dea  e30fe7c3717a7bda4036448c7777747df1a4e0f9.patch
+sha256 b1b3ccc0ce7f0d8bf15b23e59f2f4f5ded70eed410dfd27105219bc8856388a5  syslog-ng-3.7.2.tar.gz
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 1f51e04..5f48a79 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSLOG_NG_VERSION = 3.7.1
+SYSLOG_NG_VERSION = 3.7.2
 SYSLOG_NG_SOURCE = syslog-ng-$(SYSLOG_NG_VERSION).tar.gz
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPLv2.1+ (syslog-ng core), GPLv2+ (modules)
@@ -14,13 +14,6 @@ SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
 # rabbit-mq needs -lrt
 SYSLOG_NG_CONF_ENV = LIBS=-lrt
 SYSLOG_NG_CONF_OPTS = --disable-manpages
-SYSLOG_NG_PATCH = \
-	https://github.com/balabit/syslog-ng/commit/7b2b673ae2640ce9ad396f538fc25acb6e4405ec.patch \
-	https://github.com/balabit/syslog-ng/commit/f10941e565d402e032948bb9711bfbab43eadd88.patch \
-	https://github.com/balabit/syslog-ng/commit/96a633ce3f46ed102f38115000730bad41c4ed65.patch \
-	https://github.com/balabit/syslog-ng/commit/00526014247bb63680e53c35d4a76d0dac989405.patch \
-	https://github.com/balabit/syslog-ng/commit/46b07ecaffc154aa7cc713409196020736fe4f33.patch \
-	https://github.com/balabit/syslog-ng/commit/e30fe7c3717a7bda4036448c7777747df1a4e0f9.patch
 
 # We override busybox's S01logging init script
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)

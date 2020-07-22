From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 09:25:06 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/mongodb: security
 bump to version 4.2.8
Message-ID: <20200722085626.6A0DF8145C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72801d46adc2295e38411d70e259ee20b0623ee6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Fix the following security issues:
- SERVER-45514 [FLE] Reject document validators with encryption-related
  keywords if the validationAction is ???warn???
- SERVER-48039 Unrecognized option: net.ssl.clusterCertificateSelector
  in MongoDB v4.2
- SERVER-45803 mongodecrypt needs a ServiceContext
- SERVER-46834 Use monotonic time in UserCacheInvalidator
- SERVER-47113 LDAP connection pool acquisition state should own host
  list

https://docs.mongodb.com/manual/release-notes/4.2

Also:
- Update indentation in hash file (two spaces)
- Tweak version to be "compliant" with https://release-monitoring.org
- Use official tarball

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit af455335232069a160a1862e1f66b8bbe58a49ae)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongodb/mongodb.hash | 6 +++---
 package/mongodb/mongodb.mk   | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mongodb/mongodb.hash b/package/mongodb/mongodb.hash
index 01793e02e9..943ffda997 100644
--- a/package/mongodb/mongodb.hash
+++ b/package/mongodb/mongodb.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256 033839fe43adb13351f9e0ef361d4731d7e917b2d7ad12f09df73e6e9c8bf6db  mongodb-r4.2.4.tar.gz
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  APACHE-2.0.txt
-sha256 09d99ca61eb07873d5334077acba22c33e7f7d0a9fa08c92734e0ac8430d6e27  LICENSE-Community.txt
+sha256  e8880277e3910afd82c71ed61861d518f2040cbc062e00a26d53a3224284db8f  mongodb-src-r4.2.8.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  APACHE-2.0.txt
+sha256  09d99ca61eb07873d5334077acba22c33e7f7d0a9fa08c92734e0ac8430d6e27  LICENSE-Community.txt
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index f7f8b4bd05..fa111bef7b 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-MONGODB_VERSION_BASE = 4.2.4
-MONGODB_VERSION = r$(MONGODB_VERSION_BASE)
-MONGODB_SITE = $(call github,mongodb,mongo,$(MONGODB_VERSION))
+MONGODB_VERSION = 4.2.8
+MONGODB_SITE = https://fastdl.mongodb.org/src
+MONGODB_SOURCE = mongodb-src-r$(MONGODB_VERSION).tar.gz
 
 MONGODB_LICENSE = Apache-2.0 (drivers), SSPL (database)
 MONGODB_LICENSE_FILES = APACHE-2.0.txt LICENSE-Community.txt
@@ -41,7 +41,7 @@ MONGODB_SCONS_OPTS = \
 	--use-system-zlib
 
 # need to pass mongo version when not building from git repo
-MONGODB_SCONS_OPTS += MONGO_VERSION=$(MONGODB_VERSION_BASE)-
+MONGODB_SCONS_OPTS += MONGO_VERSION=$(MONGODB_VERSION)-
 
 # WiredTiger database storage engine only supported on 64 bits
 ifeq ($(BR2_ARCH_IS_64),y)

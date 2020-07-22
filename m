From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 10:11:39 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/mongodb: security
 bump to version 4.0.19
Message-ID: <20200722085617.173B58810A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c6cdcf4a56ec122b6fb5f3f49e8fe31ed26f189
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security vulnerabilities:

- CVE-2020-7921: (4.0.15) Improper serialization of internal state in the
  authorization subsystem in MongoDB Server's authorization subsystem
  permits a user with valid credentials to bypass IP whitelisting protection
  mechanisms following administrative action.

Plus a number of other bugfixes. For details, see the release notes:
https://docs.mongodb.com/manual/release-notes/4.0/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongodb/mongodb.hash | 2 +-
 package/mongodb/mongodb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongodb/mongodb.hash b/package/mongodb/mongodb.hash
index f08ffffe3b..ba2181a1f7 100644
--- a/package/mongodb/mongodb.hash
+++ b/package/mongodb/mongodb.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256 b39c5b7bb77a547804ab6f43f9b5f09add47574356b31512fd1cc641a08b4ea5  mongodb-r4.0.12.tar.gz
+sha256 fadfb81400a1b5d86d01943690064404856aaf1b050f4b56eb74811cadffdcef  mongodb-r4.0.19.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  APACHE-2.0.txt
 sha256 09d99ca61eb07873d5334077acba22c33e7f7d0a9fa08c92734e0ac8430d6e27  LICENSE-Community.txt
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index 22ca920e12..31ea972b8c 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGODB_VERSION_BASE = 4.0.12
+MONGODB_VERSION_BASE = 4.0.19
 MONGODB_VERSION = r$(MONGODB_VERSION_BASE)
 MONGODB_SITE = $(call github,mongodb,mongo,$(MONGODB_VERSION))
 

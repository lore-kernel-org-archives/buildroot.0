From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Oct 2019 21:31:50 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/mongodb: security
 bump to version 4.0.12
Message-ID: <20191002192640.BF4927FA2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2154509a8605ec949c009b936d8c2713488877e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes the following (low severity) security vulnerabilities:

4.0.9:

- CVE-2019-2386: After user deletion in MongoDB Server the improper
  invalidation of authorization sessions allows an authenticated user's
  session to persist and become conflated with new accounts, if those
  accounts reuse the names of deleted ones
  https://jira.mongodb.org/browse/SERVER-38984

4.0.11:

- CVE-2019-2389: Incorrect scoping of kill operations in MongoDB Server's
  packaged SysV init scripts allow users with write access to the PID file
  to insert arbitrary PIDs to be killed when the root user stops the MongoDB
  process via SysV init
  https://jira.mongodb.org/browse/SERVER-40563

- CVE-2019-2390: An unprivileged user or program on Microsoft Windows which
  can create OpenSSL configuration files in a fixed location may cause
  utility programs shipped with MongoDB server versions less than 4.0.11
  https://jira.mongodb.org/browse/SERVER-42233

Plus a number of other bugfixes. For details, see the release notes:
https://docs.mongodb.com/manual/release-notes/4.0/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 165e9c163c4d28025a5e1d3e5e6cfd0ad6476a7e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongodb/mongodb.hash | 2 +-
 package/mongodb/mongodb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongodb/mongodb.hash b/package/mongodb/mongodb.hash
index 916323d7c1..f08ffffe3b 100644
--- a/package/mongodb/mongodb.hash
+++ b/package/mongodb/mongodb.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256 5db85f06b2a0b2ae393339a4aed1366928aaef2b46c7c32826fa87c3217dc6f7  mongodb-r4.0.6.tar.gz
+sha256 b39c5b7bb77a547804ab6f43f9b5f09add47574356b31512fd1cc641a08b4ea5  mongodb-r4.0.12.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  APACHE-2.0.txt
 sha256 09d99ca61eb07873d5334077acba22c33e7f7d0a9fa08c92734e0ac8430d6e27  LICENSE-Community.txt
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index 53e1ce9963..22ca920e12 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGODB_VERSION_BASE = 4.0.6
+MONGODB_VERSION_BASE = 4.0.12
 MONGODB_VERSION = r$(MONGODB_VERSION_BASE)
 MONGODB_SITE = $(call github,mongodb,mongo,$(MONGODB_VERSION))
 

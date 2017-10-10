From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Oct 2017 17:56:58 +0200
Subject: [Buildroot] [git commit] audit: bump to version 2.7.8
Message-ID: <20171010155054.4658E80DE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99c92324512818ef5916a03a48086ad5262a5139
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit d1011f89a18 (audit: update legal info) set the libraries license
to "unclear" because of GPL license text in a few libraries source
files. Upstream audit package commit 239765162fa494 (Correct the
licensing description in lib/ and auparse/ to be LGPL as was always
intended) clarified the license in these files.

Add license files hashes.

Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/audit/audit.hash | 4 +++-
 package/audit/audit.mk   | 6 +++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/audit/audit.hash b/package/audit/audit.hash
index 189c982..32cedc5 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,2 +1,4 @@
 #Locally computed
-sha256 98e22549444c313187dc98c2e137f36a9882efa0874b559b0457e5f87ae178ef audit-2.7.7.tar.gz
+sha256 57b5ae5697f288b8e53286eacd1c6c2e88bd65db18df3d855332fc63b302fdae audit-2.7.8.tar.gz
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670 COPYING
+sha256 f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa COPYING.LIB
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 1398d9d..6c09477 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 2.7.7
+AUDIT_VERSION = 2.7.8
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
-AUDIT_LICENSE = GPL-2.0+ (programs), unclear (libraries)
-AUDIT_LICENSE_FILES = COPYING
+AUDIT_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
+AUDIT_LICENSE_FILES = COPYING COPYING.LIB
 
 AUDIT_INSTALL_STAGING = YES
 

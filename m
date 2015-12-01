From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 1 Dec 2015 10:42:12 +0000
Subject: [Buildroot] [PATCH] openldap: bump version to 2.4.43
Message-ID: <1448966532-21914-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump version to 2.4.43
- Use md5 and sha1 upstream provided hashes. This combination is
  stronger than a sha256 hash.
- Switch to an http download site to avoid problems with firewalls
  blocking the ftp.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/openldap/openldap.hash | 8 ++++----
 package/openldap/openldap.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/openldap/openldap.hash b/package/openldap/openldap.hash
index cca1e38..83e790f 100644
--- a/package/openldap/openldap.hash
+++ b/package/openldap/openldap.hash
@@ -1,4 +1,4 @@
-# From http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.41.sha1
-sha1  c6880df9fec928a5f010b78a4285b497e8a12d6b  openldap-2.4.41.tgz
-# Locally computed:
-sha256  27856bb4a8b44feca2b326c309000e16a9dadd52362c8ab6eec6c67a43737f6e  openldap-2.4.41.tgz
+# From http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.43.md5
+md5 49ca65e27891fcf977d78c10f073c705  openldap-2.4.43.tgz
+# From http://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.43.sha1
+sha1 3b52924df2f45e81f25ecbe37551bc837d090cfa  openldap-2.4.43.tgz
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index 4c3a71a..17bf991 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-OPENLDAP_VERSION = 2.4.41
+OPENLDAP_VERSION = 2.4.43
 OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
-OPENLDAP_SITE = ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release
+OPENLDAP_SITE = http://www.openldap.org/software/download/OpenLDAP/openldap-release
 OPENLDAP_LICENSE = OpenLDAP Public License
 OPENLDAP_LICENSE_FILES = LICENSE
 OPENLDAP_INSTALL_STAGING = YES
-- 
2.4.10

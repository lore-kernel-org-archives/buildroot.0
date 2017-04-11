From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 11 Apr 2017 11:01:41 +0100
Subject: [Buildroot] [PATCH] dovecot: bump version to 2.2.29 (security)
Message-ID: <20170411100141.1251-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Security fix:

  passdb/userdb dict: Don't double-expand %variables in keys. If dict
  was used as the authentication passdb, using specially crafted
  %variables in the username could be used to cause DoS (CVE-2017-2669)

Full ChangeLog:

  https://www.dovecot.org/list/dovecot-news/2017-April/000341.html

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/dovecot/dovecot.hash | 2 +-
 package/dovecot/dovecot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index b52ea8d..7b9cb1d 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,2 +1,2 @@
 # Locally computed after checking signature
-sha256 e0288f59e326ab87cb3881fdabadafe542f4dc7ab9996db13863a439ebbc1f25  dovecot-2.2.28.tar.gz
+sha256 d939ea99126eb8a8c6955390b422b6e27ec0fa43a3b59b2b3218cb5ad67139a6  dovecot-2.2.29.tar.gz
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index a7f6de4..566d099 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.2
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).28
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).29
 DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1
-- 
2.10.2

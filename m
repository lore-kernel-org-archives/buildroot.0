From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 21:01:12 +0200
Subject: [Buildroot] [git commit] dovecot: bump version to 2.2.29.1
	(security)
Message-ID: <20170412190131.8DF1D8263E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1a1f484a9a47f121c071d345fae4472b56bac81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Security fix:

  passdb/userdb dict: Don't double-expand %variables in keys. If dict
  was used as the authentication passdb, using specially crafted
  %variables in the username could be used to cause DoS (CVE-2017-2669)

Full ChangeLog 2.2.29 (including CVE fix):
  https://www.dovecot.org/list/dovecot-news/2017-April/000341.html

Full ChangeLog 2.2.29.1 (some fixes forgotten in the 2.2.29 release):

  https://www.dovecot.org/list/dovecot-news/2017-April/000344.html

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dovecot/dovecot.hash | 2 +-
 package/dovecot/dovecot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index b52ea8d..46e7c5a 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,2 +1,2 @@
 # Locally computed after checking signature
-sha256 e0288f59e326ab87cb3881fdabadafe542f4dc7ab9996db13863a439ebbc1f25  dovecot-2.2.28.tar.gz
+sha256 ccfa9ffb7eb91e9e87c21c108324b911250c9ffa838bffb64b1caafadcb0f388  dovecot-2.2.29.1.tar.gz
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index a7f6de4..3f71f68 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.2
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).28
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).29.1
 DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1

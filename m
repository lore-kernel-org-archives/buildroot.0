From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 20:12:02 +0200
Subject: [Buildroot] [git commit] package/netatalk: bump version to 3.1.11
Message-ID: <20170902180512.380E981DA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38745672c1b214ceee69bdbb24057c5c0f4936e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building 3.1.9 still fails after removing patch 0002:

volume.c:383:26: error: 'ldap_config_valid' undeclared (first use in this function)
                     if (!ldap_config_valid || vol->v_flags & AFPVOL_NONETIDS)

Bumping to 3.1.11 solves the problem.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netatalk/netatalk.hash | 6 +++---
 package/netatalk/netatalk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/netatalk/netatalk.hash b/package/netatalk/netatalk.hash
index 1b974f5..ce78373 100644
--- a/package/netatalk/netatalk.hash
+++ b/package/netatalk/netatalk.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.9/
-md5	d1d385ae6c3dc45eef4c923472f8fa5f	netatalk-3.1.9.tar.bz2
-sha1	ac746efc00e8cfbe5042a7835b27480bb83505cd	netatalk-3.1.9.tar.bz2
+# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.11/
+md5 8f79ce2a275b128ebb07188766f088fc  netatalk-3.1.11.tar.bz2
+sha1 5aa7900e6f7de3c7ee812aa1130c1245d1974586  netatalk-3.1.11.tar.bz2
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index e0085db..28a8750 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETATALK_VERSION = 3.1.9
+NETATALK_VERSION = 3.1.11
 NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
 # For 0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch

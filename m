From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat,  8 Jul 2017 16:34:33 +0200
Subject: [Buildroot] [PATCH] irssi: security bump to version 1.0.4
Message-ID: <20170708143433.29253-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the advisory:
https://irssi.org/security/irssi_sa_2017_07.txt

Two vulnerabilities have been located in Irssi.

(a) When receiving messages with invalid time stamps, Irssi would try
    to dereference a NULL pointer. Found by Brian 'geeknik' Carpenter
    of Geeknik Labs. (CWE-690)

    CVE-2017-10965 [2] was assigned to this bug

(b) While updating the internal nick list, Irssi may incorrectly use
    the GHashTable interface and free the nick while updating it. This
    will then result in use-after-free conditions on each access of
    the hash table. Found by Brian 'geeknik' Carpenter of Geeknik
    Labs. (CWE-416 caused by CWE-227)

    CVE-2017-10966 [3] was assigned to this bug

Impact
------

(a) May result in denial of service (remote crash).

(b) Undefined behaviour.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/irssi/irssi.hash | 2 +-
 package/irssi/irssi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/irssi/irssi.hash b/package/irssi/irssi.hash
index abb421998c..7b019025d8 100644
--- a/package/irssi/irssi.hash
+++ b/package/irssi/irssi.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	838220297dcbe7c8c42d01005059779a82f5b7b7e7043db37ad13f5966aff581	irssi-1.0.3.tar.xz
+sha256	b85c07dbafe178213eccdc69f5f8f0ac024dea01c67244668f91ec1c06b986ca	irssi-1.0.4.tar.xz
diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index ef9d0aafbd..d2b8169479 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IRSSI_VERSION = 1.0.3
+IRSSI_VERSION = 1.0.4
 IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.xz
 # Do not use the github helper here. The generated tarball is *NOT* the
 # same as the one uploaded by upstream for the release.
-- 
2.11.0

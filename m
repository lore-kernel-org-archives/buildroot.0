From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jul 2017 00:04:13 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] irssi: security bump to
	version 1.0.4
Message-ID: <20170720055507.6106A8219F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fed880a3c4cbfb059a780253ba1383437c56a69e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

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
(cherry picked from commit 9bf78446888ed3b98d893e70ce4f5e4679fd2ebb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/irssi/irssi.hash | 2 +-
 package/irssi/irssi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/irssi/irssi.hash b/package/irssi/irssi.hash
index abb4219..7b01902 100644
--- a/package/irssi/irssi.hash
+++ b/package/irssi/irssi.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	838220297dcbe7c8c42d01005059779a82f5b7b7e7043db37ad13f5966aff581	irssi-1.0.3.tar.xz
+sha256	b85c07dbafe178213eccdc69f5f8f0ac024dea01c67244668f91ec1c06b986ca	irssi-1.0.4.tar.xz
diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index 2b3bff4..4fef112 100644
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

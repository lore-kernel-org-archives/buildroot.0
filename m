From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  3 Jul 2019 17:52:13 +0200
Subject: [Buildroot] [PATCH] package/irssi: security bump to version 1.0.8
Message-ID: <20190703155213.15636-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security vulnerability:

CVE-2019-13045: Use after free when sending SASL login to the server found
by ilbelkyr

For more details, see the advisory:
https://irssi.org/security/html/irssi_sa_2019_06/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/irssi/irssi.hash | 2 +-
 package/irssi/irssi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/irssi/irssi.hash b/package/irssi/irssi.hash
index 0f298137ba..6a91e16487 100644
--- a/package/irssi/irssi.hash
+++ b/package/irssi/irssi.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	1b386ca026aa1875c380fd00ef1d24b71fb87cdae39ef5349ecca16c4567feac  irssi-1.0.7.tar.xz
+sha256	414fdee2ffaeb90a55f141b7fb3899608631dc891e2bc1f5e91ca31f1a621101  irssi-1.0.8.tar.xz
 # Locally calculated
 sha256	a1a27cb2ecee8d5378fbb3562f577104a445d6d66fee89286e16758305e63e2b  COPYING
diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index 611365f88e..4d7268d291 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IRSSI_VERSION = 1.0.7
+IRSSI_VERSION = 1.0.8
 IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.xz
 # Do not use the github helper here. The generated tarball is *NOT* the
 # same as the one uploaded by upstream for the release.
-- 
2.11.0

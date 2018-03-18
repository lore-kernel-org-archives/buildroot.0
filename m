From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Mar 2018 15:40:08 +0100
Subject: [Buildroot] [PATCH] irssi: security bump to version 1.0.7
Message-ID: <20180318144008.13997-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

Use after free when server is disconnected during netsplits.  Incomplete fix
of CVE-2017-7191.  Found by Joseph Bisch.  (CWE-416, CWE-825) -
CVE-2018-7054 [2] was assigned to this issue.

Use after free when SASL messages are received in unexpected order.  Found
by Joseph Bisch.  (CWE-416, CWE-691) - CVE-2018-7053 [3] was assigned to
this issue.

Null pointer dereference when an ?empty? nick has been observed by Irssi.
Found by Joseph Bisch.  (CWE-476, CWE-475) - CVE-2018-7050 [4] was assigned
to this issue.

When the number of windows exceed the available space, Irssi would crash due
to Null pointer dereference.  Found by Joseph Bisch.  (CWE-690) -
CVE-2018-7052 [5] was assigned to this issue.

Certain nick names could result in out of bounds access when printing theme
strings.  Found by Oss-Fuzz.  (CWE-126) - CVE-2018-7051 [6] was assigned to
this issue.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/irssi/irssi.hash | 2 +-
 package/irssi/irssi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/irssi/irssi.hash b/package/irssi/irssi.hash
index 83dde00352..0f298137ba 100644
--- a/package/irssi/irssi.hash
+++ b/package/irssi/irssi.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	029e884f3ebf337f7266d8ed4e1a035ca56d9f85015d74c868b488f279de8585  irssi-1.0.6.tar.xz
+sha256	1b386ca026aa1875c380fd00ef1d24b71fb87cdae39ef5349ecca16c4567feac  irssi-1.0.7.tar.xz
 # Locally calculated
 sha256	a1a27cb2ecee8d5378fbb3562f577104a445d6d66fee89286e16758305e63e2b  COPYING
diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index d49b5d7e46..611365f88e 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IRSSI_VERSION = 1.0.6
+IRSSI_VERSION = 1.0.7
 IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.xz
 # Do not use the github helper here. The generated tarball is *NOT* the
 # same as the one uploaded by upstream for the release.
-- 
2.11.0

From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  6 Jan 2017 12:10:30 +0100
Subject: [Buildroot] [PATCH] irssi: security bump to 0.8.21
Message-ID: <20170106111030.23080-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bugfixes:

- CVE-2017-5193: Correct a NULL pointer dereference in the nickcmp function
  found by Joseph Bisch (GL#1)

- CVE-2017-5194: Correct an error when receiving invalid nick message (GL#4,
  #466)

- CVE-2017-5195: Correct an out of bounds read in certain incomplete control
  codes found by Joseph Bisch (GL#2)

- CVE-2017-5196: Correct an out of bounds read in certain incomplete
  character sequences found by Hanno B?ck and independently by J.  Bisch
  (GL#3)

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/irssi/irssi.hash | 2 +-
 package/irssi/irssi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/irssi/irssi.hash b/package/irssi/irssi.hash
index 33b2d0e1d..b1048bf8f 100644
--- a/package/irssi/irssi.hash
+++ b/package/irssi/irssi.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	7882c4e821f5aac469c5e69e69d7e235f4986101285c675e81a9a95bfb20505a	irssi-0.8.20.tar.xz
+sha256	e433063b8714dcf17438126902c9a9d5c97944b3185ecd0fc5ae25c4959bf35a	irssi-0.8.21.tar.xz
diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index 0fb6fc792..e467f8989 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IRSSI_VERSION = 0.8.20
+IRSSI_VERSION = 0.8.21
 IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.xz
 # Do not use the github helper here. The generated tarball is *NOT* the
 # same as the one uploaded by upstream for the release.
-- 
2.11.0

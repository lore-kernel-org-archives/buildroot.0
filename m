From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Oct 2017 15:14:45 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] irssi: security bump to
	version 1.0.5
Message-ID: <20171026131015.A766181207@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fbb653713d89da1a1f032a8b30833a1aad29205
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes the following security issues:

(a) When installing themes with unterminated colour formatting
    sequences, Irssi may access data beyond the end of the
    string. (CWE-126) Found by Hanno B??ck.

    CVE-2017-15228 was assigned to this issue.

(b) While waiting for the channel synchronisation, Irssi may
    incorrectly fail to remove destroyed channels from the query list,
    resulting in use after free conditions when updating the state
    later on. Found by Joseph Bisch. (CWE-416 caused by CWE-672)

    CVE-2017-15227 was assigned to this issue.

(c) Certain incorrectly formatted DCC CTCP messages could cause NULL
    pointer dereference. Found by Joseph Bisch. This is a separate,
    but similar issue to CVE-2017-9468. (CWE-690)

    CVE-2017-15721 was assigned to this issue.

(d) Overlong nicks or targets may result in a NULL pointer dereference
    while splitting the message. Found by Joseph Bisch. (CWE-690)

    CVE-2017-15723 was assigned to this issue.

(e) In certain cases Irssi may fail to verify that a Safe channel ID
    is long enough, causing reads beyond the end of the string. Found
    by Joseph Bisch. (CWE-126)

    CVE-2017-15722 was assigned to this issue.

For more details, see the advisory:
https://irssi.org/security/irssi_sa_2017_10.txt

While we're at it, also add a hash for the license file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a9a4ec0dcce4500319e00e7d875414d6bc6606fa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/irssi/irssi.hash | 4 +++-
 package/irssi/irssi.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/irssi/irssi.hash b/package/irssi/irssi.hash
index 7b01902..0a6c3f6 100644
--- a/package/irssi/irssi.hash
+++ b/package/irssi/irssi.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	b85c07dbafe178213eccdc69f5f8f0ac024dea01c67244668f91ec1c06b986ca	irssi-1.0.4.tar.xz
+sha256	c2556427e12eb06cabfed40839ac6f57eb8b1aa6365fab6dfcd331b7a04bb914  irssi-1.0.5.tar.xz
+# Locally calculated
+sha256	a1a27cb2ecee8d5378fbb3562f577104a445d6d66fee89286e16758305e63e2b  COPYING
diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index 4fef112..3ea81a9 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IRSSI_VERSION = 1.0.4
+IRSSI_VERSION = 1.0.5
 IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.xz
 # Do not use the github helper here. The generated tarball is *NOT* the
 # same as the one uploaded by upstream for the release.

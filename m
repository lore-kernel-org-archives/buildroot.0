From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 10:00:18 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] c-ares: security bump to
	version 1.13.0
Message-ID: <20170626081043.BE26F7F9F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e0efd193d279216a6c46b2f75159119a347c396
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes the following security issues:

CVE-2017-1000381: The c-ares function `ares_parse_naptr_reply()`, which is
used for parsing NAPTR responses, could be triggered to read memory outside
of the given input buffer if the passed in DNS response packet was crafted
in a particular way.

https://c-ares.haxx.se/adv_20170620.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit d1481fe47493546171ff8f9949e95299c5359d8e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/c-ares/c-ares.hash | 2 +-
 package/c-ares/c-ares.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index f46ef02..79928ae 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 8692f9403cdcdf936130e045c84021665118ee9bfea905d1a76f04d4e6f365fb c-ares-1.12.0.tar.gz
+sha256 03f708f1b14a26ab26c38abd51137640cb444d3ec72380b21b20f1a8d2861da7 c-ares-1.13.0.tar.gz
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index e817d4a..72019a0 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.12.0
+C_ARES_VERSION = 1.13.0
 C_ARES_SITE = http://c-ares.haxx.se/download
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Dec 2018 21:12:17 +0100
Subject: [Buildroot] [git commit] package/asterisk: security bump to version
 16.1.0
Message-ID: <20181226200747.7E328838DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d3548cf4696b12d7059962328249bf0a4a62955
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- ASTERISK-28127: Buffer overflow for DNS SRV/NAPTR records
  https://issues.asterisk.org/jira/browse/ASTERISK-28127

- ASTERISK-28013: res_http_websocket: Crash when reading HTTP Upgrade
  requests
  https://issues.asterisk.org/jira/browse/ASTERISK-28013

For more details, see the announcement:
https://www.asterisk.org/downloads/asterisk-news/asterisk-1610-now-available

Asterisk now also contains m4 code needed to autoreconf under
third-party/jansson, so add that to _AUTORECONF_OPTS.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 4b3a087ec5..557660f0cf 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  54f8b172fa41cb7d4450c12666a8f9716ed7ba7391c54d3467c64772f6399d67  asterisk-16.0.0.tar.gz
+sha256  97e1bae8e9034cb2a8bc0d4d5bcc9dee4ffe4c6c57ed40b8825be79266fcac50  asterisk-16.1.0.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 8a46438f92..90f415647e 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 16.0.0
+ASTERISK_VERSION = 16.1.0
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
@@ -23,7 +23,7 @@ ASTERISK_LICENSE_FILES = \
 
 # For patches 0002, 0003 and 0005
 ASTERISK_AUTORECONF = YES
-ASTERISK_AUTORECONF_OPTS = -Iautoconf -Ithird-party -Ithird-party/pjproject
+ASTERISK_AUTORECONF_OPTS = -Iautoconf -Ithird-party -Ithird-party/pjproject -Ithird-party/jansson
 
 ASTERISK_DEPENDENCIES = \
 	host-asterisk \

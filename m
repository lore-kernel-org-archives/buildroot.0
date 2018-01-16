From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Jan 2018 17:45:09 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] asterisk: security bump
 to version 14.7.5
Message-ID: <20180116194020.77EC383E43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4fb281dbb8e47ff4b02b415228ae03c8d6b9ee52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

Fixes the following security issues:

* AST-2017-014: Crash in PJSIP resource when missing a contact header A
  select set of SIP messages create a dialog in Asterisk.  Those SIP
  messages must contain a contact header.  For those messages, if the header
  was not present and using the PJSIP channel driver, it would cause
  Asterisk to crash.  The severity of this vulnerability is somewhat
  mitigated if authentication is enabled.  If authentication is enabled a
  user would have to first be authorized before reaching the crash point.

For more details, see the announcement:
https://www.asterisk.org/downloads/asterisk-news/asterisk-13185-1475-1515-and-1318-cert2-now-available-security

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 4f13dc362d5c9c63fb5a21ede7cf902c1281cef0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index d1667ac..f537c2d 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  f85f6df802de485d9b8cb1bfa5493e22f6401dce8246646af9506489a264d7b1  asterisk-14.6.2.tar.gz
+sha256  6525170fa16fecb08cb3cde2c1bd5d3140df55b14e4561ac0771fbd1e04b3b75  asterisk-14.7.5.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index da78b25..fc9a961 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 14.6.2
+ASTERISK_VERSION = 14.7.5
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))

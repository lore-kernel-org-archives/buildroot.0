From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Aug 2019 15:55:59 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/asterisk:
 security bump to version 16.4.1
Message-ID: <20190820135225.2C8B6817F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ed3c6368d864467fef9b9a53b622c97e7247d5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes the following security issues:

CVE-2019-12827: A specially crafted SIP in-dialog MESSAGE message can cause
Asterisk to crash:

https://downloads.asterisk.org/pub/security/AST-2019-002.html

CVE-2019-13161: When T.38 faxing is done in Asterisk a T.38 reinvite may be
sent to an endpoint to switch it to T.38.  If the endpoint responds with an
improperly formatted SDP answer including both a T.38 UDPTL stream and an
audio or video stream containing only codecs not allowed on the SIP peer or
user a crash will occur.  The code incorrectly assumes that there will be at
least one common codec when T.38 is also in the SDP answer:

https://downloads.asterisk.org/pub/security/AST-2019-003.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2cb389deca5477f4de787f45bfe4d8b86fdf828c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index d8cc56695c..dd1e1db327 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  c022e9d5410ed94ab1aa51ba1e2a8b196f0dfa15bcd0bd545d06efee4c786578  asterisk-16.2.1.tar.gz
+sha256  8cabb7a6ad2c35b7fb5c520977f2b2c18b471e5b825b65dc411744c6bed2b9f8  asterisk-16.4.1.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 65f8d3fdf9..53dd593678 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 16.2.1
+ASTERISK_VERSION = 16.4.1
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))

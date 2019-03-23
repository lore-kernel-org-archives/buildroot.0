From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Mar 2019 17:54:27 +0100
Subject: [Buildroot] [PATCH] package/asterisk: security bump to version
 16.2.1
Message-ID: <20190323165427.29835-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issue:

AST-2019-001: Remote crash vulnerability with SDP protocol violation
When Asterisk makes an outgoing call, a very specific SDP protocol violation
by the remote party can cause Asterisk to crash (CVE-2019-7251)

https://downloads.asterisk.org/pub/security/AST-2019-001.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index e126372f57..d8cc56695c 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  d74ba84ad92cd710eb071940e6057ef644d71864431d91aaafe0717a8939afc3  asterisk-16.1.1.tar.gz
+sha256  c022e9d5410ed94ab1aa51ba1e2a8b196f0dfa15bcd0bd545d06efee4c786578  asterisk-16.2.1.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 3b4d97a258..65f8d3fdf9 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 16.1.1
+ASTERISK_VERSION = 16.2.1
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
-- 
2.11.0

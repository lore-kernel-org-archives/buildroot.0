From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Dec 2018 22:29:18 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/asterisk:
 security bump version to 14.7.8
Message-ID: <20181223212606.953C3827E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efb4c2ffcc1c1a89529ca77e2504530bd5f30682
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes the following security issues:

AST-2018-009: Remote crash vulnerability in HTTP websocket upgrade
There is a stack overflow vulnerability in the res_http_websocket.so module of
Asterisk that allows an attacker to crash Asterisk via a specially crafted
HTTP request to upgrade the connection to a websocket. The attacker???s
request causes Asterisk to run out of stack space and crash.

For more details, see the announcement:
https://www.asterisk.org/downloads/asterisk-news/asterisk-13231-1478-1561-and-1321-cert3-now-available-security-release

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Peter: mark as security fix, extend commit message]
(cherry picked from commit 19b64c22862e81e9a2757aac72af70ea43c3028d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index a3e9d10aff..2449aeb4d1 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  249cf223ef4dd7aea01f0d250a6b9cad661ebd78910c73adb7f59c1c46f9fed8  asterisk-14.7.6.tar.gz
+sha256  41c99bd2236af95d056e15f9d044c28b69e00935e67791b18fa70b0614402012  asterisk-14.7.8.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 28b85da562..b5a73ed766 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 14.7.6
+ASTERISK_VERSION = 14.7.8
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))

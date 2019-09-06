From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  6 Sep 2019 17:46:55 +0200
Subject: [Buildroot] [PATCH] package/asterisk: security bump to version
 16.5.1
Message-ID: <20190906154656.10935-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

AST-2019-004: Crash when negotiating for T.38 with a declined stream
When Asterisk sends a re-invite initiating T.38 faxing, and the endpoint
responds with a declined media stream a crash will then occur in Asterisk.
https://downloads.asterisk.org/pub/security/AST-2019-004.pdf

AST-2019-005: Remote Crash Vulnerability in audio transcoding
When audio frames are given to the audio transcoding support in Asterisk the
number of samples are examined and as part of this a message is output to
indicate that no samples are present. A change was done to suppress this
message for a particular scenario in which the message was not relevant. This
change assumed that information about the origin of a frame will always exist
when in reality it may not.
https://downloads.asterisk.org/pub/security/AST-2019-005.pdf

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 588550a000..1184e4333d 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  f950da848c387be9e3de24f1d0f4fa7b3924471c382192424dbe0997a5e3a3f7  asterisk-16.5.0.tar.gz
+sha256  122ecf242e06da373488024e0c76154f2404d024d09eed20b23cae0795033380  asterisk-16.5.1.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index cfe50c969c..1f3061b450 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 16.5.0
+ASTERISK_VERSION = 16.5.1
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
-- 
2.11.0

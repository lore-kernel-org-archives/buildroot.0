From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Nov 2020 21:57:20 +0100
Subject: [Buildroot] [git commit branch/next] package/asterisk: security
 bump to version 16.14.1
Message-ID: <20201117203828.9981381590@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=339d3e82e8e121204523829bb0900fce4b99c923
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes the following security issues:

- AST-2020-001: Remote crash in res_pjsip_session
  Upon receiving a new SIP Invite, Asterisk did not return the created
  dialog locked or referenced.

- AST-2020-002: Outbound INVITE loop on challenge with different nonce
  If Asterisk is challenged on an outbound INVITE and the nonce is changed
  in each response, Asterisk will continually send INVITEs in a loop.  This
  causes Asterisk to consume more and more memory since the transaction will
  never terminate (even if the call is hung up), ultimately leading to a
  restart or shutdown of Asterisk.  Outbound authentication must be
  configured on the endpoint for this to occur.

For details, see the announcement:
https://www.asterisk.org/asterisk-news/asterisk-13-37-1-16-14-1-17-8-1-18-0-1-and-16-8-cert5-now-available-security/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 1bb5da7d06..bd83636271 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  5ebefa6387f89695361b8c105e2ad7ee6381f87a99012aeb85b886ddf6d518ac  asterisk-16.13.0.tar.gz
+sha256  226eaef400d2d335ce29d7b3c8aca8dfdfc5e854c215e0c47615c095ced12171  asterisk-16.14.1.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index b9e2b80dd5..fb3eb6ec8a 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 16.13.0
+ASTERISK_VERSION = 16.14.1
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))

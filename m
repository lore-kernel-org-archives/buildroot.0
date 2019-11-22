From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2019 23:55:31 +0100
Subject: [Buildroot] [PATCH] package/asterisk: security bump to version
 16.6.2
Message-ID: <20191122225531.28518-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security vulnerabilities:

AST-2019-006: SIP request can change address of a SIP peer.
A SIP request can be sent to Asterisk that can change a SIP peer?s IP
address.  A REGISTER does not need to occur, and calls can be hijacked as a
result.  The only thing that needs to be known is the peer?s name;
authentication details such as passwords do not need to be known.  This
vulnerability is only exploitable when the ?nat? option is set to the
default, or ?auto_force_rport?.

https://downloads.asterisk.org/pub/security/AST-2019-006.pdf

AST-2019-007: AMI user could execute system commands.
A remote authenticated Asterisk Manager Interface (AMI) user without
?system? authorization could use a specially crafted ?Originate? AMI request
to execute arbitrary system commands.

https://downloads.asterisk.org/pub/security/AST-2019-007.pdf

AST-2019-008: Re-invite with T.38 and malformed SDP causes crash.
If Asterisk receives a re-invite initiating T.38 faxing and has a port of 0
and no c line in the SDP, a crash will occur.

https://downloads.asterisk.org/pub/security/AST-2019-008.pdf

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 4cb4a42e19..26aa4b89b7 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  9323f1fd41416d2d997015b2199d5507847e54da64c2e24923d75f5c283c5e83  asterisk-16.6.1.tar.gz
+sha256  474cbc6f9dddee94616f8af8e097bc4d340dc9698c4165dc45be6e0be80ff725  asterisk-16.6.2.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 6f94f628a4..00070aadba 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 16.6.1
+ASTERISK_VERSION = 16.6.2
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
-- 
2.20.1

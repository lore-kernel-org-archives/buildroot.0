From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 10:48:16 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/asterisk:
 security bump to version 16.6.2
Message-ID: <20191203094345.ADD8683BF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7de477493571b94005524ec6cd8bf6391e212943
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security vulnerabilities:

AST-2019-006: SIP request can change address of a SIP peer.
A SIP request can be sent to Asterisk that can change a SIP peer???s IP
address.  A REGISTER does not need to occur, and calls can be hijacked as a
result.  The only thing that needs to be known is the peer???s name;
authentication details such as passwords do not need to be known.  This
vulnerability is only exploitable when the ???nat??? option is set to the
default, or ???auto_force_rport???.

https://downloads.asterisk.org/pub/security/AST-2019-006.pdf

AST-2019-007: AMI user could execute system commands.
A remote authenticated Asterisk Manager Interface (AMI) user without
???system??? authorization could use a specially crafted ???Originate??? AMI request
to execute arbitrary system commands.

https://downloads.asterisk.org/pub/security/AST-2019-007.pdf

AST-2019-008: Re-invite with T.38 and malformed SDP causes crash.
If Asterisk receives a re-invite initiating T.38 faxing and has a port of 0
and no c line in the SDP, a crash will occur.

https://downloads.asterisk.org/pub/security/AST-2019-008.pdf

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b3aaa725f1642bb3d2448b889b1674c7f79afcd9)
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

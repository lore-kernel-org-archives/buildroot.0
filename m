From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Apr 2019 14:24:36 +0200
Subject: [Buildroot] [git commit] package/wpa_supplicant: add upstream
 2019-5 security patches
Message-ID: <20190427121956.DC7D681DD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c21edddec9043617f9a1d7fe8ad8ea1770846b82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security vulnerabilities:

EAP-pwd implementation in hostapd (EAP server) and wpa_supplicant (EAP
peer) was discovered not to validate fragmentation reassembly state
properly for a case where an unexpected fragment could be received. This
could result in process termination due to NULL pointer dereference.

For details, see the advisory:
https://w1.fi/security/2019-5/eap-pwd-message-reassembly-issue-with-unexpected-fragment.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpa_supplicant/wpa_supplicant.hash | 2 ++
 package/wpa_supplicant/wpa_supplicant.mk   | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.hash b/package/wpa_supplicant/wpa_supplicant.hash
index 2e6cd6f226..2da15f7f5d 100644
--- a/package/wpa_supplicant/wpa_supplicant.hash
+++ b/package/wpa_supplicant/wpa_supplicant.hash
@@ -14,4 +14,6 @@ sha256  ff8d6d92ad4b01987be63cdaf67a24d2eba5b3cd654f37664a8a198e501c0e3b  0011-E
 sha256  d5ebf4e5a810e9a0c035f9268195c542273998ea70fd58697ee25965094062cc  0012-EAP-pwd-server-Detect-reflection-attacks.patch
 sha256  7156656498f03b24a0b69a26a59d17a9fcc8e76761f1dabe6d13b4176ffd2ef8  0013-EAP-pwd-client-Verify-received-scalar-and-element.patch
 sha256  69926854ec2a79dada290f79f04202764c5d6400d232e3a567ebe633a02c1c66  0014-EAP-pwd-Check-element-x-y-coordinates-explicitly.patch
+sha256	cba82a051a39c48872250b2e85ca8ebc628cfe75a9ccec29f3e994abd4156152  0001-EAP-pwd-server-Fix-reassembly-buffer-handling.patch
+sha256	dc0e015463e1fd1f230795e1a49ddd1b9d00e726cd9f38846d0f4892d7978162  0003-EAP-pwd-peer-Fix-reassembly-buffer-handling.patch
 sha256  76eeecd8fc291a71f29189ea20e6a34387b8048a959cbc6a65c41b98194643a2  README
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 4c80cd2d03..a518ecc217 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -20,7 +20,9 @@ WPA_SUPPLICANT_PATCH = \
 	https://w1.fi/security/2019-4/0011-EAP-pwd-server-Verify-received-scalar-and-element.patch \
 	https://w1.fi/security/2019-4/0012-EAP-pwd-server-Detect-reflection-attacks.patch \
 	https://w1.fi/security/2019-4/0013-EAP-pwd-client-Verify-received-scalar-and-element.patch \
-	https://w1.fi/security/2019-4/0014-EAP-pwd-Check-element-x-y-coordinates-explicitly.patch
+	https://w1.fi/security/2019-4/0014-EAP-pwd-Check-element-x-y-coordinates-explicitly.patch \
+	https://w1.fi/security/2019-5/0001-EAP-pwd-server-Fix-reassembly-buffer-handling.patch \
+	https://w1.fi/security/2019-5/0003-EAP-pwd-peer-Fix-reassembly-buffer-handling.patch
 WPA_SUPPLICANT_LICENSE = BSD-3-Clause
 WPA_SUPPLICANT_LICENSE_FILES = README
 WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config

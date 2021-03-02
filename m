From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  2 Mar 2021 22:59:43 +0100
Subject: [Buildroot] [PATCH] package/wpa_supplicant: add upstream 2021-1
 security fix
Message-ID: <20210302215943.14131-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issue:

- wpa_supplicant P2P provision discovery processing vulnerability (no CVE
  yet)

A vulnerability was discovered in how wpa_supplicant processes P2P
(Wi-Fi Direct) provision discovery requests. Under a corner case
condition, an invalid Provision Discovery Request frame could end up
reaching a state where the oldest peer entry needs to be removed. With
a suitably constructed invalid frame, this could result in use
(read+write) of freed memory. This can result in an attacker within
radio range of the device running P2P discovery being able to cause
unexpected behavior, including termination of the wpa_supplicant process
and potentially code execution.

For more details, see the advisory:
https://w1.fi/security/2021-1/wpa_supplicant-p2p-provision-discovery-processing-vulnerability.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpa_supplicant/wpa_supplicant.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wpa_supplicant/wpa_supplicant.hash b/package/wpa_supplicant/wpa_supplicant.hash
index cce465d849..2387391a3c 100644
--- a/package/wpa_supplicant/wpa_supplicant.hash
+++ b/package/wpa_supplicant/wpa_supplicant.hash
@@ -2,3 +2,4 @@
 sha256  fcbdee7b4a64bea8177973299c8c824419c413ec2e3a95db63dd6a5dc3541f17  wpa_supplicant-2.9.tar.gz
 sha256  9da5dd0776da266b180b915e460ff75c6ff729aca1196ab396529510f24f3761  README
 sha256  c4d65cc13863e0237d0644198558e2c47b4ed91e2b2be4516ff590724187c4a5  0001-P2P-Fix-copying-of-secondary-device-types-for-P2P-gr.patch
+sha256  7f40cfec5faf5e927ea9028ab9392cd118685bde7229ad24210caf0a8f6e9611  0001-P2P-Fix-a-corner-case-in-peer-addition-based-on-PD-R.patch
-- 
2.20.1

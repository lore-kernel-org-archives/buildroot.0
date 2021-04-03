From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Apr 2021 13:42:20 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/wpa_supplicant:
 annotate CVE-2021-27803
Message-ID: <20210403112726.CCF27882A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=968f2e90d0c17aa75d281e1dc640a25b1b490f83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Add a WPA_SUPPLICANT_IGNORE_CVES entry for CVE-2021-27803 which was
fixed by commit 9ada4eb2f1c3d67ee49f6f5466738bcd821fc647, which we
have backported as
0001-P2P-Fix-a-corner-case-in-peer-addition-based-on-PD-R.patch.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1a7cf592a834357c5777e452f0b7ab7652e7d389)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 284ea06096..46def443e6 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -23,6 +23,9 @@ WPA_SUPPLICANT_SELINUX_MODULES = networkmanager
 # 0001-AP-Silently-ignore-management-frame-from-unexpected-.patch
 WPA_SUPPLICANT_IGNORE_CVES += CVE-2019-16275
 
+# 0001-P2P-Fix-a-corner-case-in-peer-addition-based-on-PD-R.patch
+WPA_SUPPLICANT_IGNORE_CVES += CVE-2021-27803
+
 # install the wpa_client library
 WPA_SUPPLICANT_INSTALL_STAGING = YES
 

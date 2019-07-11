From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 11 Jul 2019 16:01:29 +0200
Subject: [Buildroot] [git commit] package/hostapd: add debug information
 options
Message-ID: <20190711140011.3EBAC80F9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cb9e7ca428dc961959c373410e4792f2684aa39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

hostapd 2.7 added compile time options to include
redirecting the output from stdout to a file or syslog
like wpa_supplicant

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/hostapd/hostapd.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 550f887206..e6542c879c 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -31,7 +31,10 @@ HOSTAPD_LICENSE = BSD-3-Clause
 HOSTAPD_LICENSE_FILES = README
 HOSTAPD_CONFIG_SET =
 
-HOSTAPD_CONFIG_ENABLE = CONFIG_INTERNAL_LIBTOMMATH
+HOSTAPD_CONFIG_ENABLE = \
+	CONFIG_INTERNAL_LIBTOMMATH \
+	CONFIG_DEBUG_FILE \
+	CONFIG_DEBUG_SYSLOG
 
 HOSTAPD_CONFIG_DISABLE =
 

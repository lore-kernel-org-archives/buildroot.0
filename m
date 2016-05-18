From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 18 May 2016 21:28:43 +0200
Subject: [Buildroot] [PATCH] aircrack-ng: mention script dependencies in the
	help text
Message-ID: <1463599723-12836-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

aircrack-ng has some scripts (airmon-ng, airmon-zc) that use external
tools for their functionality. We don't select the corresponding
packages because some of the other aircrack-ng tools don't need these
at all.

Still, the user should be informed of this. So update the help text to
refer to all packages used by the scripts:
- ethtool
- iw
- rfkill
- util-linux for lspci and lsusb (script uses options not available in
  busybox)
- wireless_tools for iwconfig and iwpriv

See also bug #8936

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: lipkegu at gmail.com
---
 package/aircrack-ng/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
index bb100b8..00ce4e4 100644
--- a/package/aircrack-ng/Config.in
+++ b/package/aircrack-ng/Config.in
@@ -10,6 +10,9 @@ config BR2_PACKAGE_AIRCRACK_NG
 	help
 	  A set of tools for auditing wireless networks
 
+	  For complete functionality, also select ethtool, iw, rfkill,
+	  util-linux utilities, and wireless_tools.
+
 	  http://www.aircrack-ng.org/
 
 comment "aircrack-ng needs a toolchain w/ threads"
-- 
2.8.1

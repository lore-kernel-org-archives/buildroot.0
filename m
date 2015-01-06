From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  6 Jan 2015 08:06:42 -0300
Subject: [Buildroot] [PATCH] sofia-sip: needs threads
Message-ID: <1420542402-15545-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/1e8/1e8c466b7a65b8e70f3318ab1a5bad79468f5efd

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sofia-sip/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/sofia-sip/Config.in b/package/sofia-sip/Config.in
index 9e42ff7..24e2148 100644
--- a/package/sofia-sip/Config.in
+++ b/package/sofia-sip/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SOFIA_SIP
 	bool "sofia-sip"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Sofia-SIP is an open-source SIP User-Agent library,
 	  compliant with the IETF RFC3261 specification (see the
@@ -8,3 +9,6 @@ config BR2_PACKAGE_SOFIA_SIP
 	  real-time and person-to-person communication services.
 
 	  http://sofia-sip.sourceforge.net/
+
+comment "sofia-sip needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.0.5

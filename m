From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  6 Jan 2015 07:35:41 -0300
Subject: [Buildroot] [PATCH 2/2] package/strongswan: add tools option
	deprecation notice
In-Reply-To: <1420540541-11989-1-git-send-email-gustavo@zacarias.com.ar>
References: <1420540541-11989-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1420540541-11989-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's now a split option with pki and scep, with some other tools being
deprecated upstream so select both when tools was selected to get as
close as possible.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in.legacy | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index de2c0ba..69608c7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -102,6 +102,16 @@ endif
 
 comment "Legacy options removed in 2015.02"
 
+config BR2_PACKAGE_STRONGSWAN_TOOLS
+	bool "strongswan option has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_STRONGSWAN_PKI
+	select BR2_PACKAGE_STRONGSWAN_SCEP
+	help
+	  The tools option has been removed upstream and the different tools
+	  have been split between the pki and scep options, with others
+	  deprecated.
+
 config BR2_PACKAGE_XBMC_ADDON_XVDR
 	bool "xbmc options have been renamed"
 	select BR2_LEGACY
-- 
2.0.5

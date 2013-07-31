From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 31 Jul 2013 10:31:47 -0300
Subject: [Buildroot] [PATCH 2/2] strongswan: scripts need charon or tools
In-Reply-To: <1375277507-30647-1-git-send-email-gustavo@zacarias.com.ar>
References: <1375277507-30647-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1375277507-30647-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/007/007e75362cbe4693e36d5a7ab96c539d1f3b00fc/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/strongswan/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 98f8da2..e8cd1c4 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -110,6 +110,7 @@ config BR2_PACKAGE_STRONGSWAN_TOOLS
 
 config BR2_PACKAGE_STRONGSWAN_SCRIPTS
 	bool "Enable additional utilities (found in directory scripts)"
+	depends on BR2_PACKAGE_STRONGSWAN_CHARON || BR2_PACKAGE_STRONGSWAN_TOOLS
 	default y
 
 endif
-- 
1.8.1.5

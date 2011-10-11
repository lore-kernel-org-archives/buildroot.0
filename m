From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Oct 2011 11:02:53 -0300
Subject: [Buildroot] [PATCH 2/5] sed: show it in config menu when toolchain
	lacks wchar
In-Reply-To: <1318341776-19358-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318341776-19358-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318341776-19358-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sed/Config.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/sed/Config.in b/package/sed/Config.in
index 950701c..1430915 100644
--- a/package/sed/Config.in
+++ b/package/sed/Config.in
@@ -6,4 +6,5 @@ config BR2_PACKAGE_SED
 
 	  http://sed.sourceforge.net/
 
-	  Most people will answer Y.
+comment "sed requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
-- 
1.7.3.4

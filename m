From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Oct 2011 11:02:56 -0300
Subject: [Buildroot] [PATCH 5/5] cvs: show it in config menu when toolchain
	lacks wchar
In-Reply-To: <1318341776-19358-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318341776-19358-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318341776-19358-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cvs/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/cvs/Config.in b/package/cvs/Config.in
index 2e61834..f9d5955 100644
--- a/package/cvs/Config.in
+++ b/package/cvs/Config.in
@@ -12,3 +12,6 @@ config BR2_PACKAGE_CVS_SERVER
 	depends on BR2_PACKAGE_CVS
 	help
 	  Enable cvs server code
+
+comment "cvs requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
-- 
1.7.3.4

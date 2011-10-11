From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Oct 2011 11:02:52 -0300
Subject: [Buildroot] [PATCH 1/5] gawk: show it in config menu when toolchain
	lacks wchar
Message-ID: <1318341776-19358-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gawk/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/gawk/Config.in b/package/gawk/Config.in
index 62ca860..82c970f 100644
--- a/package/gawk/Config.in
+++ b/package/gawk/Config.in
@@ -7,3 +7,6 @@ config BR2_PACKAGE_GAWK
 	  with just a few lines of code.
 
 	  http://www.gnu.org/software/gawk/
+
+comment "gawk requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
-- 
1.7.3.4

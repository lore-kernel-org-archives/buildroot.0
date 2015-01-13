From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 Jan 2015 20:17:00 -0300
Subject: [Buildroot] [PATCH 5/7] rsyslog: doesn't need largefile/wchar
In-Reply-To: <1421191022-5509-1-git-send-email-gustavo@zacarias.com.ar>
References: <1421191022-5509-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1421191022-5509-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This was added in 9b4696a4 but only partially removed in d89a2610
leading to a comment and the rsyslog option both being present in the
config menu if we're using a non-LFS toolchain.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rsyslog/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rsyslog/Config.in b/package/rsyslog/Config.in
index 69425f1..1f94104 100644
--- a/package/rsyslog/Config.in
+++ b/package/rsyslog/Config.in
@@ -11,6 +11,6 @@ config BR2_PACKAGE_RSYSLOG
 
 	  http://www.rsyslog.com
 
-comment "rsyslog needs a toolchain w/ largefile, wchar, threads"
+comment "rsyslog needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.0.5

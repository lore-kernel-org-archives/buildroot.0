From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Mar 2015 20:01:03 -0300
Subject: [Buildroot] [PATCH 3/3] gdb: deprecate version 7.7.x
In-Reply-To: <1427410863-7574-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427410863-7574-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427410863-7574-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that 7.9 was added and 7.8.x is default we don't want to have a
dozen versions so mark it as deprecated.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gdb/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 3a0baa1..6b0ca9b 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -33,6 +33,7 @@ choice
 
 	config BR2_GDB_VERSION_7_7
 		bool "gdb 7.7.x"
+		depends on BR2_DEPRECATED_SINCE_2015_05
 
 	config BR2_GDB_VERSION_7_8
 		bool "gdb 7.8.x"
-- 
2.0.5

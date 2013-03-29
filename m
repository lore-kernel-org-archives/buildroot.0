From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 29 Mar 2013 08:19:51 -0300
Subject: [Buildroot] [PATCH 2/6] orc: needs threads
In-Reply-To: <1364555995-32259-1-git-send-email-gustavo@zacarias.com.ar>
References: <1364555995-32259-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1364555995-32259-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/b44c09c7ca81b16267ad653e65f52c4e5ec7b36f/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/orc/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/orc/Config.in b/package/orc/Config.in
index 1de0f23..022c455 100644
--- a/package/orc/Config.in
+++ b/package/orc/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_ORC
 	bool "orc"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Orc is a library and set of tools for compiling and executing
 	  very simple programs that operate on arrays of data.
 
 	  http://code.entropywave.com/projects/orc/
+
+comment "orc requires a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.5

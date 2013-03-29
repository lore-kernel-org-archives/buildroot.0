From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 29 Mar 2013 08:19:54 -0300
Subject: [Buildroot] [PATCH 5/6] socat: needs threads
In-Reply-To: <1364555995-32259-1-git-send-email-gustavo@zacarias.com.ar>
References: <1364555995-32259-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1364555995-32259-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/d2231d0db9cebfa77739a229513035ed6814f34c/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/socat/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/socat/Config.in b/package/socat/Config.in
index ae88be9..c478282 100644
--- a/package/socat/Config.in
+++ b/package/socat/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_SOCAT
 	bool "socat"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Multipurpose socket relay program.
 
 	  http://www.dest-unreach.org/socat/
+
+comment "socat requires a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.5

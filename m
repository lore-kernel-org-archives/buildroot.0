From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 May 2013 12:28:19 -0300
Subject: [Buildroot] [PATCH] erlang: needs mmu
Message-ID: <1367854099-21270-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/5b3411008ddf89aef55c8dd8682b894cf9860d13/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/erlang/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/erlang/Config.in b/package/erlang/Config.in
index 6dd5a39..6920db6 100644
--- a/package/erlang/Config.in
+++ b/package/erlang/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ERLANG
 	bool "erlang"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Erlang is a programming language used to build massively scalable
 	  soft real-time systems with requirements on high availability.
-- 
1.8.1.5

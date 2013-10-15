From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 15 Oct 2013 09:50:31 -0300
Subject: [Buildroot] [PATCH] autossh: add ssh client/server depends
Message-ID: <1381841431-24324-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's not very useful without them.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/autossh/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/autossh/Config.in b/package/autossh/Config.in
index e3acd8a..6d1a085 100644
--- a/package/autossh/Config.in
+++ b/package/autossh/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_AUTOSSH
 	bool "autossh"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_DROPBEAR || BR2_PACKAGE_OPENSSH
 	help
 	  autossh is a program to start a copy of ssh and monitor it,
 	  restarting it as necessary should it die or stop passing traffic.
-- 
1.8.1.5

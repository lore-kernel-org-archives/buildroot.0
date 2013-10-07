From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  7 Oct 2013 18:02:15 -0300
Subject: [Buildroot] [PATCHv2] lighttpd: fix build failure without ipv6
Message-ID: <1381179735-21272-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reported in https://bugs.gentoo.org/show_bug.cgi?id=486426
and http://redmine.lighttpd.net/issues/2515
Autobuilders didn't hit it yet, but i did.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...ile.patch => lighttpd-01-Fix-default-config-file.patch} |  0
 package/lighttpd/lighttpd-02-mod_extforward.patch          | 14 ++++++++++++++
 2 files changed, 14 insertions(+)
 rename package/lighttpd/{lighttpd-Fix-default-config-file.patch => lighttpd-01-Fix-default-config-file.patch} (100%)
 create mode 100644 package/lighttpd/lighttpd-02-mod_extforward.patch

diff --git a/package/lighttpd/lighttpd-Fix-default-config-file.patch b/package/lighttpd/lighttpd-01-Fix-default-config-file.patch
similarity index 100%
rename from package/lighttpd/lighttpd-Fix-default-config-file.patch
rename to package/lighttpd/lighttpd-01-Fix-default-config-file.patch
diff --git a/package/lighttpd/lighttpd-02-mod_extforward.patch b/package/lighttpd/lighttpd-02-mod_extforward.patch
new file mode 100644
index 0000000..3efd2b1
--- /dev/null
+++ b/package/lighttpd/lighttpd-02-mod_extforward.patch
@@ -0,0 +1,14 @@
+From http://redmine.lighttpd.net/issues/2515
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- a/src/mod_extforward.c	(revision 2909)
++++ b/src/mod_extforward.c	(working copy)
+@@ -439,7 +439,6 @@
+ #ifdef HAVE_IPV6
+ 		ipstr_to_sockaddr(srv, real_remote_addr, &sock);
+ #else
+-		UNUSED(addrs_left);
+ 		sock.ipv4.sin_addr.s_addr = inet_addr(real_remote_addr);
+ 		sock.plain.sa_family = (sock.ipv4.sin_addr.s_addr == 0xFFFFFFFF) ? AF_UNSPEC : AF_INET;
+ #endif
-- 
1.8.1.5

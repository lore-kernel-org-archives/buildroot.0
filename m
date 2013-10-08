From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Oct 2013 16:54:40 +0200
Subject: [Buildroot] [git commit] lighttpd: fix build failure without ipv6
Message-ID: <20131008150944.042109B98B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1fffa00852e74e839d53dbbac7a27a72e87020ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported in https://bugs.gentoo.org/show_bug.cgi?id=486426
and http://redmine.lighttpd.net/issues/2515
Autobuilders didn't hit it yet, but i did.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...h => lighttpd-01-Fix-default-config-file.patch} |    0
 package/lighttpd/lighttpd-02-mod_extforward.patch  |   14 ++++++++++++++
 2 files changed, 14 insertions(+), 0 deletions(-)

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

From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Mon, 6 Mar 2017 11:43:27 +0100
Subject: [Buildroot] [PATCH 1/1] libwebsockets: Fix build for 2.1.1
In-Reply-To: <20170306091911.05fb09c2@free-electrons.com>
References: <20170305182748.GJ24886@airbook.vandijck-laurijssen.be>
 <20170306091911.05fb09c2@free-electrons.com>
Message-ID: <20170306104327.GC24367@airbook.vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch repairs the build for libwebsockets 2.1.1

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
--
diff --git a/package/libwebsockets/lws211-lib-libwebsockets-format.patch b/package/libwebsockets/lws211-lib-libwebsockets-format.patch
new file mode 100644
index 0000000..a563048
--- /dev/null
+++ b/package/libwebsockets/lws211-lib-libwebsockets-format.patch
@@ -0,0 +1,11 @@
+--- a/lib/libwebsockets.c	2017-03-06 11:37:03.699943521 +0100
++++ b/lib/libwebsockets.c	2017-03-05 07:04:12.989997774 +0100
+@@ -642,7 +642,7 @@
+ #ifdef LWS_USE_IPV6
+ 	if (LWS_IPV6_ENABLED(vh)) {
+ 		if (!lws_plat_inet_ntop(AF_INET6, &((struct sockaddr_in6 *)ads)->sin6_addr, rip, rip_len)) {
+-			lwsl_err("inet_ntop", strerror(LWS_ERRNO));
++			lwsl_err("inet_ntop %s", strerror(LWS_ERRNO));
+ 			return -1;
+ 		}
+ 

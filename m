From: Nathaniel Roach <nroach44@gmail.com>
Date: Tue,  7 Jul 2015 00:55:45 +0800
Subject: [Buildroot] [PATCH 1/2] package/bind: Enable filter-aaaa-on-v4
	option
Message-ID: <1436201745-26872-1-git-send-email-nroach44@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows usage of the filter-aaaa-on-v4 configuration option.
This option disables responding with AAAA records when the request
	is made over ipv4. This may be useful on networks with
	ipv6 inside, but no ISP ipv6 (when combined with only
	listening on ipv4).

See https://kb.isc.org/article/AA-00576/
	Filter-AAAA-option-in-BIND-9-.html
	for more information.

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
---
 package/bind/bind.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 55b5f07..9a08461 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -26,7 +26,8 @@ BIND_CONF_OPTS = \
 	--enable-epoll \
 	--with-libtool \
 	--with-gssapi=no \
-	--enable-rrl
+	--enable-rrl \
+	--enable-filter-aaaa
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 BIND_CONF_OPTS += --enable-linux-caps
-- 
2.1.4

From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Jul 2015 07:37:49 +0200
Subject: [Buildroot] [git commit] package/bind: Enable filter-aaaa-on-v4
	option
Message-ID: <20150707062302.A021780E38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b067e2737821204ea969f72201f73604d3cd905
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This allows usage of the filter-aaaa-on-v4 configuration option.
This option disables responding with AAAA records when the request
	is made over ipv4. This may be useful on networks with
	ipv6 inside, but no ISP ipv6 (when combined with only
	listening on ipv4).

See https://kb.isc.org/article/AA-00576/
	Filter-AAAA-option-in-BIND-9-.html
	for more information.

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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

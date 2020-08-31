From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 Aug 2020 16:00:35 +0200
Subject: [Buildroot] [PATCH] package/avahi: disable introspection
Message-ID: <20200831140035.5880-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/b9bf7cea8be9231552a10e8ea828bf24394402ba/

Building with introspection (together with D-Bus) support currently fails.
Fixing it is not trivial, so explicitly disable introspection for now.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/avahi/avahi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 73db37545f..eef05f0d2f 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -35,6 +35,7 @@ AVAHI_CONF_OPTS = \
 	--disable-mono \
 	--disable-monodoc \
 	--disable-stack-protector \
+	--disable-introspection \
 	--with-distro=none \
 	--disable-manpages \
 	$(if $(BR2_PACKAGE_AVAHI_AUTOIPD),--enable,--disable)-autoipd \
-- 
2.20.1

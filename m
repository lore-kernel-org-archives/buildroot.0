From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 20 Sep 2016 17:27:44 -0300
Subject: [Buildroot] [PATCH 2/2] libglib2: add host-util-linux for host
	variant
In-Reply-To: <1474403264-16066-1-git-send-email-gustavo@zacarias.com.ar>
References: <1474403264-16066-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1474403264-16066-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's required now, fixes:
http://autobuild.buildroot.net/results/e81/e81f98561867d370115a019284682c0611796978/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libglib2/libglib2.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 5bc6ed5..f199a4a 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -105,7 +105,12 @@ LIBGLIB2_DEPENDENCIES = \
 	libffi pcre util-linux zlib $(if $(BR2_NEEDS_GETTEXT),gettext)
 
 HOST_LIBGLIB2_DEPENDENCIES = \
-	host-gettext host-libffi host-pcre host-pkgconf host-zlib
+	host-gettext \
+	host-libffi \
+	host-pcre \
+	host-pkgconf \
+	host-util-linux \
+	host-zlib
 
 LIBGLIB2_CONF_OPTS = \
 	--with-pcre=system
-- 
2.7.3

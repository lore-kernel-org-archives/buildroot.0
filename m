From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 14 Mar 2017 11:46:26 +0000
Subject: [Buildroot] [PATCH 1/3] libgtk3: remove non-existent configure
	options
Message-ID: <20170314114628.10147-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From config.log:

configure: WARNING: unrecognized options: --disable-doc, --disable-docs,
--disable-documentation, --with-xmlto, --with-fop, --enable-ipv6,
--enable-gtk2-dependency, --disable-introspection

Remove non-existent --enable-gtk2-dependency and --disable-introspection
configure options from libgtk3.mk.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libgtk3/libgtk3.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 048029d..210f3e5 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -20,9 +20,7 @@ LIBGTK3_CONF_ENV = \
 
 LIBGTK3_CONF_OPTS = \
 	--disable-glibtest \
-	--enable-explicit-deps=no \
-	--enable-gtk2-dependency \
-	--disable-introspection
+	--enable-explicit-deps=no
 
 # Override pkg-config pkgdatadir variable, it needs the prefix
 LIBGTK3_MAKE_OPTS = \
-- 
2.10.2

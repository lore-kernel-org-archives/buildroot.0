From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Mar 2020 12:16:37 +0100
Subject: [Buildroot] [git commit] package/cups: store web-interface files
 under /usr/share/cups/doc-root
Message-ID: <20200308111041.297E38FE3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07ea16bd9ef17ef53484e43d9b4eaf32c97cf5bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The web-interface files (~1.8MB) are by default installed under
/usr/share/doc/cups, which is unfortunate as Buildroot removes usr/share/doc
in target-finalize, breaking the webui.

As a fix, store the web-interface files under /usr/share/cups/doc-root,
similar to how it is done in Debian.

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
[Peter: use --with-docdir, update description]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cups/cups.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index da6778f30a..18f01d8484 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -18,6 +18,7 @@ endef
 CUPS_PRE_CONFIGURE_HOOKS += CUPS_RUN_AUTOCONF
 
 CUPS_CONF_OPTS = \
+	--with-docdir=/usr/share/cups/doc-root \
 	--disable-gssapi \
 	--disable-pam \
 	--libdir=/usr/lib

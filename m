From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:39:26 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/cups: store
 web-interface files under /usr/share/cups/doc-root
Message-ID: <20200315103052.0C8568642F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=822067294a9949fa79e5ff6c6d8d6a434ef4a7a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

The web-interface files (~1.8MB) are by default installed under
/usr/share/doc/cups, which is unfortunate as Buildroot removes usr/share/doc
in target-finalize, breaking the webui.

As a fix, store the web-interface files under /usr/share/cups/doc-root,
similar to how it is done in Debian.

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
[Peter: use --with-docdir, update description]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 07ea16bd9ef17ef53484e43d9b4eaf32c97cf5bc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cups/cups.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 904a55f1e1..dd74a6cfc5 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -23,6 +23,7 @@ CUPS_CONF_OPTS = \
 	--without-perl \
 	--without-java \
 	--without-php \
+	--with-docdir=/usr/share/cups/doc-root \
 	--disable-gssapi \
 	--disable-pam \
 	--libdir=/usr/lib

From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 19:28:30 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/bind: drop
 unrecognized option
Message-ID: <20210227182008.0CCBD814CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de4086e2cafa560355659d3ef8fe2be008f29c5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Drop --enable-newstats option which is not recognized

Unrecognized options:
    --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --disable-dependency-tracking, --disable-nls, --enable-newstats

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a2be92afc28fa006f17a7a01d93f75d3611b7212)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 4098f948a9..0df2467bc5 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -47,7 +47,7 @@ BIND_CONF_OPTS += --disable-linux-caps
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
-BIND_CONF_OPTS += --with-libxml2=$(STAGING_DIR)/usr --enable-newstats
+BIND_CONF_OPTS += --with-libxml2=$(STAGING_DIR)/usr
 BIND_DEPENDENCIES += libxml2
 else
 BIND_CONF_OPTS += --with-libxml2=no

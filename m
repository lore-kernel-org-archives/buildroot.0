From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Mar 2016 14:30:04 +0100
Subject: [Buildroot] [git commit] libpjsip: disable all bundled third party
	libraries
Message-ID: <20160317133014.35034817E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9db9a6d2b3c59583366cc259a6602f1f0b053011
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libpjsip bundles several third party libraries. In Buildroot we prefer
either not to build them or to depend on a proper package for each of
them. The current recipe disables most of them, but not all, so
disable the remaining ones.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpjsip/libpjsip.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 56d6f2b..730d9fe 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -24,6 +24,8 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-resample \
 	--disable-video \
 	--disable-opencore-amr \
+	--disable-g7221-codec \
+	--disable-ilbc-codec \
 	--with-external-srtp=$(STAGING_DIR)/usr
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 12 May 2011 23:40:05 +0200
Subject: [Buildroot] [git commit] dropbear: remove shared config.cache
	workaround
Message-ID: <20110512214023.A7361834B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=635b6a17ddd407c8c099752d6cc6950d4da26d88
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the shared config.cache handling has been removed.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dropbear/dropbear.mk |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index fab7c96..b36c278 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -9,11 +9,6 @@ DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.gz
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_DEPENDENCIES = zlib
 DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
-# configure misdetects this as no, but the result is not used for
-# anything. Unfortunately it breaks the build for other packages also
-# checking for struct sockaddr_storage when using a shared config
-# cache, so force it to yes
-DROPBEAR_CONF_ENV = ac_cv_type_struct_sockaddr_storage=yes
 DROPBEAR_MAKE =	$(MAKE) MULTI=1 SCPPROGRESS=1 \
 		PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
 
-- 
1.7.3.4

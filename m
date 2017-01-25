From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 16:39:26 +1300
Subject: [Buildroot] [git commit] package/libpjsip: drop path to staging to
	find libsrtp
Message-ID: <20170125033934.B359881829@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8234472000fb7d429dd680f9949d1059519276c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As it happens, specifying the path where to look for libsrtp is not
needed: pjsip does not use the argument to --with-external-srtp as a
search path at all; it only checks whether it is 'no' or something
else.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpjsip/libpjsip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 70dd4aa..eb50f00 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -52,7 +52,7 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-ipp \
 	--disable-ssl \
 	--disable-silk \
-	--with-external-srtp=$(STAGING_DIR)/usr
+	--with-external-srtp
 
 # Note: aconfigure.ac is broken: --enable-epoll or --disable-epoll will
 # both enable it. But that's OK, epoll is better than the alternative,

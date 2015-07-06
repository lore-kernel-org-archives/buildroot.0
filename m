From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 17:47:56 +0200
Subject: [Buildroot] [git commit] squid: add gnutls support
Message-ID: <20150706154818.ECF1A818B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=07f484e13c7c52027a789f56c9c42862480094a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A new --without-gnutls option has been added to configure, so let's use
it in order to enable or disable gnutls support in squid.

Related:

  http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.6-RELEASENOTES.html#ss4.1

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squid/squid.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 469fb1b..80235a4 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -62,6 +62,13 @@ SQUID_CONF_OPTS += --with-openssl
 SQUID_DEPENDENCIES += openssl
 endif
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+SQUID_CONF_OPTS += --with-gnutls
+SQUID_DEPENDENCIES += gnutls
+else
+SQUID_CONF_OPTS += --without-gnutls
+endif
+
 define SQUID_CLEANUP_TARGET
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, \
 		RunCache RunAccel)

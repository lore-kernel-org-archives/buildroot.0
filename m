From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 17:57:37 +0200
Subject: [Buildroot] [git commit] squid: explicitly disable openssl support
	when BR2_PACKAGE_OPENSSL != y
Message-ID: <20150706155747.5D7928188C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=057dad9c5ff04ff1ea322e049276951d549bf898
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squid/squid.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 80235a4..e201673 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -60,6 +60,8 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SQUID_CONF_OPTS += --with-openssl
 SQUID_DEPENDENCIES += openssl
+else
+SQUID_CONF_OPTS += --without-openssl
 endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)

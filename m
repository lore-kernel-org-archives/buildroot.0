From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:33 -0000
Subject: [Buildroot] [git commit branch/next] ndisc6: fix build when libintl
	is enabled
Message-ID: <20120802195231.CC44796FF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b6f3f2645a50a115c974cdc6dd0e2d8b96837b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ndisc6/ndisc6.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index 8451e06..7cf4b8a 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -10,6 +10,11 @@ NDISC6_SITE = http://www.remlab.net/files/ndisc6/
 NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=gnu99"
 NDISC6_CONF_OPT = --localstatedir=/var --disable-rpath --disable-suid-install
 
+ifeq ($(BR2_PACKAGE_LIBINTL),y)
+NDISC6_DEPENDENCIES += libintl
+NDISC6_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lintl"
+endif
+
 NDISC6_BIN_ += dnssort # perl script
 NDISC6_BIN_$(BR2_PACKAGE_NDISC6_NAME2ADDR) += name2addr addr2name
 NDISC6_BIN_$(BR2_PACKAGE_NDISC6_TCPSPRAY) += tcpspray tcpspray6

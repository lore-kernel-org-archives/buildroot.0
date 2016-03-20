From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 23:05:37 +0100
Subject: [Buildroot] [git commit] zeromq: add explicit --without-pgm when
	pgm is disabled
Message-ID: <20160320220806.0399B8080F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cfdaf95f755a4032e66c7134b441e11a599c5b18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zeromq/zeromq.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index fbc63a7..871f37c 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -38,6 +38,8 @@ endif
 ifeq ($(BR2_PACKAGE_ZEROMQ_PGM),y)
 ZEROMQ_DEPENDENCIES += host-pkgconf openpgm
 ZEROMQ_CONF_OPTS += --with-pgm
+else
+ZEROMQ_CONF_OPTS += --without-pgm
 endif
 
 # ZeroMQ uses libsodium if it's available.

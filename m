From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 May 2017 21:55:10 +0200
Subject: [Buildroot] [git commit] package/c-icap: fix berkeleydb configure
	option
Message-ID: <20170522195515.2F7B8828FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d1234dab8ae714ebb52fd78d075f084a410b338
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure option controlling berkeleydb support got its current
name in 2009: https://sourceforge.net/p/c-icap/code/322/

This patch fixes a configure warning:

configure: WARNING: unrecognized options: [...] --without-berkeleydb, [...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/c-icap/c-icap.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index 17f3459..466d08b 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -29,10 +29,10 @@ C_ICAP_CONF_ENV = ac_cv_10031b_ipc_sem=yes ac_cv_fcntl=yes
 C_ICAP_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
-C_ICAP_CONF_OPTS += --with-berkeleydb
+C_ICAP_CONF_OPTS += --with-bdb
 C_ICAP_DEPENDENCIES += berkeleydb
 else
-C_ICAP_CONF_OPTS += --without-berkeleydb
+C_ICAP_CONF_OPTS += --without-bdb
 endif
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
